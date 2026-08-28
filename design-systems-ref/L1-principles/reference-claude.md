# L1 参考解剖 · Claude / Anthropic（暖色人文编辑风标杆）

> 来源：open-design/design-systems/claude（DESIGN.md + design-tokens.json + components.html）
> 用途：任何**暖色人文 / 编辑风 /「有思想的陪伴者」/ AI 助教 / 内容站**的设计基准。
> 状态：✅ 范例确认（颜色以 design-tokens.json 为准，冲突处已标 ⚠️）
> 一句话身份：**羊皮纸上的文学沙龙** — 不是「屏幕」，是「纸」；不是「工具」，是「有品位的同伴」。

---

## 一、核心原则（先记这 9 条）

1. **羊皮纸是原生画布，不是「浅色套了层白」**：页面底 `#f5f4ed`（暖奶油+黄绿调，像陈年纸）。**不要用纯白 `#ffffff` 当页面背景**，也不出冷色深色模式
2. **全员暖色中性灰**：每一个灰都有黄棕底色（`#5e5d59`、`#87867f`、`#4d4c48`），整个调色板**没有任何冷蓝灰**。`#141413` 是最暖的「黑」，带一点橄榄暖意
3. **唯一饱和色：陶土**：品牌 `#c96442`（陶土/赭橙棕）**只用于主 CTA 与最高信号的品牌时刻**——刻意接地气、反科技感；其余全是温柔的暖中性色
4. **Serif/Sans/Mono 三分离 = 身份**：所有标题用 Anthropic Serif，所有功能 UI（按钮/标签/导航）用 Anthropic Sans，代码严格只用 Anthropic Mono。**标题永远不混 sans，正文永远不混 serif**
5. **Serif 单一字重 500**：所有 Serif 标题一律 weight 500——不上粗、不下细，让整套标题像同一位作者写成
6. **环阴影而非投影**：深度靠 `0px 0px 0px 1px` 暖色环（「假装是边框的阴影 / 假装是阴影的边框」），**不是**传统 drop shadow
7. **编辑部级正文行高 1.60**：读起来像书不像 dashboard；标题收紧 1.10–1.30，但**绝不挤压到沉闷**
8. **明暗分区交替**：Parchment（`#f5f4ed`）段与 Near Black（`#141413`）段交替，像书的章节；「渐变感」来自环境明暗切换，**不是 CSS 渐变**
9. **大方圆角 + 手绘插画**：按钮/卡片舒适圆角（8–12）、大方（16–32），**<6px 尖角是禁忌**；插画是手绘有机风（陶土/黑/哑绿），**不用几何/科技风 icon**

---

## 二、颜色令牌（以 design-tokens.json 为准，可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#f5f4ed` | **Parchment** 页面 / canvas 背景（暖奶油，**勿用 `#ffffff`**） |
| surface | `#faf9f5` | **Ivory** 卡片 / 抬升容器（比 bg 略亮，形成微层次） |
| surface-warm | `#e8e6dc` | **Warm Sand** 按钮底 / 显著交互面；同值即 **Border Warm** |
| fg | `#141413` | **Anthropic Near Black** 主文本（暖橄榄黑，非纯黑）/ 深色面底 |
| fg-2 | `#3d3d3a` | **Dark Warm** 强调次级文本 / 深色文字链接 |
| muted | `#5e5d59` | **Olive Gray** 次级正文（温暖的中深灰） |
| meta | `#87867f` | **Stone Gray** 三级文本 / 脚注 / 弱化元数据 |
| border | `#f0eee6` | **Border Cream** 浅色标准边框（最柔的包裹） |
| border-soft | `#e8e6dc` | **Border Warm** 显著边框 / 分段分隔 / 强调包裹 |
| accent | `#c96442` | **Terracotta（陶土）** 品牌 CTA / 品牌时刻（**唯一饱和彩色**） |
| accent-on | `#faf9f5` | 陶土上的文字（Ivory） |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` | accent 的 hover（约 `#b4583a`） |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` | accent 按下态（约 `#aa4f33`） |
| success | `#17a34a` | 成功状态（token 存在） |
| warn | `#eab308` | 警告（token 存在） |
| danger | `#b53333` | **Error Crimson** 错误 / 危险（深暖红，庄重而不惊悚） |

**阴影 / 焦点（token）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（环即边框）；elev-raised（whisper）`rgba(0,0,0,0.05) 0 4px 24px`；focus-ring `0 0 0 3px rgba(56,152,236,0.3)`。

> ⚠️ **冷色唯一例外 = 蓝 `#3898ec`**：输入焦点环用蓝（focus-ring 即此），是**全系统唯一冷色**，纯粹为无障碍可见性，别用在别处。
> ⚠️ **DESIGN.md 独有、未入 token 集**（仅供参考，冲突时以 token/左侧为准）：
> - 按钮文本 `Charcoal Warm #4d4c48`（暖面上深色文字）
> - 环色 `Ring Warm #d1cfc5`（hover/focus 环）、`Ring Deep #c2c0b6`（按下环）——与 token `--border #f0eee6` 有出入，用 token 边框更准
> - `Ring Subtle #dedc01` 数值疑为设计稿笔误（偏黄绿），**勿用**，用 `#d1cfc5` 或 token 边框
> ⚠️ **渐变申明**：本系统**无 CSS 渐变**。色彩深度靠暖灰梯级（cream→sand→stone→charcoal→black）+ 明暗分段实现，别写 `linear-gradient()`。

