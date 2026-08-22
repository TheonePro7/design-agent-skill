# L1 参考解剖 · Claude（暖色人文科技品牌参考）

> 来源：popular-web-designs/templates/claude.md（Anthropic 官方）
> 用途：任何**暖色 / 人文科技 / 内容型 / AI 对话产品**的设计基准。
> 状态：✅ 范例确认

---

## 一、核心原则（先记这5条）

1. **羊皮纸画布**：页面主背景必须是暖米色 `#f5f4ed`，不是纯白——这个"纸感"就是 Claude 的人格
2. **近黑非纯黑**：主文本用暖橄榄调近黑 `#141413`，**不是** `#000000`；最黑的表面也带一丝橄榄暖意
3. **serif 定权威，sans 管实用**：所有标题用 serif（回退 Georgia）且**统一字重 500**（无加粗无特细）；功能性 UI 文本（按钮/标签/导航）用 sans
4. **纯暖中性灰**：所有灰色都带黄棕底色（`#5e5d59`/`#87867f`/`#4d4c48`），**整个系统不存在冷蓝灰**
5. **ring 式阴影**：交互态深度用 `0px 0px 0px 1px` 暖色 ring（假装成边框的阴影），**不用**厚重 drop-shadow

## 二、颜色令牌（可直接照抄）

### 品牌色
| Token | 值 | 用途 |
|:--|:--|:--|
| near-black | `#141413` | 主文本 + 暗色页背景（暖橄榄近黑，非纯黑） |
| terracotta | `#c96442` | 品牌核心——**只**用于主 CTA/品牌时刻（烧橙土色，故意不科技） |
| coral | `#d97757` | 陶土浅暖变体——暗面文字强调/链接 |

### 表面与背景
| Token | 值 | 用途 |
|:--|:--|:--|
| parchment | `#f5f4ed` | 页面主背景（暖米黄，纸感） |
| ivory | `#faf9f5` | 浅色卡片/抬升容器（比羊皮纸更浅，制造层次） |
| warm-sand | `#e8e6dc` | 按钮背景/突出交互面（明显暖的浅灰） |
| dark-surface | `#30302e` | 暗色容器/导航边框/暗色区容器（暖炭） |
| white | `#ffffff` | **仅**特殊按钮面/最大对比元素（不做页面背景） |

### 中性文本
| Token | 值 | 用途 |
|:--|:--|:--|
| charcoal-warm | `#4d4c48` | 浅底按钮文字（浅色上默认暗字） |
| olive-gray | `#5e5d59` | 次级正文（暖中暗灰） |
| stone-gray | `#87867f` | 三级文本/脚注/弱化元数据 |
| dark-warm | `#3d3d3a` | 暗色链接/强调次级文本 |
| warm-silver | `#b0aea5` | 暗色面上的文字（暖纸感浅灰） |

### 边框与 ring
| Token | 值 | 用途 |
|:--|:--|:--|
| border-cream | `#f0eee6` | 浅色主题标准边框（隐约暖米，最温和包裹） |
| border-warm | `#e8e6dc` | 强调边框/节分割线/浅面上强调包裹 |
| ring-warm | `#d1cfc5` | 按钮 hover/focus ring 色 |
| ring-deep | `#c2c0b6` | 按下/激活更深 ring |
| focus-blue | `#3898ec` | 输入框焦点环 —— **全系统唯一冷色**，纯为无障碍 |

### 语义
| Token | 值 | 用途 |
|:--|:--|:--|
| error-crimson | `#b53333` | 错误状态（深暖红，严肃不吓人） |

### 渐变
- Claude **不用渐变**。深浅靠暖面 + 插画 + 明暗段落交替（cream→sand→stone→charcoal→black）营造，而非 gradient。

## 三、排版（serif 回退 Georgia / sans 回退 Inter）

