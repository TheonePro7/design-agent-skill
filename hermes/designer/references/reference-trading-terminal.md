# L1 参考解剖 · Trading Terminal（金融数据终端 / 数据密集深色界面）

> 来源：open-design/design-systems/trading-terminal（DESIGN.md + design-tokens.json + tokens.css + components.html）
> 用途：任何**金融交易终端 / 行情板 / 订单簿 / 仪表盘 / 数据密集型深色界面**的设计基准。
> 状态：✅ 范例确认。⚠️ **DESIGN.md 叙事与 design-tokens.json 冲突** —— DESIGN.md 写了「纯黑 #0D0D0D + cyan/coral(JetBrains Mono)」的 Bloomberg 文学版，但**实测 token（score 100）是「海军蓝 #070b12 + 天蓝 accent / 绿-红」的尾调板**。以下一律以 design-tokens.json / tokens.css 为准，冲突处已标注。

---

## 一、核心原则（先记这 8 条）

1. **深色原生，但底色是「海军蓝黑」不是中性黑**：canvas 用 `#070b12`（近黑带冷蓝调），表面 `#101826`（更深的海军蓝）。**勿用纯黑 `#000000`**，也勿由 DESIGN.md 带偏回中性 `#0D0D0D`
2. **唯一品牌色：天蓝 `#38bdf8`**：accent = CTA 底 / 链接 / 激活态 / eyebrow 标签 / 状态指示。`--meta` 同值（同为 sky）。全系统彩色仅此一套 + 状态色（绿/琥珀/红），其余全是蓝灰阶
3. **涨跌语义固定**：涨/买/成功 = 绿 `#22c55e`；跌/卖/风险 = 红 `#ef4444`；警告/警戒 = 琥珀 `#f59e0b`。⚠️ DESIGN.md 说 cyan #00D4AA / coral #FF4757 —— 以绿/红为准
4. **数据全部等宽数字**：所有数值/报价用 `Roboto Mono`（tabular）——等宽竖列对齐，行情一眼可扫。⚠️ DESIGN.md 说 JetBrains Mono —— 以 Roboto Mono 为准
5. **锐利但允许圆角**：组件实现用 `radius-md 8`（按钮/卡片）/ `radius-lg 12`（大面板）/ `radius-pill 9999`（状态点/胶囊）。⚠️ DESIGN.md 宣称「no rounded corners 尖角」—— 与真实 token/组件矛盾，以 4/8/12/9999 为准
6. **大标题紧字距 + 压缩行高**：Display 走 `tracking-display -0.01em` + `leading-tight 1.08`，字重 760（h1）→ 700（h2/h3），克制但数据感强
7. **靠边框和表面分层，不用纯阴影**：平层 `elev-flat none`，默认用边框环 `elev-ring 0 0 0 1px var(--border)` 分隔；只对抬升面板用大片柔和阴影 `elev-raised 0 24px 80px rgba(0,0,0,0.42)`
8. **能动，但只动「状态」，不装饰数据**：focus-ring `0 0 0 4px rgba(56,189,248,0.28)` 天蓝；交互转移 90ms；价格更新**只做值替换不做飞舞动画**（交易员要稳定读取）

## 二、颜色令牌（以 design-tokens.json 为准）

**表面 / 结构（A1-identity）**

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#070b12` | 页面 / canvas（海军蓝黑，**勿用 `#000000`**；⚠️ DESIGN.md 写 #0D0D0D） |
| surface | `#101826` | 卡片 / 面板 / 次级按钮底（bg 上一级，深海军蓝） |
| surface-warm | `#162238` | 暖面板 / 抬升小卡（比 surface 略亮） |
| fg | `#f8fafc` | 主文本（近白偏一点蓝，非纯白） |
| fg-2 | `#cbd5e1` | 次级文本 / 正文 / lead |
| muted | `#8492a6` | 三级文本 / 元数据 / 注释 |
| meta | `#38bdf8` | eyebrow / status / 数据标签（显眼天蓝） |
| border | `#263246` | 标准边框（面板 / 卡片 / 输入 / 次级按钮） |
| border-soft | `#1c2638` | 柔和分隔（panel-head 底边 / 列表细分隔） |

**交互 / 数据（accent + 状态）**

