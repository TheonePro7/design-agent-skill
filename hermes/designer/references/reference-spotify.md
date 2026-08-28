# L1 参考解剖 · Spotify（暗色沉浸式媒体/流媒体播放器金标准）

> 来源：open-design/design-systems/spotify（DESIGN.md + design-tokens.json）
> 用途：任何**媒体/流媒体/内容消费 / 暗色沉浸式播放器 / 播放主界面（player UI） / 内容卡片瀑布流**的设计基准。
> 状态：✅ 范例确认（颜色/尺寸以 design-tokens.json 实测为准，来源注 ⚠️ 冲突处已标）
> 类别：Media & Consumer · Music streaming · 内容优先的黑暗包裹 + 药丸圆形几何 + 专辑封面驱动视觉

---

## 一、核心原则（先记这 8 条）

1. **内容优先的黑暗包裹（content-first darkness）**：页面棲身在 `#121212` 近黑茧壳中——UI 主动「退入阴影」，让专辑封面、播客、歌单成为唯一真正的色彩来源。**UI 本身是有彩的（achromatic）**，颜色全来自内容和图。
2. **唯一彩色：Spotify 绿 `#1ed760`**：只用于播放按钮、激活态、主 CTA——**从不当装饰、从不上背景**；其上是 `#000000` 图标（accent-on）。另加 hover `#1db954`、按下用 oklab 混黑 10%。
3. **深度靠「黑色明度分层」而非阴影堆叠**：`#121212`（最底）→ `#181818`（卡/容器）→ `#1f1f1f`（按钮/交互面）逐级抬升；比 Linear 更简（无冷青调、无白色透明梯级）。
4. **药丸 + 圆形几何就是身份**：主按钮 500px、导航小按钮/搜索 9999px 全药丸；播放/头像/图标 50% 圆形。**方形按钮直接破坏身份**——这是最不可妥协的一条。
5. **暗底上阴影必须「重」才可见**：抬升面 `rgba(0,0,0,0.3) 0px 8px 8px`；对话框/菜单/浮层 `rgba(0,0,0,0.5) 0px 8px 24px`——轻阴影在暗底上等于没有。
6. **大写按钮 + 宽字距成系统**：按钮标签一律 `text-transform: uppercase` + 1.4–2px 正字距，形成「标签式」systematic voice，与正文文字区隔。
7. **700/400 二元字重**：大部分文字是 700（强调/导航/标题）或 400（正文），600 仅偶用做次级强调；靠**字重对比**而非字号层次做层级——比 Linear 更「二元」也更重。
8. **紧凑尺寸 10–24px**：字号带远窄于多数系统（10px 扫档 → 24px 区块标题）；为「扫歌单」设计而非「读文章」。暗底提供视觉停顿，**内容密度优先于呼吸感**。

## 二、颜色令牌（可直接照抄，token 为准）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#121212` | 页面 / 画布背景（最底近黑） |
| surface | `#181818` | 卡片 / 容器 / 抬升面 |
| surface-warm | `#1f1f1f` | 按钮底 / 交互面 / 输入框 |
| fg | `#ffffff` | 主文本 |
| fg-2 | `#fdfdfd` | 近纯白最强强调 |
| muted | `#b3b3b3` | 次级文本 / 未激活导航 / 元数据 |
| meta | `#cbcbcb` | 稍亮次级文本 |
| border | `#4d4d4d` | 默认分隔 / 暗底按钮灰边框 |
| border-soft | `rgba(255,255,255,0.1)` | 柔和分隔（唯一白透明） |
| accent | `#1ed760` | 播放 / 激活 / CTA（**唯一彩色**） |
| accent-on | `#000000` | accent 上的图标 / 文字 |
| accent-hover | `#1db954` | accent 元素 hover |
| accent-active | `color-mix(in oklab, var(--accent), black 10%)` | accent 按下态 |
| success | `#1ed760` | 成功（与 accent 同值） |
| warn | `#ffa42b` | 警告 |
| danger | `#f3727f` | 危险 / 错误 / 消极 |

