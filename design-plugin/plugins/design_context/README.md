# design_context — 设计标准自动注入插件

> 让 agent **默认带设计标准**，无需打 /skill 手动触发。
> 每次 `pre_llm_call` 自动注入「设计核心哲学 + GATE 0-3 门禁」到上下文。

## 装了什么

- `hooks.py` — `pre_llm_call` 注入设计核心标准 + `on_session_start` 注入就绪提示
- `plugin.yaml` — 声明 `provides_hooks`
- `__init__.py` — `register(ctx)` 注册两个 hook
- `HERMES_HOME` 感知 — 非默认 profile 也会读到 designer skill

## 注入的核心标准（每次对话自带）

```
1. 参考优先：说"高级/好看"先问 Linear/Stripe/Vercel/Claude（GATE 0）
2. 克制装饰：禁渐变/彩色glow/装饰条/emoji图标（GATE 1）
3. 颜色只用语义 token，禁裸 hex；用现成库，禁手搓（GATE 1）
4. 图表禁假数据 Math.sin/random（最严重错误，GATE 1）
5. 改完必须截图验证（GATE 2）；提交前 tsc/build 零错误（GATE 3）
```

复杂参考（20 个设计系统）不常驻，按 `design-kb/L1-principles/_INDEX.md` 按需读。

## 安装

```bash
bash install-design-plugin.sh            # 本机启用
bash install-design-plugin.sh --update  # 从 GitHub 拉最新
```

装完**重启 Hermes** 生效。

## 和 PM 的关系

- `design_context` = 设计标准自动注入（本插件）
- `pm_context` = 产品经理思维自动注入（见 product-manager-skill 仓库）
- 两者叠加 = agent 同时带 PM 视角（先定字段）+ 设计标准（做好看）
