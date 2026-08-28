# L1 参考解剖 · Vercel（极简开发者工具 / 纯白落地页金标准）

> 来源：open-design/design-systems/vercel（DESIGN.md + design-tokens.json）
> 用途：任何**浅色极简 SaaS / 开发者工具落地页 / 大标题概念页 / 纯白产品官网 / gallery 式留白**项目的设计基准。
> 状态：✅ 范例确认（数据基于 open-design 实测 token + DESIGN.md，**冲突一律以 token 为准**并标注 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **阴影即边框**：一切边框用 `box-shadow: 0 0 0 1px rgba(0,0,0,0.08)`，**不用** CSS `border`——阴影住在 shadow 层，圆角不被裁剪、视觉更轻更顺滑
2. **单色平台（纯白 + 近黑）**：页面纯白 `#ffffff` + 主文本近黑 `#171717`（微暖，**勿用 `#000000`**），通体无色相；彩色只在「工作流语义上下文」里出现（Develop→Preview→Ship 一步一色）
3. **三字重体系**：400（读）/ 500（交互）/ 600（标题强调），层级靠字号 + 字距而非字重；**600 为上限**，700 仅极少数 7px 微徽章特例
4. **极负字距**：display 级 `-0.05em`（48px 下即 -2.4px，极端到 -2.88px）——文字像被压缩/minified 的代码；字距**恒为负或零，绝不为正**，随字号递减逐步放松
5. **分层阴影堆栈**：卡片 = 边框层 + 软抬升层 + 环境深度层 + 内环高光层，多值堆在同一声明（`--elev-raised`）里；深度**全靠阴影分层**，不靠背景色差或实心边框
6. **内环高光不可省**：卡片阴影末层 `#fafafa 0 0 0 1px` 是整套系统「发光」的核心——没有它就不是 Vercel 卡
7. **连字即身份**：所有 Geist 文本开 OpenType `"liga"`；数字/统计用 `"tnum"` 等宽数字；Geist Mono 大写做「开发者控制台」技术标签
8. **留白即设计（gallery 式空旷）**：文字密集、四周留白辽阔（`--section-y-desktop: 96px`）；白块之间无色差变化，仅靠阴影边框 + 间距分层

## 二、颜色与结构令牌（可直接照抄）

### 颜色令牌（token 背书，照此为准）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#ffffff` | 页面背景（纯白） |
| surface | `#ffffff` | 卡片表面（与 bg 同白，平面无色差） |
| surface-warm | `var(--surface)` = `#ffffff` | 别名（B 槽位「暖表面」实测同白） |
| fg | `#171717` | 主文本 / 标题 / 深色按钮底（微暖，**勿用 `#000000`**） |
| fg-2 | `#4d4d4d` | 次级描述文本 / 正文灰 |
| muted | `#666666` | 三级文本 / 弱化链接 |
| meta | `#808080` | 占位 / 禁用态 |
| border | `rgba(0, 0, 0, 0.08)` | 默认「边框」——shadow-as-border 基底色 |
| border-soft | `rgba(0, 0, 0, 0.04)` | 微边框 / 软抬升 |
| accent | `#0070f3` | 链接 / 强调 / 焦点环色 ⚠️（DESIGN.md Link Blue `#0072f5` 未被 token 背书，**以 `#0070f3` 为准**） |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` | accent hover（加深 8%） |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` | accent 按下（加深 14%） |
| success | `#16a34a` | 成功状态（token 存在，DESIGN.md 未提及） |
| warn | `#eab308` | 警告 |
| danger | `#dc2626` | 危险 / 删除 |

**阴影令牌（深度主体）**：`elev-flat` `none`（页面/文本块）；`elev-ring` `0 0 0 1px var(--border)`（shadow-as-border）；`elev-raised` `0 0 0 1px rgba(0,0,0,0.08), 0 2px 2px rgba(0,0,0,0.04), 0 8px 8px -8px rgba(0,0,0,0.04), 0 0 0 1px #fafafa`（全卡）；`focus-ring` `0 0 0 2px var(--accent)` ⚠️（DESIGN.md 用 `hsla(212,100%,48%,1)`，**以 accent 为准**）。

### DESIGN.md 补充色（token 未覆盖，保留）

