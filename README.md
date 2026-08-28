# Design Agent Skill — 让任何 AI 智能体「可用且好看」

> 装一个 skill，你的 agent 立刻具备**世界级设计师**的水平：跨项目复用、不重训、自带硬门禁。
> 支持 **Claude Code / DSH (DeepSeek Harness) / Hermes / Codex** 四大平台。

## 这不是「一堆资料」，是「能直接执行的规则」

很多 AI 改界面翻车，不是模型不懂设计，而是**没有可执行的判断标准**。这个 skill 把顶级设计团队的**知识 + 工序 + 红线**蒸馏成 agent 能直接照做的规则，并配了 **4 道硬门禁**，防止它自作主张乱来。

```
【同类项目】 给你一份文档堆 → agent 看了照样乱改 UI
【本 skill】   蒸馏成可执行规则 + 门禁 → agent 先问参考、克制装饰、用真实数据
```

## 🎬 效果对比（前后 30 秒 Demo）

> 【在这里放 GIF】同一句话：「把这个页面改高级一点」
> **没装**：加渐变、加高光、塞 emoji、上假数据
> **装了**：先问你参考哪个系统 → 按规范排版 → 用现成素材 → 图表用真实数据

---

## 它给你什么（开箱即用）

| 模块 | 内容 |
|---|---|
| 🧠 设计原理 | Gestalt / 排版 / 色彩 / 交互 / 无障碍（学科共识） |
| 🔍 参考解剖 | Linear / Stripe / Vercel / Claude / Notion / Supabase / Apple / Airbnb... **20 大设计系统蒸馏**（数据来自 open-design token 实测） |
| 📦 素材库 | 图标 / 图表 / 动效 / 组件选型指南（"现成的绝不手搓"） |
| 🗂 分桶索引 | 152 个设计系统分桶（A–J 10 场景，20 个已蒸馏 + 132 备选） |
| 📐 项目规范 | 每项目一份 `DESIGN.md` + 反馈闭环 |
| 🚧 **GATE 0–3 门禁** | **硬拦截，防 AI 翻车** |

### GATE 门禁（这是它跟普通 skill 最大的区别）
- **GATE 0 · 开工前**：必须先确认参考系统，禁止未确认就全量改
- **GATE 1 · 原型**：先做 1 个给你看，确认再铺开
- **GATE 2 · 素材**：库里有的用现成的，禁止手搓
- **GATE 3 · 数据**：禁止假数据（`Math.sin()` 这类最严重错误）

---

## 安装（3 步，任选平台）

### Claude Code
```bash
git clone https://github.com/TheonePro7/design-agent-skill.git
cd design-agent-skill && bash install.sh
```
> 脚本自动把 `skills/designer/`（含 `resources/` 自包含知识库）装到 `~/.claude/skills/designer/`。

### DSH（DeepSeek Harness）
```bash
bash install-dsh.sh
# 装到 DSH 用户技能根 ~/.agents/skills/designer/
```

### Hermes
```bash
bash install-hermes.sh          # 从当前目录装
bash install-hermes.sh --update # 从 GitHub 拉最新再装
```
> Hermes 用不同 skill 格式（`references/` 而非 `resources/`），本仓库提供**独立 Hermes 安装包** `hermes/designer/`。

---

## 设计哲学（给它立规矩）
1. **参考优先**：用户说"高级/好看" → 先问参考，不猜
2. **克制装饰**：禁渐变、禁彩色 glow、禁装饰条、禁 emoji 图标
3. **不要凑合**：纯色卡、无图标输入框 = 会被骂"凑合"
4. **素材优先**：assets-index 里有的用现成的
5. **数据真实**：图表禁假数据（最严重错误）

---

## 它跟谁配
设计师的**上游**是产品经理 → 建议搭配 [`product-manager-skill`](https://github.com/TheonePro7/product-manager-skill)：先定"展示什么字段、给谁看、体验是什么"，再谈"怎么做好看"。

---

**⭐ 好用请给个 Star，欢迎 issue / PR 一起把它变得更专业。**
