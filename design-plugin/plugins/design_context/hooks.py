#!/usr/bin/env python3
"""
Design Context Enhancer — 设计标准自动注入。

方案B（轻量版）：每次 pre_llm_call 时注入设计核心标准：
  - 门禁红线（GATE 0-3，防翻车）
  - 排版布局方法（信息层级/8pt网格/字号行高行长/留白——保好看）

让 agent 默认就带设计标准 + 排版方法——不是等用户说"改样式"才触发。

HERMES_HOME 感知：非默认 profile 会话时，从
$HERMES_HOME/skills/creative/designer/SKILL.md 读取，而非硬编码 ~/.hermes。

Fail-open：任何失败返回空，不阻断主流程。无数据库依赖。
"""
import os
import re
import sys


def _hermes_home() -> str:
    """确定 Hermes 根目录（profile 感知，不硬编码 ~/.hermes）。"""
    env = os.environ.get("HERMES_HOME")
    if env:
        return env
    return os.path.expanduser("~/.hermes")


def _load_designer_core() -> str:
    """读取 designer skill 主入口 + 排版布局原理的核心（常驻注入部分）。"""
    root = _hermes_home()
    # 优先从 skill 自包含包读，回退到设计知识库
    candidates = [
        os.path.join(root, "skills", "creative", "designer", "SKILL.md"),
        os.path.join(root, "design-kb", "L1-principles", "_INDEX.md"),
    ]
    for path in candidates:
        try:
            if os.path.exists(path):
                with open(path, encoding="utf-8") as f:
                    return f.read()
        except Exception:
            continue
    return ""


# 排版布局核心方法（常驻注入，来自 principles-layout + principles-typography）
# 这部分是"保好看"的方法论，不是防翻车的红线
_LAYOUT_TYPO = """
## 排版布局方法（保好看）
信息层级优先级：位置 > 字号 > 颜色 > 字重 > 留白。页面字号档 ≤ 4 档，标题 ≤ 4 档。
8pt 网格：所有尺寸落 8 的倍数（4/8/12/16/24/32/48/96），禁 6/10/14/18/20/22 非4倍数间距。
间距阶梯（全站唯一）：组内 8 / 组间 16-24 / 区块 24-32 / 页面节 48-96。能用间距分组，就少用分隔线。
网格列：营销/常规 12 列，数据后台/复杂表单 24 列。列间距 16-24px，容器 >24px。
视觉流：信息密集(F型——关键词/数字放每行开头，操作按钮放左上)；营销首屏(Z型——品牌左上+主CTA右下)。
留白：主动设计非空。重要元素靠"周围留白多"强调，不是加粗变红。留白必须落栅格线。
排版：标题行高 1.05-1.25，正文行高 1.5-1.7（中文 1.7 更安全），说明文字 1.4。
字号阶梯：64/48/32/24/20/16/14/12/10。正文基准 16px。行长英文 45-75 字符/中文 28-45 字，max-width:65ch。
字重：相邻层级字重差 ≥100（400 对 600/700，禁 400 对 500 暧昧）。大标题可用轻字重(300/400)+紧字距出气势。
中文字：行高比英文放大 0.1-0.2；正文禁等宽体；深色+<13px 易糊需配字重。
"""


def pre_llm_call(messages=None, user_message="", **kwargs):
    """pre_llm_call hook — 注入设计核心标准 + 排版布局方法。Fail-open。"""
    try:
        core = _load_designer_core()
        if not core:
            return None
        context = (
            "\n\n[设计标准常驻注入 · designer]\n"
            "作为有设计标准的 agent，做任何 UI/前端/视觉时先记住：\n"
            "【红线 · 防翻车】\n"
            "1. 参考优先：说\"高级/好看\"先问 Linear/Stripe/Vercel/Claude（GATE 0）\n"
            "2. 克制装饰：禁渐变/彩色glow/装饰条/emoji图标（GATE 1）\n"
            "3. 颜色只用语义 token，禁裸 hex；用现成库，禁手搓（GATE 1）\n"
            "4. 图表禁假数据 Math.sin/random（最严重错误，GATE 1）\n"
            "5. 改完必须截图验证（GATE 2）；提交前 tsc/build 零错误（GATE 3）\n"
            "完整参考库（20 个设计系统）见 design-kb/L1-principles/reference-*.md，按 _INDEX 查。\n"
            + _LAYOUT_TYPO +
            "\n"
        )
        return {"context": context}
    except Exception as e:
        print(f"[DESIGN-CTX-WARN] inject failed: {e}", file=sys.stderr)
        return None


def on_session_start(session_id="", platform="", **kwargs):
    """on_session_start — 会话开始注入。"""
    try:
        return {"context": "设计标准已就绪（designer skill）。做 UI/前端时按 GATE 0-3：先问参考/只用语义token/截图验证/编译通过。排版布局用 8pt 网格 + 信息层级 + 正确行高行长。"}
    except Exception:
        return None
