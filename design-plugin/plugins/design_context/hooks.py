#!/usr/bin/env python3
"""
Design Context Enhancer — 设计标准自动注入。

方案B（轻量版）：每次 pre_llm_call 时，从 designer skill 主入口读取
设计核心哲学 + GATE 0-3 门禁，注入到 agent 上下文。
让 agent 默认就带设计标准——不是等用户说"改样式"才触发。

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
    """读取 designer skill 主入口的核心哲学 + GATE 门禁（常驻注入部分）。"""
    root = _hermes_home()
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


def _extract_injectable(core: str) -> str:
    """提取关键节（核心设计哲学 + GATE 门禁），保持注入轻量。"""
    if not core:
        return ""
    sections = []
    patterns = [
        (r"##\s*四、核心设计哲学.*?(?=##\s|$)", "核心哲学"),
        (r"##\s*七、门禁.*?(?=##\s|$)", "GATE 门禁"),
        (r"##\s*五、项目工作流.*?(?=##\s|$)", "工作流"),
    ]
    for pat, _label in patterns:
        m = re.search(pat, core, re.S)
        if m:
            sections.append(m.group(0).strip())
    if sections:
        return "\n\n".join(sections)[:3000]
    return core[:3000]


def pre_llm_call(messages=None, user_message="", **kwargs):
    """pre_llm_call hook — 注入设计核心标准。Fail-open。"""
    try:
        core = _load_designer_core()
        if not core:
            return None
        injected = _extract_injectable(core)
        if not injected.strip():
            return None
        context = (
            "\n\n[设计标准常驻注入 · designer]\n"
            "作为有设计标准的 agent，做任何 UI/前端/视觉时先记住：\n"
            "1. 参考优先：说\"高级/好看\"先问 Linear/Stripe/Vercel/Claude（GATE 0）\n"
            "2. 克制装饰：禁渐变/彩色glow/装饰条/emoji图标（GATE 1）\n"
            "3. 颜色只用语义 token，禁裸 hex；用现成库，禁手搓（GATE 1）\n"
            "4. 图表禁假数据 Math.sin/random（最严重错误，GATE 1）\n"
            "5. 改完必须截图验证（GATE 2）；提交前 tsc/build 零错误（GATE 3）\n"
            "完整参考库（20 个设计系统）见 design-kb/L1-principles/reference-*.md，按 _INDEX 查。\n"
            "---\n"
            + injected
            + "\n"
        )
        return {"context": context}
    except Exception as e:
        print(f"[DESIGN-CTX-WARN] inject failed: {e}", file=sys.stderr)
        return None


def on_session_start(session_id="", platform="", **kwargs):
    """on_session_start — 会话开始注入。"""
    try:
        core = _load_designer_core()
        if not core:
            return None
        return {"context": "设计标准已就绪（designer skill）。做 UI/前端时按 GATE 0-3：先问参考/只用语义token/截图验证/编译通过。"}
    except Exception:
        return None