| Token | 值 | 用途 |
|:--|:--|:--|
| accent | `#38bdf8` | 品牌色：CTA 底 / 链接 / 激活 / hover 描边（唯一强调色） |
| accent-on | `#03111a` | accent 上的文字（深海军蓝，保证对比） |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)`（≈`#34aee4`） | accent 元素 hover |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)`（≈`#30a3d5`） | accent 按下态 |
| success | `#22c55e` | 涨 / 买 / 成功 / 运行中（⚠️ DESIGN.md 用 cyan #00D4AA） |
| warn | `#f59e0b` | 警告 / 保证金警戒 |
| danger | `#ef4444` | 跌 / 卖 / 危险（⚠️ DESIGN.md 用 coral #FF4757） |

**阴影（辅助，非深度主体）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `0 24px 80px rgba(0,0,0,0.42)`（仅抬升大面板用）；focus-ring `0 0 0 4px rgba(56,189,248,0.28)`。

**布局 token**：container-max `1320px`；gutter 桌面 36 / 平板 24 / 手机 16；section-y 桌面 80 / 平板 60 / 手机 42。

## 三、排版（Inter 做显示/正文 + Roboto Mono 做数据）

字体栈：`--font-display: Inter, system-ui, sans-serif`；`--font-body: Inter, system-ui, sans-serif`；`--font-mono: "Roboto Mono", "SF Mono", ui-monospace, Menlo, monospace`。⚠️ DESIGN.md 宣称 body/display/micro 全用 JetBrains Mono —— 以 Inter + Roboto Mono 为准。

| Token | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| text-4xl | 56px | 760 | 1.08 | -0.01em | hero 大标题（h1，Inter） |
| text-3xl | 40px | 700 | 1.08 | -0.01em | 区块标题（h2） |
| text-xl | 20px | 700 | 1.08 | -0.01em | 卡片 / 面板标题（h3） |
| text-lg | 16px | 400 | 1.45 | normal | lead / 介绍文（fg-2） |
| text-base | 14px | 400 | 1.45 | normal | 正文（默认 body） |
| text-sm | 12px | 700 | 1.00 | normal | 按钮 / 标签（btn 用 700） |
| text-xs | 11px | 700 | 1.00 | +0.12em up | eyebrow / status（**mono + 大写**） |

**数字规约**：所有行情数值、指标、报价用 `Roboto Mono` + `tabular-nums`（等宽对齐竖列）；状态/指标可用 text-xs 11px/700/uppercase。

## 四、组件样式（依 components.html 实测实现）

### 按钮
- **Primary（主 CTA）**：底 `accent #38bdf8`，字 `accent-on #03111a`，radius-md 8，min-height 44，padding 0 20px，font 700 12px/1；hover 转 `accent-hover` + `translateY(-1px)`；focus 用 focus-ring
- **Secondary（次 CTA）**：底 `surface #101826`，字 `fg #f8fafc`，边框 `border #263246`，`box-shadow: var(--elev-ring)`；hover 边框/字变色 `accent`（描边变天蓝）
- 转移：`background-color/border-color/color/transform/box-shadow` 全走 `90ms var(--ease-standard)`

### 面板 / 容器
```css
.panel {
  background: color-mix(in oklab, var(--surface), transparent 4%);
  border: 1px solid var(--border);      /* #263246 */
  border-radius: var(--radius-lg);      /* 12px */
  box-shadow: var(--elev-raised);        /* 0 24px 80px rgba(0,0,0,0.42) */
  overflow: hidden;
}
.panel-head { display:flex; justify-content:space-between; align-items:center; padding: var(--space-5); border-bottom: 1px solid var(--border-soft); }
.mini-card { background: var(--surface-warm); border: 1px solid var(--border-soft); border-radius: var(--radius-md); padding: var(--space-5); min-height: 148px; }
.tile { background: var(--surface); border: 1px solid var(--border); border-radius: var(--radius-md); padding: var(--space-5); }
```

### 指标网格（数据密集核心）
```css
.metric-grid { display:grid; grid-template-columns: repeat(3, minmax(0,1fr)); border-bottom: 1px solid var(--border-soft); }
.metric { padding: var(--space-5); border-right: 1px solid var(--border-soft); }
.metric strong { font-family: var(--font-display); font-size: var(--text-2xl /*28px*/); line-height: var(--leading-tight); }
.metric span { color: var(--muted); font-size: var(--text-sm /*12px*/); }
```
多列数据之间用 `border-right/border-bottom`（单位发丝线）分隔，不用空隙——**tabular 网格、面板共享边框**。