| Token | 字体 | 字号 | 字重 | 行高 | 用途 |
|:--|:--|:--|:--|:--|:--|
| hero | serif | 64px | 500 | 1.10 | 首屏大标题（书封感） |
| section | serif | 52px | 500 | 1.20 | 功能区块锚点 |
| subhead-lg | serif | 36px | 500 | 1.30 | 次级分节 |
| subhead | serif | 32px | 500 | 1.10 | 卡片标题/功能名 |
| subhead-sm | serif | 25px | 500 | 1.20 | 更小分节标题 |
| feature | serif | 20.8px | 500 | 1.20 | 小型功能标题 |
| body-lede | sans | 20px | 400 | 1.60 | 导语段 |
| body | sans | 16-17px | 400-500 | 1.60 | 正文/按钮文字 |
| caption | sans | 14px | 400 | 1.43 | 元数据/描述 |
| label | sans | 12px | 400-500 | 1.43 | 徽章/小标签 |
| overline | sans | 10px | 400 | 1.60 | 大写眉题（字距 0.5px） |
| code | mono | 15px | 400 | 1.60 | 内联代码/终端 |

**排版铁律**：
- serif 标题**一律字重 500**——同一作者写所有标题的一致性"声音"
- 正文行高 **1.60**，比一般科技站（1.4-1.5）更松，像读书不是读仪表盘
- 标题行高 1.10-1.30（紧但不窒息）
- 小字（≤12px）加字距（0.12-0.5px）保可读
- **别**混入 sans 当标题——serif/sans 分家就是排版身份

## 四、卡片模式

```css
.card {
  background: #faf9f5;         /* ivory — 浅面卡片 */
  border: 1px solid #f0eee6;   /* border-cream — 隐约暖米 */
  border-radius: 8px;          /* 标准卡 8px；featured 16px；hero 容器 32px */
  padding: 24px 32px;
  /* 无重阴影 — 抬升靠 ivory/白与 parchment 的亮度差 */
}
.card:hover {
  /* 交互态用 ring，不加 translateY 不 glow */
  box-shadow: 0px 0px 0px 1px #d1cfc5;  /* ring-warm */
}
/* 强调卡可上 whisper 软阴影 */
.card--elevated {
  box-shadow: rgba(0, 0, 0, 0.05) 0px 4px 24px;
}
```

**暗面卡片**：`background:#30302e; border:1px solid #30302e`。

## 五、按钮

- **主 CTA（唯一带彩色）**：`terracotta #c96442` 底 + `ivory #faf9f5` 字，圆角 8-12px，ring `#c96442`
- **次按钮（主力）**：`warm-sand #e8e6dc` 底 + `charcoal-warm #4d4c48` 字，圆角 8px，内边距 `0 12px 0 8px`（不对称，图标前置），ring `#d1cfc5`
- **白面按钮**：`#ffffff` 底 + `near-black #141413` 字，圆角 12px，hover 变次背景色
- **暗炭反白**：`dark-surface #30302e` 底 + `ivory #faf9f5` 字，圆角 8px
- **暗面深色主按钮**：`near-black #141413` 底 + `warm-silver #b0aea5` 字，圆角 12px，边框 `1px solid #30302e`
- **输入焦点环**：`focus-blue #3898ec`（唯一冷色时刻）

## 六、Claude 自己的"别这样做"

- 别用冷蓝灰——调色板**必须全暖**
- 别给 serif 加粗（700+）——字重 500 是 serif 上限
- 别在陶土色之外引入饱和彩色——调色板刻意偏哑
- 别用锐角（半径 <6px）——柔和就是身份
- 别用厚重 drop-shadow——深度靠 ring 阴影 + 背景明暗
- 别用纯白 `#ffffff` 当页面背景——永远用 parchment/ivory
- 别用几何/科技风插画——Claude 的插画是手绘感、有机、概念化的
- 别把正文行高压到 1.40 以下——宽松行高支撑人文个性
- 别给非代码内容用等宽字体——Anthropic Mono 严格只给代码
- 别把 sans 混进标题——serif/sans 分家即排版身份

## 七、判断词

- ✅ 羊皮纸底、serif 书封感标题、暖中性灰、陶土 CTA、ring 阴影、明暗章节交替、杂志式留白
- ❌ 冷蓝灰、纯白底、纯黑近黑、多饱和色、几何插画、厚重投影、药丸按钮、sans 标题

## 八、适用边界

**适用于**：内容型/AI 对话产品、品牌叙事官网、人文科技、暖色 SaaS、需要"信任感+品味"的界面。
**不适用于**：暗色数据密集型运营后台（用 Linear 参考——见参考#1）、冷色开发者工具、强调极简高效的深色产品。
