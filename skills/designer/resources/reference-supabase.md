# L1 参考解剖 · Supabase（暗色开发者平台 / 翡翠绿品牌金标准）

> 来源：open-design/design-systems/supabase（DESIGN.md + design-tokens.json）
> 用途：任何**暗色开发者工具 / 后端 & 数据产品 / code-first 营销官网 / 代码编辑器气质的界面**的设计基准。
> 状态：✅ 范例确认（数据基于 open-design 实测 token，**颜色以 design-tokens.json 为准**，与 DESIGN.md 冲突处标 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **暗色加原生、从不纯黑**：页面背景 `#171717`（–bg），面 `#1c1c1c`（–surface）——**不要用 `#000000`**，也没有浅色模式；暗色就是 "code-first" 的身份
2. **唯一彩色＝Supabase 翡翠绿 `#3ecf8e`**：品牌标记、logo、链接、accent 边框。**绿从不铺底**、不做大面、不上按钮——只当「这是 Supabase」的身份信号
3. **一级 CTA 是「深色 pill」不是绿的**：主按钮底 `#0f0f0f`（近黑）、字 `#fafafa`、白描边——与 Linear（CTA=品牌紫）相反，Supabase 的主 CTA 靠「暗底 + 白边」凸显，**绿色退居 accent**
4. **深度不靠阴影，靠边框明暗**：`#242424`（极隐）→ `#2e2e2e`（标准）→ `#363636`/`#393939`（明显）；暗底上阴影几乎不可见，用「边框色阶」替代阴影分层
5. **字重克制是招牌**：几乎全系统 **400**，500 仅用于导航链接 + 按钮标签；**上限 500，禁用 700**——层级靠字号与字距，不靠字重
6. **Hero 行高 1.00 是签名**：72px 大标题压缩到零铅，像终端命令一样密集、不浪费纵向空间；这是 Supabase 排版最标志性的一笔
7. **等宽大写标签＝开发者控制台声音**：Source Code Pro 12px 大写 + 1.2px 字距，用于技术标签，连接官网与产品体验（用得克制）
8. **图形拉圆角、冷技术里的一点人情味**：Circular 几何无衬线带圆端子，把冷硬的开发者界面柔化；主 CTA 用 pill（9999px）、次级 6px、卡片 8–16px——**只有 pill / 6px，没有中间值**

## 二、颜色令牌（design-tokens.json 为准，可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#171717` | 页面 / 主画布背景（近黑，**勿用 `#000000`**） |
| surface | `#1c1c1c` | 卡片 / 抬升面（bg 上一级，亮一点点） |
| surface-warm | `var(--surface)` | 暖面（=–surface 别名） |
| fg | `#fafafa` | 主文本 / 按钮字（**不是纯白 `#ffffff`**，微暖防刺眼） |
| fg-2 | `#b4b4b4` | 次级文本 / 次级链接 |
| muted | `#898989` | 三级文本 / muted 链接 / 元数据 |
| meta | `#4d4d4d` | 最弱文本 / 禁用态 / 深重次级 |
| border | `#2e2e2e` | 默认边框（卡片 / tab / 次级 CTA 框） |
| border-soft | `#242424` | 最弱分隔线（分节 / 发丝分隔） |
| accent | `#3ecf8e` | 品牌绿 / logo / 链接 / accent 边框**仅此** |
| accent-on | `#0f0f0f` | accent 上的文字（近黑，非白） |
| accent-hover | `#00c573` | accent 元素的 hover / 绿链接 |
| accent-active | `color-mix(in oklab, #3ecf8e, black 14%)` | accent 按下态（≈`#35b27a` 近似，无 hex） |
| success | `#16a34a` | 进行中 / 成功状态**仅此** |
| warn | `#eab308` | 警告 / 注意（token 存在） |
| danger | `#dc2626` | 错误 / 危险 |

**边框色阶（深度主语言）**：`#242424`（隐）→ `#2e2e2e`（标准）→ `#363636`（按钮框 / 分节，doc-only ⚠️）→ `#393939`（次级框，doc-only ⚠️）→ accent 边框 `rgba(62,207,142,0.3)`（品牌强调=抬升态）。

