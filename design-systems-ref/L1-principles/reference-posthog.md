# L1 参考解剖 · PostHog（温暖文案系数据分析 / 产品官网金标准）

> 来源：open-design/design-systems/posthog（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**暖色文案系 / 反套路 B2B SaaS / 数据分析营销官网 / 开发者市场页**的设计基准。与暗色派（Linear/Stripe）互补。
> 状态：✅ 令牌确认（颜色以 design-tokens.json 为准，DESIGN.md 与令牌冲突处以令牌为准并标注 ⚠️）
>
> ⚠️ **冲突标注**：本包的视觉语汇以 DESIGN.md 实测为准，是**温奶油色浅色主题**（暖调手作感），**并非深色界面**。若目标产品是深色 app/图表界面，请改用 `reference-linear.md`；本文件的「暖色浅色 + 鼠尾草绿 + 隐藏橙」是官网营销主题判断基准。

---

## 一、核心原则（先记这 8 条）

1. **背景是温奶油色，不是纯白**：页面底色 `#fdfdf8`（带黄绿底调的手作纸感），**禁用纯白 `#ffffff`**；所有表面都在暖色灰绿系里分层
2. **调色板是橄榄/鼠尾草绿，不是科技蓝紫**：文字用橄榄灰 `#4d4f46` + 深橄榄 `#23251d`，边框用鼠尾草灰 `#bfc1b7`——整个系统带一股绿底调
3. **隐藏品牌橙只出现在 hover**：`#F54E00` 静止时几乎不出现，hover/交互瞬间闪现——这是 PostHog 的签名互动惊喜，**不是常驻强调色**
4. **深度几乎全靠边框 + 表面色阶，不用阴影**：唯一阴影是给浮层的深投影（`0 25px 50px -12px rgba(0,0,0,0.25)`）；普通层级靠 1px 鼠尾草边框 + 表面色 `#fdfdf8 → #eeefe9 → #e5e7e0` 微移
5. **粗体大标题是身份**：IBM Plex Sans Variable，标题 700–800 字重，自信张扬（Body 却给 1.50–1.71 的慷慨行高，一紧一松）
6. **无渐变、无玻璃拟态、全不透明**：视觉面素平，深度用边框包围 + 表面色区分，不用色彩过渡
7. **大写标签做分类信号**：18–20px / 700 的大写标签用于产品类目标题，是杂志编辑版式的惯例
8. **手绘刺猬插画 + 玩味元素是差异点**：刻意反企业化；「我们要当正经工程师，但别太把自己当回事」

## 二、颜色令牌（以 design-tokens.json 为准）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#fdfdf8` | 页面 / canvas 背景（温奶油，**勿用 `#ffffff`**） |
| surface | `#eeefe9` | 输入底 / 次级表面（鼠尾草奶白） |
| surface-warm | `#e5e7e0` | 按钮底 / 三级表面（浅鼠尾草） |
| fg | `#4d4f46` | 主文本（橄榄灰，**带绿底调**） |
| fg-2 | `#23251d` | 深橄榄 / 链接 / 高强调标题（近黑带绿） |
| muted | `#65675e` | 次级文本 / 浅底按钮标签（哑橄榄） |
| meta | `#9ea096` | 占位 / 禁用态 / 最弱文本（鼠尾草灰绿） |
| border | `#bfc1b7` | 主边框（橄榄调灰，全系统边框色） |
| border-soft | `color-mix(in oklab, var(--border), var(--bg) 50%)` | 微边框（border 与 bg 各半） |
| accent | `#F54E00` | PostHog 橙——**hover 签名色**，非常驻强调 |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` | accent 元素 hover |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` | accent 按下态 |
| success | `#16a34a` | 成功状态 |
| warn | `#F7A501` | 琥珀金 / 暗按钮 hover 字色 |
| danger | `#dc2626` | 危险 / 删除 |

**DESIGN.md 附加色（令牌未收录，按需使用）**：Amber Gold `#F7A501`（warn 同源，暗按钮 hover）、Gold Border `#b17816`（特典按钮边框）、Focus Blue `#3b82f6`（焦点环，全系统唯一蓝）、Dark Text `#111827`（高对比链接）、Dark CTA 底 `#1e1f23`（近黑主按钮）、Hover White `#f4f4f4`（通用 hover 底）、Light Border `#b6b7af`（次级边框/工具栏）。⚠️ **Focus Blue `#3b82f6` 是唯一允许的蓝，只留给无障碍焦点环**；引入第二个蓝即破坏系统。

