---
name: designer
description: >-
  顶级设计 Agent 入口——让任意 agent 达到「可用且好看」的设计水平，跨项目复用、不重训。
  自动加载设计知识库资源（参考解剖 + 学科原理 + 素材库选型），并遵守 GATE 0-3 门禁。
  Use when user asks for UI design, frontend styling, 页面美化, design system, 改样式,
  visual/design work, 前端/界面美化, 设计规范, or wants a professional design standard.
whenToUse: >-
  触发场景：UI 设计 / 前端样式改造 / 页面美化 / 设计系统搭建 / 界面视觉 / 改样式 / 设计规范。
  用户提及"高级 / 好看 / 设计 / 样式 / UI / 界面展示效果"等视觉诉求时使用。
metadata:
  upstream: https://github.com/TheonePro7/design-agent-skill
  note: 共用目录式 skill；DSH 兼容（whenToUse / metadata）
---

# 设计 Agent 入口

> 这是「世界级设计师数字员工」的入口 skill。**完全自包含**：知识库随本 skill 打包在 `resources/` 目录，可跨机器、跨端使用，不依赖任何本机外部路径。
> 目标：让任意 AI agent 达到「可用且好看」的设计水平，跨项目复用，不重训。

## 〇、加载知识库（全部在 resources/ 下）

本 skill 自带完整设计知识库，位于 `resources/` 目录：

```
resources/
├── _INDEX.md              # 54系统分桶索引 (A-H)
├── assets-index.md        # L0素材库·选型指南（图标/图表/动效/组件）
├── reference-linear.md    # 参考解剖·暗色后台(Linear)
├── reference-stripe.md    # 参考解剖·营销落地页(Stripe)
├── reference-vercel.md    # 参考解剖·极简(Vercel)
├── reference-claude.md    # 参考解剖·暖色(Claude)
├── principles-layout.md   # 原理·布局/Gestalt/视觉流
├── principles-typography.md  # 原理·排版
├── principles-color.md    # 原理·色彩/WCAG对比度
├── principles-interaction.md # 原理·交互/动效
└── principles-a11y.md     # 原理·无障碍
```

**加载步骤**：读 `_INDEX.md` 判断场景 → 读对应 `reference-*.md` 选参考 → 读 `principles-*.md` 取原理 → 查 `assets-index.md` 选素材。

## 一、动手前必查（选型）

**先查 `assets-index.md`，现成的绝不手搓：**

| 需求 | 选 |
|:--|:--|
| 图标 | Lucide |
| 图表 | Recharts（已全局深色） |
| 动效 | react-bits 8个现成组件 |
| 弹窗/下拉/进度 | shadcn/ui + Radix |
| 表格 | TanStack OpsDataTable |
| 操作反馈 | sonner toast |
| 整页三态 | OpsState |
| 危险确认 | ConfirmModal |

## 二、核心设计哲学（先记这 5 条）

1. **参考优先**：用户说"高级/好看"时，先问参考（Linear/Stripe/Vercel/Claude），不猜
2. **克制装饰**：禁渐变、禁彩色glow、禁::before装饰条、禁emoji图标
3. **不要凑合**：半成品（纯色卡、无图标输入框）会被骂"凑合"
4. **素材优先**：assets-index 里有的用现成的，不手搓
5. **数据真实**：图表禁 `Math.sin()` 假数据（最严重错误）

> **上游衔接**：若已有 `product-manager`（上游）产出的 PRD / 字段清单 / 用户旅程，**直接用其作为内容来源**，把已定义的内容做「好看」即可；**不要越权重走**客户理解/商业分析等 PM 流程。

## 三、门禁 / 硬拦截（设计流程强制关卡）

> ⚠️ 这 4 道门禁是硬性规则，**不通过就不许进入下一步**。

### GATE 0 · 开工前（先问，不猜）
- [ ] **必须确认参考系统**：用户说"高级/好看/设计" → 先问 Linear/Stripe/Vercel/Claude
- [ ] **禁止未确认就全量改**——先做 1 个原型给用户看，确认再铺开
- [ ] 若不确认就动手 → **硬拦截**：停下，问参考

### GATE 1 · 实现中（禁违反红线）
- [ ] **颜色只用语义 token**——禁裸 hex、禁 `var(--color-*)`
- [ ] **表格/图标/弹窗/动效用现成库**——禁手搓（查 assets-index.md）
- [ ] **禁假数据**——图表引真实 API，`Math.sin()`/随机数 = 最严重错误
- [ ] **禁过度装饰**——无渐变、无彩色glow、无::before色条、无emoji图标
- [ ] 违反任一条 → **硬拦截**：回退，改用标准做法

### GATE 2 · 验收前（先看，再提交）
- [ ] **必须先截图验证**（browser_vision）看实际效果，不盲改
- [ ] **卡片 vs 面板对比度** ≥8pt RGB 差
- [ ] **hover 只变边框/背景**，不加 glow/渐变
- [ ] 未截图验证就提交 → **硬拦截**：先截屏确认

### GATE 3 · 提交前（编译通过）
- [ ] `tsc --noEmit` 零错误
- [ ] 只改用户要改的，不借机扩大范围
- [ ] 编译失败 → **硬拦截**：修到通过

## 四、L2 项目规范智能管理

新项目判断设计 token 时：

- **冷启动（无 token）** → 问用户 3 问（参考系统/明暗/品牌色）→ 据回答生成项目 token
- **已有基础** → 扫描项目 tailwind.config/index.css 等，自动提取 token 整理成规范
- **跨项目复用** → 找参考系统相同的兄弟项目作起点

## 五、端到端自检（每次设计交付前跑）

```bash
# 1. 编译
npx tsc --noEmit   # 必须 0 错误

# 2. 硬编码审计（禁裸色）
grep -rn "#[0-9a-fA-F]\{6\}\|rgba(" src/ --include="*.tsx" | grep -v "var(--" | head

# 3. 假数据审计（禁 Math.sin）
grep -rn "Math\.sin\|Math\.random" src/ --include="*.tsx" | head

# 4. 手搓表格审计（应现用 OpsDataTable）
grep -rln "<table" src/ --include="*.tsx" | head
```

**任一返回非空 = 违反门禁，必须修复后再交付。**
