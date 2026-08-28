# L1 参考解剖 · Minimal（极简/近黑·纯白·单一强调色 最佳参考）

> 来源：open-design/design-systems/minimal（DESIGN.md + design-tokens.json + tokens.css + components.html）
> 用途：任何**极简主义产品界面 / 纯白内容页 / 轻量仪表盘 / 技术工具型页面**的设计基准——大量留白、hairline 细边框、近乎不可见的组件 chrome、安静克制的交互。
> 状态：✅ 新蒸馏（open-design 官方 Minimal 包，token score 100 / grade excellent）

---

## 一、核心原则（先记这5条）

1. **近黑 + 纯白，通体无彩色**：背景纯白 `#ffffff`，文本近黑 `#111111`（**不要用 #000000**）；唯一的品牌色 `--accent` 也是近黑，彩色只在**状态语义**里出现（success/warn/danger）
2. **accent 只做"一个焦点"**：`--accent: #111111` 只用于主 CTA / 链接 / 焦点环 / 选中态——一个界面只留**一个清晰的焦点元素**
3. **hairline 即结构**：分隔靠 `1px` 细边框（`--border`/`--border-soft`）与留白，**不靠阴影、不靠色块**；深度用 `0 12px 30px rgba(0,0,0,0.08)` 单层抬升（耳语级）
4. **留白优先于一切装饰**：`--space-*` 4→48 八级间距 + 区块垂直节奏（112/80/56px）；用留白区分层级，**能不加框就不加框**
5. **安静交互**：`--motion-fast 140ms / base 220ms` + `cubic-bezier(0.2,0,0,1)`，hover 只做微妙色阶（accent 掺黑 8%）+ 1px 位移；系统靠**明文状态**（hover/focus-visible/active/disabled）而非动效刷存在感

**设计意图**：Strict reduction, generous whitespace, almost invisible component chrome.（严格减除 + 慷慨留白 + 近乎不可见的组件 chrome。）

## 二、颜色令牌（可直接照抄，来自 design-tokens.json）

| Token | 值 | 用途 |
|:--|:--|:--|
| --bg | `#ffffff` | 页面背景（纯白） |
| --surface | `#fafafa` | 卡片 / 面板 / 按钮底（极浅灰） |
| --surface-warm | `#f5f5f5` | 暖表面 / mini-card / 次级块 |
| --fg | `#111111` | 主文本 / 标题（近黑，**不是 #000000**） |
| --fg-2 | `#3a3a3a` | 次级文本 / 导语 lead |
| --muted | `#777777` | 弱化文本 / 说明 / 占位 |
| --meta | `#111111` | 眉毛标签 / 状态文字（同 fg） |
| --border | `#e2e2e2` | 标准 hairline 边框（组件） |
| --border-soft | `#eeeeee` | 极浅 hairline（分隔 / 分割线 / 网格线） |
| --accent | `#111111` | **唯一强调色**：主 CTA / 链接 / 焦点 / 选中态 |
| --accent-on | `#ffffff` | accent 上的文字 |
| --accent-hover | `color-mix(oklab, --accent, black 8%)` | accent hover（更深的近黑） |
| --accent-active | `color-mix(oklab, --accent, black 14%)` | accent active / 按下 |
| --success | `#168a46` | 状态徽章 / 成功（背景点 + 文字） |
| --warn | `#b7791f` | 警告 |
| --danger | `#c53030` | 错误 / 危险 |

**状态色规则**：success/warn/danger 只做**状态语义**（徽章点、错误提示），**绝不用于 UI 装饰或品牌强调**。

> ⚠️ 注：DESIGN.md 头部另列 Primary `#0C0C09`、Surface `#F4F4F1`、Success `#16A34A`、Warning `#D97706`、Danger `#DC2626`（标注"Token from style foundations"——是模板占位）。**以 data 层为准**：`design-tokens.json`/`tokens.css`（source-backed、score 100）才是真实 shipped token，即上表 `--accent: #111111` 等。两套都是近黑/纯白家族，落到页面用上表。