| 名称 | 值 | 用途 / 说明 |
|:--|:--|:--|
| ship-red | `#ff5b4f` | 工作流语义色 · Ship（**仅此场景**） |
| preview-pink | `#de1d8d` | 工作流语义色 · Preview（**仅此场景**） |
| develop-blue | `#0a72ef` | 工作流语义色 · Develop（**仅此场景**） |
| console-purple | `#7928ca` | 代码语法高亮紫 |
| console-pink | `#eb367f` | 代码语法高亮粉 |
| badge-bg / badge-text | `#ebf5ff` / `#0068d6` | 药丸徽章背景 / 文字 |
| ring-border | `#ebebeb` | 浅灰 ring-边框（tab / 图片 / 次级按钮） |
| surface-tint / 内环 | `#fafafa` | 卡片内环高光（shadow 末层，不可省） |

> **工作流语义色规则**：红/粉/蓝只在标识 Develop→Preview→Ship 三个阶段时出现，**绝不用于 UI chrome 装饰**、不用于全局强调。

### 布局 / 结构令牌（token 背书）

- **间距**：space-1 `4px`、space-2 `8px`、space-3 `12px`、space-4 `16px`、space-5 `20px`、space-6 `24px`、space-8 `32px`、space-12 `48px`。⚠️（DESIGN.md 称主刻度跳过 20/24px，但 token 有 space-5=20、space-6=24，**以 token 为准**）
- **区块间距**：section-y desktop `96px` / tablet `64px` / phone `48px`。⚠️（DESIGN.md 称 80–120px+，**以 96/64/48 为准**）
- **圆角**：radius-sm `6px` / md `8px` / lg `12px` / pill `9999px`。（DESIGN.md 另列 2/4/64/100/50%，token 未覆盖——按 DESIGN.md 补充：micro 2 内联码、large 64 tab 药丸、xl 100 导航、circle 50% 头像/菜单）
- **容器**：container-max `1200px`；gutter desktop `24px` / tablet `16px` / phone `12px`。

## 三、排版（Geist + Geist Mono，全局 liga）

**字体栈（token 准）**：主字体 `"Geist", "Geist Sans", -apple-system, "Segoe UI", Arial, sans-serif` ⚠️（DESIGN.md 回退序列含 `Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol`，以 token 为准）；等宽 `"Geist Mono", ui-monospace, "SF Mono", "Roboto Mono", Menlo, Monaco, "Liberation Mono", "DejaVu Sans Mono", "Courier New", monospace`。
**所有 Geist 文字**开 `font-feature-settings: "liga"`；数字/统计开 `"tnum"` 等宽数字。三字重：400 读 / 500 交互 / 600 宣告；**禁 700**（除 7px 微徽章特例）。

| Token | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| text-4xl | 48px | 600 | 1.10 (tight) | -0.05em（-2.4px，极端 -2.88px） | Hero 大标题（最大压缩） |
| text-3xl | 40px | 600 | 1.10 | -0.05em（-2.0px） | Section 标题 |
| text-2xl | 32px | 600（轻子标题 400） | 1.25 | -0.04em（-1.28px） | 子区 / 卡片类标题 |
| text-xl | 24px | 600 | 1.33 | -0.04em（-0.96px） | 特性卡片标题 |
| text-lg | 20px | 400 | 1.80 (relaxed) | normal | 导语 / 特性描述 |
| text-base | 16px | 400（/500 强调） | 1.50 | normal | 正文 / UI 文本 |
| text-sm | 14px | 500（/400） | 1.43 | normal | 按钮 / 链接 / 字幕 |
| text-xs | 12px | 400–500 | 1.33 | normal | 元数据 / 标签 / 徽章 |
| mono-body | Geist Mono 16px | 400 | 1.50 | normal | 代码块 |
| mono-label | Geist Mono 13px | 500 | 1.54 | normal | 技术标签（`uppercase`） |
| mono-small | Geist Mono 12px | 500 | 1.00 | normal | `uppercase`，微型技术标签 |

**字距缩放规律**：48px→-2.4~-2.88px、32px→-1.28px、24px→-0.96px、16px→-0.32px、14px→normal。**字距恒为负/零，绝不为正**。body 级刻意放松（文字密、环境空），display 级极致压缩。

## 四、组件样式（按钮 / 卡片 / 导航 / 徽章）

### 按钮
- **Primary CTA（近黑）**：bg `#171717`, text `#ffffff`, padding `8px 16px`, radius `6px`——唯一主 CTA（Start Deploying / Get Started）
- **Secondary（白底 shadow-bordered）**：bg `#ffffff`, text `#171717`, padding `0 6px`, radius `6px`, 阴影 `rgb(235,235,235) 0 0 0 1px`；hover 背景转深。次级操作
- **药丸徽章 / pill**：bg `#ebf5ff`, text `#0068d6`, padding `0 10px`, radius `9999px`, 12px w500——**仅标签 / 状态 / tags**，不做主 CTA
- **焦点环（全可交互元素）**：`outline / box-shadow: 0 0 0 2px var(--accent)` ⚠️ 以 accent 为准（非 hsla 焦点色）

