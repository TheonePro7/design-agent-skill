---
name: designer
description: "顶级设计 Agent 入口——自动加载 L1 设计知识库 + L0 素材库，按项目 DESIGN.md 工作，尊重反馈闭环。做任何 UI/前端/设计时先加载。跨机器可移植：知识随包带，通用库自动装。"
version: 1.0.0
author: Hermes Agent
platforms: [windows, linux, macos]
---
# 设计 Agent 入口

> 这是「世界级设计师数字员工」的入口 skill。
> 目标：让任意 AI agent（Hermes / Claude Code / Codex）达到「可用且好看」的设计水平，跨项目复用，不重训。

---

## 〇、加载时必做（3 步）

1. **定位知识库**：`~/.hermes/design-kb/`（若不存在，从本 skill 的 `references/` 重建）
2. **加载 L1 核心**：读 `L1-principles/_INDEX.md` + `assets-index.md`（素材库必查）
3. **加载 L2 项目**：读对应项目的 `L2-projects/<project>.md`（有则用，无则新建）
4. **读 L3 教训**：读 `L3-lessons/corrections.md`（避免重复踩坑）

---

## 一、知识库路径

```
~/.hermes/design-kb/
├── L1-principles/          # 通用知识（纯文本，天然跨机）
│   ├── _INDEX.md           # 54系统分桶索引 (A-H)
│   ├── assets-index.md     # L0素材库·选型指南（图标/图表/动效/组件）
│   ├── principles-*.md     # 学科原理（布局/排版/色彩/交互/无障碍）
│   └── reference-*.md      # 参考解剖（Linear/Stripe/Vercel/Claude）
├── L2-projects/            # 每项目一份 DESIGN.md（品牌色/字体/组件）
└── L3-lessons/
    └── corrections.md      # 用户纠正记录（反馈闭环）
```

---

## 二、动手前必查（选型）

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

---

## 三、通用库自动安装（跨机）

读 `manifest.json` → 检查目标项目缺啥 → `pnpm add` 自动装。

```bash
# 缺 lucide 图标库
pnpm add lucide-react
# 缺图表
pnpm add recharts
# 缺动效
pnpm add framer-motion gsap
```

---

## 四、核心设计哲学（先记这 5 条）

1. **参考优先**：用户说"高级/好看"时，先问参考（Linear/Stripe/Vercel），不猜
2. **克制装饰**：禁渐变、禁彩色glow、禁::before装饰条、禁emoji图标
3. **不要凑合**：半成品（纯色卡、无图标输入框）会被骂"凑合"
4. **素材优先**：assets-index 里有的用现成的，不手搓
5. **数据真实**：图表禁 `Math.sin()` 假数据（最严重错误）

---

## 五、项目工作流（每一步都要做）

1. **判断场景** → `_INDEX.md` 查 A~H 哪一桶
2. **加载参考** → 读对应 reference-*.md（暗色后台=Linear，营销=Stripe...）
3. **读项目 DESIGN.md** → L2 的 token/字体/组件
4. **查素材库** → assets-index.md 选现成库/组件
5. **动手实现** → 遵守 L1 原理 + 项目规范
6. **截图验证** → browser_vision 看效果再提交
7. **读取教训** → corrections.md 避免重复踩坑

---

## 六、扩展：怎么训练另一个 agent

把这个 skill + 整个 `design-kb/` 目录拷贝到目标机器：
- 通用库 → manifest.json 自动装
- 知识 → 纯文本天然带
- 自研组件 → 按目标项目 token 适配（非拷贝）

---

## 七、门禁 / 硬拦截（设计流程强制关卡）

> ⚠️ 这 4 道门禁是硬性规则，**不通过就不许进入下一步**。每个 turn 结束前自检。

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

---

## 八、端到端自检（每次设计交付前跑）

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

---

## 相关

- 完整原理：`L1-principles/principles-*.md`
- 完整素材库：`L1-principles/assets-index.md`
- 反馈机制：`L3-lessons/corrections.md`