**阴影（辅助，仅焦点用）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `0 0 0 1px var(--border), 0 4px 12px rgba(0,0,0,0.4)`；focus-ring `0 0 0 2px color-mix(in oklab, var(--accent), transparent 50%)`。

**其余品牌绿 / 表层**：绿链接 `#00c573`；绿边框 `rgba(62,207,142,0.3)`；玻璃深 `rgba(41,41,41,0.84)`；超微蓝罩 `hsla(210,87.8%,16.1%,0.031)`。Radix HSL 原语（slate/purple/violet/crimson/indigo/yellow/tomato/orange）作为语义状态备用。

> ⚠️ 冲突标注：
> - **`#00c573` 语义**：design-tokens 记为 `--accent-hover`，DESIGN.md 记为「绿链接 / Green Link」——hex 一致（`#00c573`），叫法不同。建议按场景二选一：作为 hover 用 accent-hover，作为链接用链接绿。
> - **主按钮底 `#0f0f0f`**：仅在 DESIGN.md 文字叙述里（"Primary button bg #0f0f0f"），design-tokens **无此 token**（–bg 是 `#171717`，–accent-on 是 `#0f0f0f`）。实践中按钮深底取 `#0f0f0f`–`#171717` 皆可。
> - **`#363636` / `#393939` / 90px / 96px**：均为 DESIGN.md 专有值，未 token 化——仅作延伸中性色 / 大跳距描述参考。
> - **DESIGN.md 文案说 `#0f0f0f` 是「Primary button bg / 最深面」**，且 tokens 里 `--accent-on` 也是 `#0f0f0f`（绿上文字）；两处指向同一近黑，但职责不同（按钮底 vs accent 文字色）。

## 三、排版（Circular + Source Code Pro，**禁 700**）

字体栈：`font-family: "Circular", "custom-font", "Helvetica Neue", Helvetica, Arial, sans-serif;`（display 与 body 同栈）
Mono：`font-family: "Source Code Pro", "Office Code Pro", Menlo, Monaco, Consolas, monospace;`
**字重纪律：默认 400，500 仅导航 + 按钮，无 700。**
**Hero 行高 1.00（--leading-tight）是签名；正文 1.5（--leading-body）。Display 字距 normal（--tracking-display），卡片标题负字距 -0.16px。**

| Token | 字号 | 字距 | 行高 | 用途 |
|:--|:--|:--|:--|:--|
| text-4xl（Hero） | 72px | normal | **1.00** | 最大密度头图，零浪费 |
| text-3xl | 36px | normal | 1.25 | 功能分节标题 |
| text-2xl | 32px | — | — | 区块小标题 |
| text-xl（Card Title） | 24px | -0.16px | 1.33 | 卡片标题 / 大标题 |
| text-lg | 18px | normal | 1.56 | 次级标题 |
| text-base（Body） | 16px | normal | 1.50 | 正文 |
| text-sm | 14px | normal | 1.00–1.43 | 导航 / 按钮（500）/ caption / 元数据 |
| text-xs（Small） | 12px | normal | 1.33 | 小字 / 页脚链接 |
| Code Label | Source Code Pro 12px | **1.2px** | 1.33 | 大写技术标签（`text-transform: uppercase`） |

**原则**：字重 400 几乎全用、500 仅交互元素；Hero 1.00 零铅压缩是签名；卡片标题 -0.16px 负字距区隔正文；等宽大写 + 1.2px 字距＝开发者控制台声音；Circular 圆端子把技术冷感暖化。

## 四、组件样式（按钮 / 卡片 / tab / 链接 / 导航）

### 按钮（**主 CTA 是深色 pill，绿色不上按钮**）
- **Primary Pill（暗）**：底 `#0f0f0f`，字 `#fafafa`，padding `8px 32px`，圆角 **9999px**，边框 `1px solid #fafafa`（暗底描白边），focus 阴影 `rgba(0,0,0,0.1) 0 4px 12px`——主 CTA（"Start your project"）
- **Secondary Pill（暗，muted）**：底 `#0f0f0f`，字 `#fafafa`，圆角 9999px，边框 `1px solid #2e2e2e`，opacity `0.8`——次级 CTA
- **Ghost**：透明底 + `#fafafa` 字，padding 8px，圆角 **6px**，边框 `1px solid transparent`——三级操作 / 图标按钮