**阴影（辅助，非深度主体）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`；elev-raised `rgba(0,0,0,0.3) 0px 8px 8px`（卡片/下拉）；focus-ring `0 0 0 3px rgba(30,215,96,0.4)`（关键焦点）。

### ⚠️ DESIGN.md 有、tokens 没有（需造/不再用）
- **Announcement Blue `#539df5`（信息态）**：仅见于 DESIGN.md，**无 token**——要用需自行新增（信息性 blue）。
- **深卡 `#252525` / 中卡 `#272727`**：DESIGN.md 列为 alternate card surface，**无 token**；token 侧只用 surface `#181818` / surface-warm `#1f1f1f`。
- **浅边框 `#7c7c7c`**（outlined 按钮描边）、**Light Surface `#eeeeee`**（浅色模式按钮）、**Green Border `#1db954`**（绿色描边变体）：均**无 token**。
- **对话框重阴影 `rgba(0,0,0,0.5) 0px 8px 24px`**：DESIGN.md 定义、**无 elev token**；token 侧只有 elev-raised（0.3）。
- **分隔线 = `#b3b3b3`**（DESIGN.md 列 Separator 复用 muted，无独立分隔 token）。
- **字体栈差异**：tokens 用 `CircularSp` 兜底（`"SpotifyMixUITitle"/"SpotifyMixUI", "CircularSp", "Helvetica Neue", ...`）；DESIGN.md 有**全局脚本兜底**（Arabic/Hebrew/Cyrl/Grek/Deva + CJK：Hiragino/Meiryo/MS Gothic）。⚠️ 全球化时以 DESIGN.md 全栈为准。

## 三、排版（SpotifyMixUI / SpotifyMixUITitle，600–700 重字重、无 OpenType 特配）

字体栈（token）：`--font-display: "SpotifyMixUITitle", "CircularSp", "Helvetica Neue", Helvetica, Arial, sans-serif;`（标题）；`--font-body: "SpotifyMixUI", "CircularSp", "Helvetica Neue", Helvetica, Arial, sans-serif;`（正文）；`--font-mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;`（数字/码，`tabular-nums`）。
无 OpenType `cv01/ss03` 类特配——SpotifyMixUI 本身即身份，字形由字库提供。**不靠字号拉开层次，靠字重**（700 vs 400 二元）。

| Role | 字体 | 字号 | 字重 | 行高 | 字距 | 备注 |
|:--|:--|:--|:--|:--|:--|:--|
| Section Title | SpotifyMixUITitle | 24px (1.50rem) | 700 | normal | normal | 区块大标 |
| Feature Heading | SpotifyMixUI | 18px (1.13rem) | 600 | 1.30 (tight) | normal | 次级小节 |
| Body Bold | SpotifyMixUI | 16px (1.00rem) | 700 | normal | normal | 强调正文 |
| Body | SpotifyMixUI | 16px (1.00rem) | 400 | 1.50 | normal | 标准正文 |
| Button Uppercase | SpotifyMixUI | 14px (0.88rem) | 600–700 | 1.00 (tight) | **1.4–2px** | `text-transform: uppercase` |
| Button | SpotifyMixUI | 14px (0.88rem) | 700 | normal | 0.14px | 标准按钮 |
| Nav Link Bold | SpotifyMixUI | 14px (0.88rem) | 700 | normal | normal | 导航（激活） |
| Nav Link | SpotifyMixUI | 14px (0.88rem) | 400 | normal | normal | 导航（未激活） |
| Caption | SpotifyMixUI | 14px (0.88rem) | 400 / 700 | 1.50–1.54 | normal | 元数据 |
| Small / Small Bold | SpotifyMixUI | 12px (0.75rem) | 400 / 700 | 1.50 | normal | 计数 / 小字 |
| Badge | SpotifyMixUI | 10.5px (0.66rem) | 600 | 1.33 | normal | `text-transform: capitalize` |
| Micro | SpotifyMixUI | 10px (0.63rem) | 400 | normal | normal | 最小文字 |