## 三、排版（Inter 系；display 与 body 同栈，mono 用 SF Mono）

字体栈：`--font-display/--font-body: Inter, system-ui, sans-serif`；`--font-mono: "SF Mono", ui-monospace, Menlo, monospace`。

| Token | 字号 | 字重 | 字距 | 行高 | 用途 |
|:--|:--|:--|:--|:--|:--|
| --text-4xl | 64px | 760 | -0.02em | tight 1.08 | h1 主标题（最大字） |
| --text-3xl | 48px | 700 | -0.02em | tight 1.08 | h2 区块标题 |
| --text-2xl | 32px | 700 | -0.02em | tight 1.08 | h3 / 指标强数字 |
| --text-xl | 22px | 700 | 0 | — | 次级标题 |
| --text-lg | 18px | 400 | 0 | — | 导语 lead（--fg-2） |
| --text-base | 16px | 400 | 0 | body 1.55 | 正文 / 默认 UI 文本 |
| --text-sm | 14px | 400/700 | 0 | — | 标签 / 次级文本 / 按钮 |
| --text-xs | 12px | 700 | +0.12em | mono | eyebrow 小字（upper 化） |

**排版规则**：
- 标题一律走 `--font-display` + `--leading-tight: 1.08` + `--tracking-display: -0.02em`（**恒负字距**，文字如被压缩）；正文 `--leading-body: 1.55`
- 字重分级：h1=760 / h2&h3=700（标题），正文 400；**层级靠字号 + 字距，别只靠字重**
- eyebrow/状态徽章：`--font-mono` 12px / 700 / `uppercase` / `letter-spacing 0.12em`——给界面加"技术感"的呼吸
- 视觉意图：Strict reduction, generous whitespace, clean typography——大字响亮，其余全都退后

## 四、布局 / 间距 / 圆角 / 阴影（结构骨架）

**间距** `--space-*`：1=4 / 2=8 / 3=12 / 4=16 / 5=20 / 6=24 / 8=32 / 12=48。**区块垂直节奏** `--section-y-*`：desktop 112 / tablet 80 / phone 56。**容器** `--container-max: 1120px`，gutter desktop 36 / tablet 24 / phone 16。

**圆角**：sm 2px（输入框）/ md 4px（按钮、小卡）/ lg 8px（panel、大卡）/ pill 9999px（**仅状态点**）。

**阴影 / 深度**：
| Token | 值 | 用途 |
|:--|:--|:--|
| --elev-flat | `none` | 平面（大部分元素） |
| --elev-ring | `0 0 0 1px var(--border)` | **边框即影子**：用 ring 阴影代替实线 border 的情况 |
| --elev-raised | `0 12px 30px rgba(0,0,0,0.08)` | 抬升面板（单层、耳语级） |
| --focus-ring | `0 0 0 3px rgba(17,17,17,0.18)` | 键盘焦点环（可达性） |

**布局**：`.container` 居中 + `max-width 1120`；`section { padding-block: var(--section-y-*) }`；hero 用 `grid minmax(0,1.1fr) / minmax(320px,0.9fr) gap 32`；`.page` 背景 `linear-gradient(135deg, #ffffff 0%, #fafafa 100%)`（极轻微对角渐变，几乎不可感）。

## 五、组件（核心配方，来自 components.html + manifest）

**主按钮 `.btn-primary`**
```css
min-height: 44px; padding: 0 20px; border-radius: 4px;
background: var(--accent); color: var(--accent-on);
font: 700 14px/1 var(--font-body);
border: 1px solid transparent;
transition: background/border/color/transform/box-shadow 140ms var(--ease-standard);
&:hover { background: var(--accent-hover); transform: translateY(-1px); }
&:focus-visible { outline: none; box-shadow: var(--focus-ring); }
```

**次按钮 `.btn-secondary`**
```css
background: var(--surface); color: var(--fg);
border: 1px solid var(--border); box-shadow: var(--elev-ring);
&:hover { border-color: var(--accent); color: var(--accent); }
```