### 状态指示（status pill）
`status`：`color: var(--meta #38bdf8)`，`font: 700 11px/1 var(--font-mono)`，`text-transform: uppercase`，`letter-spacing: 0.08em`；`::before` 为 8px 圆点 `background: var(--success)`（状态点=绿/跑运中）。涨跌用绿/红。

### 输入框
```css
input { width:100%; min-height:46px; padding:0 var(--space-4); border:1px solid var(--border); border-radius: var(--radius-sm /*4*/); background: var(--surface); color: var(--fg); font: inherit; }
input:focus { outline:none; box-shadow: var(--focus-ring); border-color: var(--accent); }
```
focus 用「天蓝 focus-ring + 描边变 accent」，不用换色实心粗框。

### 经典交易组件词汇（DESIGN.md 叙事，配色已按 tokens 修正）
- **Order Book Row**：`grid-template-columns: 1fr 1fr 1fr`，`padding 4px 0`，`border-bottom 1px border-soft`；size / bid(涨-绿) / ask(跌-红) 全部右对齐等宽——**bid=success 绿、ask=danger 红**（⚠️ DESIGN.md 用 gain/loss 语义，实则映射 success/danger）
- **Price Card**：底 surface + border，内置 12px/500/uppercase 标签（muted）+ 28px/700 mono 主值 + 涨跌幅（绿/红）
- **Ticker Bar**：横向滚动单行行情条，`gap 24px`，`border-bottom 1px border`，多行情等宽横排

## 五、动效（克制、快速、只动状态不装饰数据）

- **时长**：`--motion-fast 90ms`（交互/价格更新）/ `--motion-base 160ms`（面板切换）
- **曲线**：`--ease-standard: cubic-bezier(0.2, 0, 0, 1)`（减速出场、无过冲）
- **只做状态微交互**：hover/focus 过渡 background / border-color / color / 微位移（≤1px）；focus 用天蓝 ring
- **数据规约**：价格/指标**只做值替换**，不飞入不补间震荡——交易员要稳定即读；若有旧值保留逻辑先短暂保留再换，防闪盲
- **禁**：数据装饰性动画 / bounce / spring / 大幅位移 / 长叙事动画

## 六、Trading Terminal 自己的「别这样做」

- 别用纯黑 `#000000` / 中性黑当 canvas —— 底色必须海军蓝 `#070b12`（⚠️ DESIGN.md 的 #0D0D0D 已过时）
- 别用 cyan `#00D4AA` / coral `#FF4757` 做涨跌 —— 涨=绿 `#22c55e`、跌=红 `#ef4444`（以 tokens 为准）
- 别用 JetBrains Mono —— 数据等宽固定用 Roboto Mono；显示/正文用 Inter
- 别只用颜色区分涨跌 —— 无论哪种语义都必须叠加方向箭头或 +/- 标签
- 别给数据值做装饰性动画 / 大幅渐变 / 长淡入 —— 只需要稳定、即读
- 别出浅色模式 / 亮背景 —— 终端在暗室使用，深色原生
- 别在同一列塞超过 5 个行情点位 —— 认知过载拖慢决策
- 别用渐变填充当主视觉 —— 平面填充为主（hero 页允许一处径向天蓝渐晕，属装饰点缀，慎重）
- 别丢失等宽 tabular 对齐 —— 数值列一旦不对齐，行情终端就失去灵魂
- 别引入第二个彩色强调 —— 仅天蓝 accent 一套 + 绿/琥珀/红状态色

## 七、判断词

- ✅ 深色、数据密集、等宽 tabular 对齐、绿涨红跌、天蓝强调、锐利结构、发丝网格线、即时稳定读取、专业逼格
- ❌ 彩色 glow、多强调色、大圆角 CTA、纯黑背景、非等宽的数据列、装饰性数值动画、浅色模式、渐变主视觉、暖色人文调

## 八、适用边界

**适用于**：金融交易终端、行情 / 订单簿、看板仪表盘、股票/加密货币监控、监控面板、任何「数据密集 + 需要一眼从两米外读出涨跌」的专业深色界面。

**不适用于**：浅色 / 温暖人文品牌营销页（那用 Stripe/Claude）、消费级「轻快友好」的产品（用 Apple/Airbnb）、文档优先的运营后台（那用 Linear —— 见 `reference-linear.md`，Linear 是更偏中性白的半透明分层，本参考更偏黑蓝 + 强涨跌语义）。