**阴影色（深度主体仅一个）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `0px 25px 50px -12px rgba(0,0,0,0.25)`（浮层/弹层/下拉）；focus-ring `0 0 0 3px rgba(59,130,246,0.5)`。

## 三、排版（IBM Plex Sans Variable + Source Code Pro）

字体栈：`font-family: "IBM Plex Sans Variable", "IBM Plex Sans", -apple-system, system-ui, "Avenir Next", Avenir, "Segoe UI", "Helvetica Neue", Helvetica, Ubuntu, Roboto, Noto, Arial, sans-serif;`
Mono：`font-family: "Source Code Pro", ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;`
**标题 700–800 字重（自信、不轻哼）；正文 400–500、行高 1.50–1.71（内容型长读舒适）；Display 负字距（`tracking-display -0.025em`），Body 回到 0。**

| 角色 | 字号 | 字重 | 字距 | 行高 | 备注 |
|:--|:--|:--|:--|:--|:--|
| Display Hero | 30px | 800 | -0.75px | 1.20 | 极粗、紧、最大冲击（hero） |
| Section Heading | 36px | 700 | 0 | 1.50 | 大而慷慨行高 |
| Feature Heading | 24px | 700 | 0 | 1.33 | 功能区块标题 |
| Card Heading | 21.4px | 700 | -0.54px | 1.40 | 卡片标题（缩放/流式刻度） |
| Sub-heading | 20px | 700 | -0.5px | 1.40 | 内容子节 |
| Sub-heading Uppercase | 20px | 700 | 0 | 1.40 | 大写标签 |
| Body Emphasis | 19.3px | 600 | -0.48px | 1.56 | 半粗强调 |
| Label Uppercase | 18px | 700 | 0 | 1.50 | 大写类目标签 |
| Body Semi | 18px | 600 | 0 | 1.56 | 半粗正文 |
| Body | 16px | 400 | 0 | 1.50 | 标准阅读 |
| Body Medium | 16px | 500 | 0 | 1.50 | 中等正文 |
| Body Relaxed | 15px | 400 | 0 | 1.71 | 长读放松行高 |
| Nav / UI | 15px | 600 | 0 | 1.50 | 导航 / UI 标签 |
| Caption | 14px | 400–700 | 0 | 1.43 | 小字，各种字重 |
| Small Label | 13px | 500–700 | 0 | 1.00–1.50 | 标签 / 徽章 / 微标签 |
| Micro | 12px | 400–700 | 0 | 1.33 | 最小字，部分大写 |
| Code | Source Code Pro 14px | 500 | 0 | 1.43 | 代码 / 终端 |

**令牌字号刻度**：--text-xs 12 / sm 14 / base 16 / lg 20 / xl 24 / 2xl 30 / 3xl 36 / 4xl 44（Tailwind 流式 rem 刻度，**注意 Design.md 用缩放小数如 21.4px/19.3px，说明书系统是流式而非固定档位**）。`--leading-body 1.5` / `--leading-tight 1.2`。

## 四、组件样式（按钮 / 卡片 / 输入 / 导航 / 深度）

### 按钮（所有按钮 hover 一律**闪橙或琥珀字色**——签名模式）
- **Dark Primary（主 CTA）**：底 `#1e1f23`，白字，圆角 6，padding `10px 12px`。hover：opacity 0.7 + 琥珀金 `#F7A501` 字；active：opacity 0.8 + 轻微 scale。「深色而自信」
- **Sage Light**：底 `#e5e7e0`，字橄榄 `#4d4f46`，圆角 4，padding `4px`。hover：底 `#f4f4f4` + PostHog 橙字。紧凑工具按钮
- **Warm Tan Featured（特典）**：底 `#d4c9b8`，黑字，圆角不明显。hover：同橙字闪现。特典 / 高级动作
- **Input-style**：底 `#eeefe9`，占位 `#9ea096`，圆角 4，边框 `1px #b6b7af`。搜索 / 筛选控件
- **Near-white Ghost**：底 `#fdfdf8`，字橄榄，圆角 4，透明 1px 边框。极弱存在感
- **hover 模式**：全部按钮闪 PostHog 橙 `#F54E00` 或琥珀金 `#F7A501` 字

### 卡片 / 容器
- **Bordered Card**：底 `#fdfdf8` 或白，1px `#bfc1b7` 边框，圆角 4–6——干净极简
- **Sage Surface Card**：底 `#eeefe9`，次级内容容器
- **Shadow Card（浮层）**：`0px 25px 50px -12px rgba(0,0,0,0.25)` 单一深投影——仅弹层 / 下拉用
- **hover**：交互卡片也闪橙字，与按钮行为一致