### 卡片 / 容器
- 底：暗面（`#171717` 或略亮 `#1c1c1c`）；边框 `1px solid #2e2e2e`（或 `#363636`）
- 圆角：**8–16px**；内边距 `16–24px`
- **无可见阴影**——靠边框定义边缘

### Tabs
- 边框 `1px solid #2e2e2e`，圆角 **9999px（pill tabs）**；激活态＝绿色 accent 或更亮面；未激活＝暗、muted

### 链接
- **绿链接** `#00c573`：品牌链接
- **主亮** `#fafafa`：暗底标准链接；**次级** `#b4b4b4`：muted 链接；**三级** `#898989`：页脚 / 弱链接

### 导航
- 背景贴页面 `#171717`；Supabase logo + 绿 icon；Circular 14px / 500 链接；横向布局 + 产品 dropdown；右侧绿色 "Start your project" pill CTA；sticky header

## 五、动效（克制、快速、无叙事）

- **时长**：fast `150ms`（`--motion-fast`）/ base `200ms`（`--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑，无过冲）
- **只做微交互**：hover / focus 过渡颜色、边框、opacity、微位移（≤2px）——不弹跳 / 无 spring / 无大幅位移 / 无炫技 keyframes

## 六、Supabase 自己的「别这样做」

- 别出浅色模式——暗色加原生即身份，且别用纯黑 `#000000`（`#171717` 起步）
- 别把绿色铺成大面 / 背景 / 大规模——**它只用于 logo、链接、accent 边框、小点缀**
- 别给主 CTA 用绿色——**主 CTA 是「暗底 pill + 白描边」**，这是 Supabase 与 Linear（CTA=品牌色）最根本的差异
- 别堆 box-shadow——暗底上几乎看不见，会破坏「边框定义深度」的系统（阴影仅留 focus 态 `rgba(0,0,0,0.1) 0 4px 12px`）
- 别用 700 字重——上限 500，学 Linear 用 510 也别，Supabase 就是 400/500
- 别烘大 Hero 行高超 1.00——密度是刻意为之
- 别在按钮上用 16px+ 圆角——**pill（9999px）或 6px，没有中间值**；大圆角只给卡片（8–16px）
- 别把主面提亮过 `#171717`——暗度是结构的
- 别丢半透明边框——`rgba` 边框色是分层机制；暖色（crimson/orange）只作语义状态，不作主视觉

## 七、判断词

- ✅ 近黑 `#171717`/`#1c1c1c`、翡翠绿 `#3ecf8e` 稀疏点缀、深色 pill 主 CTA、Circular 400 端密度、Hero 1.00 零铅、等宽大写技术标签、边框明暗分层（`#242424`→`#2e2e2e`→`#363636`）、pill/6px 两极圆角、开发者控制台气质、code-first
- ❌ 绿色铺底、绿色主按钮、box-shadow 深度、700 粗体、大圆角按钮（16px+）、浅色模式、纯黑背景、Hero 行高 >1.00、暖色做主视觉、多强调色、炫技动效

## 八、适用边界

**适用于**：暗色开发者工具 / 开源源码产品（如 Supabase、Firebase 替代品）、backend & data 产品、code-first 营销官网、数据密集型界面、代码编辑器气质 / 深色控制台类界面、希望「工程感 + 一点翡翠绿身份」的产品。

**不适用于**：浅色明亮营销落地页（那用 Stripe 参考——见 `reference-stripe.md`）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple/Airbnb）、极简暗色运营后台（那用 Linear 参考——见 `reference-linear.md`，Linear 是「单一紫 + 白透明度梯度」，Supabase 是「近黑 + 边框明暗 + 深色 pill CTA」的开发者语言）、需要「轻快友好」的浅色产品界面。