---

## 三、排版（Anthropic Serif + Anthropic Sans + Anthropic Mono）

字体栈（token）：
```css
--font-display: "Anthropic Serif", Georgia, "Times New Roman", serif;
--font-body:    "Anthropic Sans", "Arial", system-ui, -apple-system, sans-serif;
--font-mono:    "Anthropic Mono", ui-monospace, "JetBrains Mono", Menlo, monospace;
```
外部实现替换：Serif→Georgia，Sans→system-ui/Inter。

**核心法则**：Serif 只用于承载标题（统一 500 重）；Sans 处理全部功能 UI（按钮/标签/导航）；Mono 只用于代码/终端。**标题字号一律正/正常字距（0em）**——⚠️ 与 Linear 的负字距相反，Claude 的 Display **是 normal tracking**。

### 层级（DESIGN.md 全层级；token 尺寸子集：xs 10 / sm 14 / base 16 / lg 20 / xl 25 / 2xl 32 / 3xl 52 / 4xl 64）

| Role | Font | Size | Weight | Line Height | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|:--|
| Display / Hero | Serif | 64px | 500 | 1.10 | 0em | 主 hero，书题气 |
| Section Heading | Serif | 52px | 500 | 1.20 | 0em | 功能区块锚点 |
| Sub-heading Large | Serif | 36–36.8px | 500 | 1.30 | 0em | 次级区块标记 |
| Sub-heading | Serif | 32px | 500 | 1.10 | 0em | 卡片标题 / 功能名 |
| Sub-heading Small | Serif | 25–25.6px | 500 | 1.20 | 0em | 更小分区标题 |
| Feature Title | Serif | 20.8px | 500 | 1.20 | 0em | 小型功能标题 |
| Body Serif | Serif | 17px | 400 | 1.60 | 0em | 编辑部正文（serif 段落） |
| Body Large | Sans | 20px | 400 | 1.60 | 0em | 导语 / 介绍 |
| Body / Nav | Sans | 17px | 400–500 | 1.00–1.60 | 0em | 导航 / UI 文本 |
| Body Standard | Sans | 16px | 400–500 | 1.25–1.60 | 0em | 正文 / 按钮文本 |
| Body Small | Sans | 15px | 400–500 | 1.00–1.60 | 0em | 紧凑正文 |
| Caption | Sans | 14px | 400 | 1.43 | 0em | 元数据 / 描述 |
| Label | Sans | 12px | 400–500 | 1.25–1.60 | 0.12px | 徽章 / 小标签（微加字距保清晰） |
| Overline | Sans | 10px | 400 | 1.60 | 0.5px | 大写 overline 标签 |
| Micro | Sans | 9.6px | 400 | 1.60 | 0.096px | 最小文本 |
| Code | Mono | 15px | 400 | 1.60 | -0.32px | 内联代码 / 终端 |

**排版铁律**：
- Serif 标题**全系 500**，无粗无细；正文行高**从不低于 1.40**（托底编辑部气质）
- 除 12px 以下小字微加字距（0.12–0.5px）外，**大标题一律 normal tracking**，别学 Linear 负字距
- Mono 只给代码；**不用等宽字体承载普通内容**
- 数字：如需统计对齐可用 tabular-nums，但 Claude 并非数据密集型，默认不用等宽强调数字

---

## 四、组件样式（按钮 / 卡片 / 输入 / 导航 / 媒体）

### 按钮
- **Warm Sand（次级，主力）**：底 `#e8e6dc`，字 `#4d4c48`（Charcoal Warm），padding `0 12px 0 8px`（不对称，icon 前置），圆角 8，环影 `#d1cfc5 0 0 0 1px`——温和、不张扬、明显可点
- **White Surface**：底 `#ffffff`，字 `#141413`，padding `8px 16px 8px 12px`，圆角 12，hover 转次级色——浅面上干净的抬升按钮
- **Dark Charcoal（反转）**：底 `#30302e`，字 `#faf9f5`，padding `0 12px 0 8px`，圆角 8，环影 `#30302e ... , ring 0 0 0 1px`——深色强调反转
- **Brand Terracotta（主 CTA）**：底 `#c96442`，字 `#faf9f5`，圆角 8–12，环影 `#c96442 0 0 0 1px`——**全系统唯一带彩色的按钮**，最高信号
- **Dark Primary**：底 `#141413`，字 `#b0aea5`（Warm Silver），padding `9.6px 16.8px`，圆角 12，边框 `1px solid #30302e`——深色主题 CTA
- hover/focus 一律走**环影**（`0 0 0 1px` 暖色环），不做投影加深