### 卡片 / 容器
```css
.card {
  background: #ffffff;        /* canvas—平面，无渐变、无彩色装饰 */
  border-radius: 8px;          /* 特性/图片卡用 12px */
  /* 无 CSS border！用阴影堆栈 */
  box-shadow:
    0 0 0 1px rgba(0,0,0,0.08),   /* ① 边框层（shadow-as-border） */
    0 2px 2px rgba(0,0,0,0.04),   /* ② 软抬升 */
    0 8px 8px -8px rgba(0,0,0,0.04), /* ③ 环境深度 */
    0 0 0 1px #fafafa;            /* ④ 内环高光——不可省，是系统的「发光」 */
}
```
**图片卡**：顶部圆角 `12px 12px 0 0`，`1px solid #ebebeb` 边框；仪表盘/代码截图占特性区主体。

### 导航 / 表格 / 徽章
- **导航**：白色 sticky header；Vercel logotype 左对齐；链接 14px w500 `#171717`，active 提重 600 或下划线；右对齐深色药丸 CTA；底部 `shadow-border rgba(0,0,0,0.08) 0 0 0 1px`；移动端汉堡折叠
- **表格**（按系统规律推断）：紧凑密集行，发丝分隔用 shadow-border，无斑马纹；表头 12–13px w500 `#4d4d4d`，单元格 14px 400 `#171717`（次级 `#4d4d4d`）；数字等宽 + `tabular-nums`
- **工作流管线**：三步水平 Develop `#0a72ef` → Preview `#de1d8d` → Ship `#ff5b4f`，各步一行 Geist Mono 大写标签 + 24px w600 标题 + 16px w400 灰描述——语义色仅在此场景

## 五、动效（克制、快速、无叙事）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑，无过冲）
- **只做微交互**：hover / focus 过渡 `background-color`、`border-color`、`opacity`、微位移（≤2px）；卡片 hover 轻微强化阴影
- **禁**：弹跳 / 弹性 / 过冲（spring）、大幅位移、长叙事动画、大范围 fade 扫场、炫技 keyframes

## 六、Vercel 自己的「别这样做」

- 别用正字距——字距恒为负或零，越大越紧、越小越松
- 别用 700 字重做正文——600 是上限，仅标题（7px 微徽章特例除外）
- 别用传统 CSS `border` 做卡片——一律 shadow-as-border（`0 0 0 1px rgba(0,0,0,0.08)`）
- 别省略卡片阴影里的内环 `#fafafa 0 0 0 1px`——它是整套系统发光的核心
- 别把语义色（Ship 红 / Preview 粉 / Develop 蓝）当装饰用——只标工作流管线
- 别用重阴影（opacity > 0.1）——阴影是耳语级，深度靠分层不靠加深
- 别增大正文字距——Geist 设计就是紧的
- 别用 9999px 药丸做主 CTA——药丸只给徽章 / 标签 / tab 导航
- 别把暖色（橙 / 黄 / 绿）引入 UI chrome——调色板是灰阶 + 唯一的蓝 accent
- 别在主文本用 `#000000`——用微暖的 `#171717`
- 别用渐变背景当主视觉 / 彩色区块分隔区块——区块分隔靠阴影边框 + 间距，hero 渐变仅是「近乎不可见」的氛围底色

## 七、判断词

- ✅ 极简、纯白、单色、阴影即边框、多层阴影堆栈、内环高光、极负字距、压缩式大字、Geist 连字、gallery 式留白、克用到工程学
- ❌ 彩色渐变、实心 CSS 边框、重阴影、多彩强调、正字距 / 宽字距、彩色区块背景、药丸 CTA、纯黑 `#000000` 主文、炫技动效

## 八、适用边界

**适用于**：开发者工具 / DevTools 落地页、浅色极简 SaaS 官网、大标题概念页、纯白极简产品、需要「gallery 式空旷留白」的营销页、代码 / 终端氛围的品牌。

**不适用于**：暗色运营后台 / 管理面板 / 数据密集型界面（那用 Linear 参考——见 `reference-linear.md`）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple/Airbnb）、需要「色彩丰富 / 强边框 / 暖色交互」的浅色产品界面。