**text 尺寸 token**：xs `10px` / sm `12px` / base `16px` / lg `18px` / xl `20px` / 2xl·3xl·4xl `24px`；`--leading-body 1.50`、`--leading-tight 1.00`、`--tracking-display normal`（展示不做负字距——与 Linear 立异，Spotify 靠字重+大写，不靠负字距）。

## 四、组件样式（按钮 / 卡片 / 输入 / 导航 / 层级）

### 按钮
- **Dark Pill（导航/次级）**：底 `#1f1f1f`，字 `#ffffff`（或 `#b3b3b3`），pad `8px 16px`，半径 `9999px`——导航药丸 / 次级动作
- **Dark Large Pill（主导航）**：底 `#181818`，字 `#ffffff`，pad `0 43px`，半径 `500px`——App 主导航按钮
- **Light Pill（浅色 CTA）**：底 `#eeeeee`，字 `#181818`，半径 `500px`——浅色模式 CTA（cookie 同意 / 营销）⚠️`#eeeeee` 无 token
- **Outlined Pill（关注/次级）**：透明底 + `#ffffff` 字，边框 `1px solid #7c7c7c`，pad `4px 16px 4px 36px`（非对称放图标），半径 `9999px` ⚠️`#7c7c7c` 无 token
- **Circular Play（播放/暂停）**：底 `#1f1f1f`，字 `#ffffff`，pad `12px`，半径 `50%`（圆形）。⚠️ DESIGN.md 内部冲突：按钮表说深底白字，快速参考 prompt 又写绿底 `#1ed760` + `#000000` 图标——**以 token 为准取绿底（accent 是播放按钮的职责色）**。

### 卡片 / 容器
底 `#181818` 或 `#1f1f1f`，半径 **6px–8px**，**多数卡片无可见边框**，hover 微提亮，抬升阴影 `rgba(0,0,0,0.3) 0px 8px 8px`。不做白色透明梯级 / 不做发丝白框——靠明度差 + 阴影分深度。

### 输入 / 搜索
搜索框：底 `#1f1f1f`，字 `#ffffff`，半径 `500px`（药丸），pad `12px 96px 12px 48px`（icon 感知）；focus 边框 `#000000`、outline `1px solid`。⚠️ DESIGN.md 的 focus 用黑描边，但 token focus-ring 是绿 `rgba(30,215,96,0.4) 0 0 0 3px`——**焦点请用 token 的绿色 focus-ring**（黑描边弱化）。

### 导航
暗色侧栏（`#121212`），SpotifyMixUI 14px：激活 700 `#ffffff`、未激活 400 `#b3b3b3`；圆形图标按钮（50%）；左上绿 logo。

### 深度 / 抬高（Level 0–Inset）
| Level | 处理 | 用途 |
|:--|:--|:--|
| Base (L0) | `#121212` 底 | 最深 / 页面背景 |
| Surface (L1) | `#181818` 或 `#1f1f1f` | 卡片 / 侧栏 / 容器 |
| Elevated (L2) | `rgba(0,0,0,0.3) 0px 8px 8px` | 下拉 / hover 卡 |
| Dialog (L3) | `rgba(0,0,0,0.5) 0px 8px 24px` | 弹窗 / 蒙层 / 菜单 |
| Inset (border) | `rgb(18,18,18) 0px 1px 0px, rgb(124,124,124) 0px 0px 0px 1px inset` | 输入框内凹边框 |

**阴影哲学**：暗底要用**重阴影**（0.3–0.5 不透明度）才看得见弹层「浮在黑暗里」；输入框用内凹 border-shadow 做出「陷进去」的触感（premium audio device 的手感）。

