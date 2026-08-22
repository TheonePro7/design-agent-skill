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

## 〇、加载时必做（4 步）

1. **定位知识库**：`~/.hermes/design-kb/`（若不存在，从本 skill 的 `references/` 重建）
2. **加载 L1 核心**：读 `L1-principles/_INDEX.md` + `assets-index.md`（素材库必查）
3. **智能加载 L2 项目**：见下方『L2 项目规范智能管理』——按项目状态选 询问/提取/复用
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

## 五·五、L2 项目规范智能管理（核心智能，A-E 全增强）

> ⚠️ 这是 skill 智能性的关键。不要机械地"复制模板"，要按项目**真实状态**决定动作。
> 智能 5 件套：A 跨项目复用 / B token冲突检测 / C 自动生成DESIGN.md / D 反馈闭环主驱动 / E 版本化。

### 决策树（含 A 跨项目复用）

```
项目 L2-projects/<project>.md 存在吗？
│
├─ ❌ 不存在 = 冷启动（新项目）→ 走【路径A · 询问】
│    └─ 同时【增强A】扫描 L2-projects/ 找最像的已建项目，复用其 token 作为起点
│
└─ ✅ 存在 = 有基础
     └─ 项目代码匹配当前 token 吗？
        ├─ ✅ 匹配 = 直接复用（什么都不做）
        └─ ❌ 不匹配/已演化 = 走【路径B · 提取】→ 触发【增强B/C/D/E】
```

### 路径A · 冷启动：先问用户设计风格（不猜）+ 复用兄弟项目

新项目无 token 时，**必须询问用户**，而不是自己捏造。问 3 个问题：

1. **参考哪个系统？**（Linear 暗色后台 / Stripe 营销 / Vercel 极简 / Claude 暖色）
2. **明暗模式？**（深色 / 浅色 / 跟随系统）
3. **品牌色？**（主色 + 强调色，用户给 hex 或从 logo/品牌图提取）

**增强A · 跨项目复用**（做完 3 问后）：
```bash
# 扫描 L2-projects/ 找参考系统相同的兄弟项目
grep -l "参考系统.*Linear\|参考系统.*Stripe\|参考系统.*Claude" L2-projects/*.md 2>/dev/null
```
若找到兄弟项目（如 kuaishou 和 xgeo 同为 Linear 暗色），**以它的 token 为起点**，只改品牌色等差异项，不从零造。这样跨项目风格自动统一，且省时。

### 路径B · 已有基础：自动整理 token

项目已有设计基础（tailwind.config / index.css / 自建组件），**自动扫描提取**整理成标准 token：

```bash
# 1. 扫描 tailwind 配置 / CSS 变量
grep -nE "colors:|backgroundColor|#[0-9a-fA-F]{6}|rgba\(" tailwind.config.* src/index.css 2>/dev/null | head -30

# 2. 扫描已有组件用的颜色/字号
grep -rnoE "(text|bg|border)-(ink|muted|accent|line|surface|raised)\b|text-\[[0-9]+px\]" src/components/ui/*.tsx 2>/dev/null | sort -u | head -30
```

提取后整理成标准 L2 结构，每个 token 标注来源：
- `✦ 用户确认`（用户明确给的）
- `⚙ 从 tailwind.config 提取`
- `✎ 从 index.css 提取`

**增强B · token 冲突检测**（提取时对照 L1 原理）：
```bash
# 检测项目是否用了 L1 禁用的样式（渐变/彩色glow/emoji图标/手搓table）
grep -rn "linear-gradient\|box-shadow" src/ --include="*.tsx" --include="*.css" 2>/dev/null | head
grep -rn "<table" src/ --include="*.tsx" 2>/dev/null | head
```
命中 → 在 L2 里标记 `⚠️ 冲突` 并给出替代方案（如渐变→发丝边框，手搓table→OpsDataTable）。**不擅自改用户代码，只警告**。

⚠️ **实测教训（2026-08-22 快手项目）**：`<table>` 命中时**先排除封装组件内部**——`components/ui/DataTable.tsx` 等封装组件**内部**用原生 `<table>` 是合法实现，不是业务手搓。判违规要看**业务页面**（非 components/ui/）是否手搓：
```bash
# 正确：只看业务页面手搓，排除封装组件
grep -rn "<table" src/ --include="*.tsx" 2>/dev/null | grep -v "components/ui/" | head
```
同理，`linear-gradient`/`box-shadow` 若出现在封装组件或图表库内部，也可能合法，需结合上下文判断。

**增强C · 自动生成项目 DESIGN.md**（提取完成后）：
把提取的 token 自动写成 `项目根目录/DESIGN.md`（不只是存 L2），供整个团队和别的 agent 直接用：
```bash
# 生成到项目根（若无则建）
cat > 项目根/DESIGN.md <<'DESIGN'
# {项目名} DESIGN
> 由 designer skill 自动提取生成，来源见各 token 标注。
（写入品牌色/参考/颜色令牌/排版/组件规范）
DESIGN
```
已是 git 仓库则 `git add DESIGN.md` 提交（若用户允许）。

**增强D · 反馈闭环主驱动**（每次设计交付后自动评估）：
设计交付不是终点——**每次设计完成后自动跑盘**：
1. `browser_vision` 截图当前效果
2. 对照 L1 原理 + L2 token 自检（颜色/层级/对比度/动效）
3. 把结果写回 `L3-lessons/corrections.md`（做对了记表扬，踩坑了记纠正）

这样 L3 从"被动等用户骂"升级成"主动评估"，知识库越用越准。

**增强E · 版本化**（L2 token 带版本 + 变更历史）：
每个 L2 文件头部记录 `version` 和变更日志：
```markdown
# L2 项目规范 · {项目名}
> version: 1.1.0   # 语义化：大改=1.x 加token=0.x
> 变更：
>   1.1.0 (2026-08-22) 新增信息层级 token，品牌色微调
>   1.0.0 (2026-08-22) 首次提取
```
项目演化时 `version++` 并追加变更行，避免"改了哪页、token 怎么变的"说不清。

### 检测项目是否匹配当前 token

```bash
# 项目里用了多少 token 类 vs 裸色
grep -rc "text-ink\|text-muted\|token\|var(--)" src/ --include="*.tsx" 2>/dev/null | head
grep -rn "#[0-9a-fA-F]\{6\}" src/ --include="*.tsx" 2>/dev/null | grep -v "var(--" | head
```
若裸色远多于 token → 说明项目没接入 token 系统，走路径B 提取整理。

### 智能性自检（每次 L2 操作后问自己）

1. ✅ 我问过用户风格了吗（冷启动）？还是自己捏造了？
2. ✅ 我找过兄弟项目复用了吗（A）？还是从零造？
3. ✅ 我检测过 L1 冲突了吗（B）？还是照抄？
4. ✅ 我生成 DESIGN.md 到项目根了吗（C）？
5. ✅ 我写回反馈闭环了吗（D）？
6. ✅ 版本号 + 变更日志更新了吗（E）？

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