### 输入 / 表单
- 默认：底 `#eeefe9`，占位 `#9ea096`，边框 `1px #b6b7af`，圆角 4，padding `2px 0px 2px 8px`
- focus：`#3b82f6` 环 50% 透明度（Tailwind 蓝焦点环，**无障碍专用**）
- 值文字：`#374151`（比主文本更深，保可读性）
- 部分输入用复合边框（top/left/bottom-only）

### 导航
- Top nav：温背景，IBM Plex Sans 15px / 600
- 链接色：深橄榄 `#23251d`，hover 下划线
- 下拉：丰富 mega-menu，产品类目分组
- CTA：Dark Primary 按钮（#1e1f23）「Get started - free」

### 边界 / 圆角刻度
- 2px：小额行内元素 / 标签（`span`）
- 4px：主 UI——按钮 / 输入 / 下拉 / 菜单项（`button`/`div`/`combobox`）
- 6px：次级容器——大按钮 / 列表项 / 卡片变体（`button`/`div`/`li`）
- 9999px：Pill——徽章 / 状态指示 / 圆角标签（`span`/`div`）

### 深度（Level 0–3）
| Level | 处理 | 用途 |
|:--|:--|:--|
| L0 Flat | 无阴影，温奶油底 | 页面画布、多数表面 |
| L1 Border | `1px solid #bfc1b7` | 卡片包围、输入边框、区隔 |
| L2 Compound Border | 多侧 1px 边框 | 输入分组、工具栏 |
| L3 Deep Shadow | `0 25px 50px -12px rgba(0,0,0,0.25)` | 弹窗 / 浮层 / mega-menu |

**深度哲学**：只存在一个阴影。层级靠「边框包围 + 表面色微移 `#fdfdf8→#eeefe9→#e5e7e0`」沟通，无渐变 / 无 glow / 无玻璃拟态。

## 五、动效（克制、快速、无叙事）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑、无过冲）
- 交互主体：hover 时字色闪橙 / 琥珀、暗按钮 opacity 0.7、active opacity 0.8 + 轻微 scale（≤2px）
- **与 Linear 对齐**：短促、无弹跳 / 无 spring / 无长叙事 / 无大范围 fade 扫场；命令面板 / 弹层 opacity + scale 微开

## 六、PostHog 自己的「别这样做」

- 别用纯白 `#ffffff` 当页面背景——温奶油 `#fdfdf8` 的底调是根基
- 别用蓝 / 紫 / 常规科技 SaaS 配色——调色板是橄榄/鼠尾草绿系；Focus Blue 只留给无障碍焦点环
- 别加厚重阴影——系统只有一个深投影（浮层）；其余全用边框 + 表面色
- 别把橙当常驻强调色——PostHog 橙 `#F54E00` 的魔力在**只闪现于 hover**；hover 不闪橙就是在丢失这个模式
- 别用紧凑正文行高——1.50–1.71 的慷慨间距是内容型布局的根
- 别在卡片用大圆角（12px+）——4–6px，紧凑而功能化
- 别用 400 字重做大标题——标题必须 700–800，自信张扬
- 别用渐变背景 / glassmorphism / glow / spotlight 卡片——平、暖、不透明
- 别把插画换成库存图——手绘刺猬艺术就是品牌本身
- 别做成「常规意义上的精致/高级」——PostHog 的魅力是叛逆、粗粝、有冲劲儿

## 七、判断词

- ✅ 暖调、文案系、手作感、鼠尾草绿系、粗体大标题、慷慨正文行高、隐藏橙 hover、边框分深度、无渐变、杂志式编排、插画人格
- ❌ 纯白底、科技蓝紫、多强调色、厚重阴影、常驻橙、紧凑行高、大圆角卡片、轻盈正文字重、玻璃拟态、炫技动效、企业化死板

## 八、适用边界

**适用于**：暖色文案系 / 反套路 B2B SaaS 营销官网、数据分析产品官网、开发者市场页、「想突出人格与幽默感」的品牌站、内容密集的长读型产品页。

**不适用于**：暗色运营后台 / 管理面板 / 数据密集型 app 界面（那用 Linear——见 `reference-linear.md`）、极简冷色科技站（那用 Vercel/Stripe）、极深色图表仪表盘（用暗色参考；本包令牌为暖浅色，**注意 ⚠️ 上文冲突**）。