### 布局 / 圆角
- 基准间距 `8px`；空间 token：1=4 / 2=8 / 3=12 / 4=16 / 5=20 / 6=24 / 8=32 / 12=48
- 圆角 token：radius-sm `9999px` / md `6px` / lg `8px` / pill `9999px`（token 命名下 sm=全药丸，⚠️反常识）；设计系统另列 `2/4`（徽章/小件）、`10–20`（面板）、`100`（大药丸）、`500`（主按钮）、`9999`（全药丸）、`50%`（圆形）
- 结构：固定侧栏 + 主内容；专辑/歌单卡片网格；底部全宽 now-playing 条；内容区自适应填充
- `--container-max 1280px`；gutter desktop 24 / tablet·phone 16；section-y desktop 64 / tablet 40 / phone 24

## 五、动效（tokens 为据，无叙事，偏沉浸）

- **时长**：`--motion-fast 150ms` / `--motion-base 200ms`
- **曲线**：`--ease-standard ease`（默认全局，不做专门贝塞尔曲线调试）
- **只做微交互**：hover / focus 过渡 background、opacity、微缩放（播放按钮 hover 放大 ~1.03）；不做大幅位移
- **禁**：弹跳 / 弹性 / 过冲 / 炫技 keyframes；Spotify 是「播放器」不是「叙事页」，动效让位于内容与封面
- 播放态：播放键绿底、暂停态深底，切换 150ms 过渡

## 六、Spotify 自己的「别这样做」

- 别让绿色当装饰 / 上背景——它**只**服务于播放、激活、主 CTA，唯一能「出声」的颜色
- 别用浅色当主表面——暗色沉浸是核心身份（浅色模式仅限 cookie/营销 CTA 等极罕见）
- 别用方形按钮——药丸（500–9999px）+ 圆形（50%）是身份，方形直接破功
- 别用轻薄/低透明度阴影——暗底上必须重（≥0.3）才可见
- 别加第二套品牌色——绿 + 无彩灰阶即完整调色板；信息态蓝若用需显式新增 ⚠️
- 别用宽松行高——Spotify 排版紧凑密集（正文 1.50、标题 tight 1.00）
- 别裸用原始灰边框——用阴影或内凹 border-shadow（`#4d4d4d` border 只作次级分隔）
- 别靠字号撑层次——用字重 700/400 二元对比
- 别在展示标题做负字距——Spotify 靠字重 + 大写，不学 Linear 负字距（`--tracking-display normal`）

## 七、判断词

- ✅ 近黑沉浸、药丸/圆形几何、单一绿 accent、700/400 二元字重、大写宽字距按钮、重阴影浮层、内容（专辑封面）供色、紧凑密度、触感 UI
- ❌ 彩色 glow、渐变、方形按钮、第二强调色、纯黑 `#000000` 主面、浅色主表面、轻薄阴影、宽松行高、裸露灰边框、装饰性 Green、负字距大标

## 八、适用边界

**适用于**：流媒体/音乐播放器、媒体消费类 App、暗色沉浸播放主界面（player / now-playing）、内容卡片瀑布流、播客/歌单浏览、娱乐/游戏消费端「剧场式」沉浸 UI。

**不适用于**：暗色 SaaS 运营后台 / 密集数据面板 / 开发者工具（那用 Linear——见 `reference-linear.md`）、明亮营销落地页（那用 Stripe）、暖色人文品牌（那用 Claude）、电商（那用 Apple/Airbnb）、需要「轻快友好」浅色或高信息密度的产品界面。

---
*注：本参考与 Linear 参考的差异核心——Linear 用「白透明度梯级 + 发丝白框 + 蓝紫唯一色 + 负字距」做精密工程感；Spotify 用「黑色明度分层 + 药丸圆形几何 + 绿唯一色 + 700/400 字重 + 重阴影」做沉浸媒体感。二者同为暗色，但方法论分属「工程精密」与「内容剧场」两条路。*