### 卡片 / 容器
```css
.card {
  background: #faf9f5;               /* Ivory 浅面 / #30302e 深面 */
  border: 1px solid #f0eee6;          /* 浅面 Border Cream / 深面 #30302e */
  border-radius: 8px;                 /* 8 标准 / 16 featured / 32 hero+媒体 */
  /* 边框为「选中式」分隔：列表项用 border-top 1px 0 0 only */
}
```
- 抬升：whisper 环影 `rgba(0,0,0,0.05) 0 4px 24px`；交互态用 `0 0 0 1px` 暖环
- **不使用 ::before 装饰 / 渐变 / 重投影**

### 输入 / 表单
- 文本：`#141413`；padding `1.6px 12px`（极紧凑垂直）；边框标准暖边框；圆角 12
- focus：**蓝环** `0 0 0 3px rgba(56,152,236,0.3)`（唯一的冷色时刻）+ `border-color #3898ec`——为无障碍可见，别忘

### 导航
- 顶部 sticky，暖色背景；logo = Claude 字标（`#141413`）
- 链接混合 `#141413`（Near Black）/ `#5e5d59`（Olive Gray）/ `#3d3d3a`（Dark Warm）
- 底边框 `1px solid #f0eee6`（浅）/ `#30302e`（深）；CTA = 陶土钮或 White Surface 钮
- hover 只把文本提到前景色，**不加下划线/装饰**

### 图片 / 媒体
- 产品截图（Claude 对话界面）放圆角容器，**大圆角 16–32px**；深色 UI 截图与暖浅底形成反差
- 概念段用**手绘有机插画**（陶土 `#c96442` / 黑 / 哑绿），抽象概念化；视频嵌入圆角 + 16:9
- ⚠️ 插画风格是核心人格：**手绘感、有机、抽象**，不要用几何/科技风/单色扁平 icon 术语图

### 特色组件
- **模型对比卡**：Opus/Sonnet/Haiku 三卡网格；每张带暖边框、模型名（Serif 25px）、描述（Sans 15px Olive Gray）、能力徽章；卡间用 Border Warm `#e8e6dc` 分隔
- **明暗分段**：页面在 Parchment 与 Near Black 间交替，形成章节式阅读节奏

---

## 五、动效（克制、无声、无叙事）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑、无过冲）
- **只做微交互**：hover / focus 过渡 `background-color`、`border-color`、`opacity`、微位移（≤2px）——与 Linear 同一套契约
- **禁**：弹跳/弹性/过冲、大幅移动、长叙事动画、大范围 fade 扫场、炫技 keyframes、彩色 glow
- 编辑气质要求更「静」：动效比 Linear 还要少用，宁可无动画也别抢阅读

---

## 六、Claude 自己的「别这样做」

- 别用纯白 `#ffffff` 当页面背景 / 主色——Parchment `#f5f4ed` 或 Ivory `#faf9f5` 永远更暖
- 别用任何**冷蓝灰**（灰阶必须带黄棕底）——全系统除焦点蓝 `#3898ec` 外无一冷色
- 别给 Serif 加粗（≥700）——500 是 Serif 字重的天花板，单字重即身份
- 别引入陶土之外的饱和色——调色板刻意哑光
- 别用尖角（<6px）做按钮/卡片——温柔圆角（8–32）是核心
- 别用重投影——深度靠暖环 + 背景色阶切换
- 别用几何/科技风插画——手绘有机风是人格
- 别把正文行高压到 1.40 以下——编辑部气质依赖宽松行高
- 别用等宽字体承载非代码内容——Anthropic Mono 严格只给代码
- 别把 sans 混进标题 / serif 混进正文——serif/sans 分割即排印身份
- 别加 CSS 渐变 / 彩色 glow / emoji 图标——渐变感来自明暗分段，不来自 gradient

---

## 七、判断词

- ✅ 温暖、有文化、纸张感、编辑部气质、陶土点缀、Serif 标题 + Sans 功能字、单字重庄重、环阴影、适度大圆角、明暗分段、手绘插画、「有思想的陪伴者」
- ❌ 冷蓝灰、科技感、纯白背景、多饱和色、粗字重标题、重投影、几何插画、尖角、渐变、彩色 glow、dashboard 数据密集感

---

## 八、适用边界

**适用于**：暖色人文品牌站、编辑/杂志式营销落地页、AI 助教 / 教育内容站、产品介绍页、需要「值得信赖的陪伴感」的消费级或品牌官网、**任何想传达「有品位、有温度、反科技冷感」的产品**。

**不适用于**：暗色 SaaS 运营后台 / 开发者工具 / 数据密集型界面（那用 Linear——见 `reference-linear.md`）、冷色极简科技品牌（Vercel/Apple——`reference-vercel.md` / `reference-apple.md`）、需要「精密工程感」的消费金融（Stripe——`reference-stripe.md`）、轻快卡通风产品。