**输入框 `.field`/`input`**
```css
input { min-height: 46px; padding: 0 16px; border: 1px solid var(--border);
  border-radius: 2px; background: var(--surface); color: var(--fg); font: inherit; }
label { color: var(--fg-2); font-size: 14px; font-weight: 700; }
input:focus { outline: none; box-shadow: var(--focus-ring); border-color: var(--accent); }
```

**面板 `.panel`（主卡）**：`background: color-mix(oklab, var(--surface), transparent 4%)` + `border: 1px solid var(--border)` + `radius 8px` + `box-shadow: var(--elev-raised)`；`.panel-head` 下边框 `--border-soft`，padding 20px。

**mini-card / tile**：`--surface-warm`（mini-card）/ `--surface`（tile）+ `border 1px var(--border-soft|border)` + `radius md(4px)` + `padding 20px`；mini-card `min-height 148px`。

**状态徽章 `.status`**：`--font-mono` 12px/700/`uppercase`/`letter-spacing 0.08em` + 前置 8px 圆点 `background: var(--success)`（`radius: var(--radius-pill)`）。

**指标 `.metric`**：`strong` = `--font-display` 32px / `--leading-tight`；`span` = `--muted` 14px；网格线用 `border-bottom: 1px solid var(--border-soft)`。**眉标 `.eyebrow`**：mono 12px/700/`uppercase`/`0.12em`，`color: var(--meta)`。

## 六、动效（克制到安静）

- 时长：`--motion-fast: 140ms`（hover/聚焦/微交互）、`--motion-base: 220ms`（面板/更大变化）
- 缓动：`--ease-standard: cubic-bezier(0.2, 0, 0, 1)`（标准缓出，全程统一）
- **accent 即交互信号**：所有可交互项（按钮、输入、链接、面板）共用同一 focus-ring / focus-visible，**只用 accent 的颜色深度变化 + 1px 位移表状态**，不做弹性、不做夸张滑入
- 状态齐全：hover / focus-visible / active / disabled 都要显式定义；`transition` 里明确列出 `background/border/color/transform/box-shadow`

## 七、Minimal 自己的"别这样做"

- 别引入 off-palette 颜色——现有 token 能解决就不新增（在 `:root` 块外硬编码 hex）
- 别用同一字号/字重铺平层级——层级靠字号 + 字距 + 留白，别只靠字重
- 别用重阴影（opacity > 0.1）——`rgba(0,0,0,0.08)` 是上限，阴影要耳语级
- 别加损伤可读性/可达性的装饰性效果（渐变、glow、贴纸效果）
- 别在同一界面混用互不相关的视觉隐喻
- 别把 accent（近黑）当铺底/填充色，只做主 CTA/链接/焦点/单选焦点
- 别把 success/warn/danger 当装饰色用——只做状态语义
- 别脱离 `tokens.css` 另定义 design token / Tailwind 值；组件以 `components.html` 为准
- 别滥用 pill（9999px）——只给状态圆点/徽章；按钮/卡用 2–8px
- 别用纯黑 `#000000`——一律近黑 `#111111`

## 八、判断词

- ✅ 极简、大量留白、纯净、hairline 细边框、近乎不可见的 chrome、近黑/纯白、单一 accent 焦点、安静交互、Quiet & focused、字距紧绷、uppercase mono 眉标
- ❌ 彩色渐变滥用、多彩强调、重阴影、粗实边框、大圆角/药丸按钮、彩色区块背景、弹跳/夸张动效、正字距宽排、装饰性贴纸、纯黑 `#000000`

## 九、适用边界

**适用于**：极简主义产品界面、纯白内容/文档页、轻量仪表盘与数据概览、技术工具型页面、需要"安静、聚焦、干净"的界面；凡是把内容可读性放在首位、刻意压低调性反而更显高级的产品。

**不适用于**：需要强品牌色彩的记忆点产品、多彩营销落地页（用 Stripe / Vercel 参考）、暗色沉浸式产品（用 Linear / Spotify）、消费级重装饰电商、需要暖色人文品牌叙事（用 Claude）。
