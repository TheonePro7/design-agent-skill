# L1 参考解剖 · Raycast（暗色 macOS 原生工具 / 命令启动器金标准）

> 来源：open-design/design-systems/raycast（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**暗色开发工具 / 命令面板 / 启动器 / macOS 风格产品 / 极简工具类界面**的设计基准。
> 状态：✅ 范例确认（数据以 design-tokens.json 为准，与 DESIGN.md 措辞冲突处已用 ⚠️ 标注）

---

## 一、核心原则（先记这 8 条）

1. **近黑蓝调虚空，不是纯黑**：背景 `#07080a`（近黑带一点冷蓝调，非 `#000000`），让人感觉「在 macOS 原生应用内部」而不是一个网页——暗色是原生媒介
2. **一红一蓝，分工明确**：品牌红 Raycast Red `#FF6363` 只作**标点**（hero 斜纹 / 危险态），**不铺满**；Raycast Blue `hsl(202,100%,67%)≈#55b3ff` 承担交互（链接 / 焦点环 / 选中），用蓝色保护红色的稀有度
3. **macOS 原生多层阴影 = 深度语言**：深度**不靠边框颜色**，靠**多层 inset 阴影**模拟物理玻璃按键——白色顶部高光 + 黑色底部内阴影，元素像「压在暗桌上的玻璃」
4. **发丝白边框是结构的骨架**：卡片用 `rgba(255,255,255,0.06)` 边框（几乎看不见但结构必要）；分隔行 `rgba(255,255,255,0.04)`——**不是**实心暗色边框
5. **正字距是签名动作**：正文 **+0.2px → +0.4px** 字距（与大多数暗色 UI 的负字距相反），在暗底上营造「透气、可读」的空气感；Display 级标题则 0px 放松回来
6. **字重 500 为正文基线**：大多数正文用 Medium(500)，不是 Regular(400)——暗底上多一分厚度防「细得透光」；召唤词重 600
7. **OpenType = 工具感身份**：所有 Inter 文字开 `calt, kern, liga, ss03`（hero 标题关 liga、加 `ss02, ss08`）；`ss03` 给 Inter 一种更几何、更工具的气质
8. **药丸 CTA + 6px 工作半径**：主 CTA 用全药丸（`9999px`/86px+），次级操作 6px–8px 圆角；`opacity 0.6` 是交互 hover 的招牌（**不是换背景色**）

---

## 二、颜色令牌（以 design-tokens.json 为准，可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#07080a` | 页面 / canvas 背景（近黑**带冷蓝调**，勿用 `#000000`） |
| surface | `#101111` | 抬升面 / 卡片底（Surface 100） |
| surface-warm | `var(--surface)` | 别名（冷暗系统**无 warm 层**，直接指回 surface） |
| fg | `#f9f9f9` | 主文本（近白，**非纯白** `#ffffff` 防刺眼） ⚠️ |
| fg-2 | `#cecece` | 次级正文 / 描述（浅灰） |
| muted | `#9c9c9d` | 三级文本 / 导航链接默认色（中灰） |
| meta | `#6a6b6c` | 最弱文本 / 占位 / 元数据 / 禁用（暗灰） |
| border | `rgba(255,255,255,0.06)` | 卡片结构边框（极淡，结构必要） ⚠️ |
| border-soft | `rgba(255,255,255,0.04)` | 内部分隔行（更弱） |
| accent | `#FF6363` | **品牌红**——hero 斜纹 / 危险 / 关键强调**仅此** |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `#ff7777` | accent 元素 hover（提亮一个色阶，非改透明度） |
| accent-active | `#e85757` | accent 按下（压暗一个色阶） |
| success | `hsl(151,59%,59%)≈#5fc992` | 成功 / 正向状态（Raycast Green） |
| warn | `hsl(43,100%,60%)≈#ffbc33` | 警告 / 需注意（Raycast Yellow） |
| danger | `hsl(0,100%,69%)≈#FF6363` | 危险 / 破坏性动作（Error Red，与 accent 约等） |

**注意（color 之外的关键令牌，一并保留）**：
- **focus-ring**：`0 0 0 3px hsla(202, 100%, 67%, 0.35)` —— 焦点环用 **Raycast Blue**，不是 accent 红；交互反馈与品牌标点分离是本系统核心
- **elev-ring**：`rgb(27,28,30) 0 0 0 1px, rgb(7,8,10) 0 0 0 1px inset` —— macOS 招牌**双环**（外环卡片色 + 内环深底色），直接替代表面 1px 边框
- **elev-raised**：`rgba(255,255,255,0.05) 0 1px 0 inset, rgba(0,0,0,0.28) 0 1.189px 2.377px, 0 0 0 1px rgba(255,255,255,0.06)` —— 白色顶部高光 + 黑投影 + 发丝白边框
- **elev-flat**：`none`
- **Decor 发光**（DESIGN.md §6）：暖光 `rgba(215,201,175,0.05) 0 0 20px 5px`（冷暗 canvas 上的一点暖晕）· 蓝信息光 `rgba(0,153,255,0.15)` · 红危险光 `rgba(255,99,99,0.15)`

**⚠️ 冲突标注**：
- 主文本：DESIGN.md §2 说「Pure White `#ffffff` 用于主标题」，但 design-tokens.json 的 `--fg #f9f9f9` 是「近白主文本」。**以 tokens 为准**：body/正文一律 `#f9f9f9`；`#ffffff` 仅留给 accent-on 及个别高强调标题。
- 交互蓝未编码为独立 token：Raycast Blue 只在 `--focus-ring`（0.35 透明度环）和 `hsla(202,100%,67%,0.15)` 蓝色 tint 里出现，**没有 `--interactive` 色板**。链接/选中沿用 DESIGN.md 描述，但系统没有它自己的 token 槽位。
- 实心暗边框未编码：DESIGN.md 提到「cool gray 边框 `hsl(195,5%,15%)≈#252829`」与「Dark Border `#2f3031`」用于分隔线 / 表格，但 design-tokens.json **只有 rgba 白透明边框**（0.06/0.04），没有这两个实心灰 token。**以 tokens 为准**——结构分隔用 `rgba(255,255,255,0.06/0.04)`；如需实心暗灰分隔属 DESIGN.md 的次级惯例。
- Section Display 字号：DESIGN.md §3 写 56px，tokens.css 的 `--text-3xl` 是 **40px**（40–56 视为一个区间步进）。

---

## 三、排版（Inter + GeistMono，正字距 + OpenType calt/kern/liga/ss03）

字体栈：
- Body/Display：`"Inter", "Inter Fallback", "SF Pro Text/Display", -apple-system, system-ui, "Segoe UI", Roboto, sans-serif`
- Mono：`"GeistMono", ui-monospace, "SF Mono", "Roboto Mono", Menlo, Monaco, Consolas, monospace`

**OpenType**：所有 Inter 文字开 `"calt", "kern", "liga", "ss03"`；Display 标题加 `"ss02", "ss08"` 且关 `"liga" 0`（`ss03` 全局开启，给字体几何工具感——这是 Raycast 的 Inter 签名）。

| Token / 角色 | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| display-hero | 64px | 600 | 1.10 | 0px | hero 大标题（liga 0, ss02, ss08） |
| section-display | 40–56px | 400 | 1.17 | 0.2px | 区块标题 ⚠️ tokens 40px / prose 56px |
| heading | 24px | 500 | normal | 0.2px | 区块标题 |
| card-heading | 22px | 400 | 1.15 | 0px | 卡片标题 ⚠️ tokens 相邻步进 20px |
| sub-heading | 20px | 500 | 1.60 | 0.2px | 副标题 |
| body-lg | 18px | 400 | 1.15 | 0.2px | 介绍文 |
| body | 16px | 500 | 1.60 | 0.2px | **正文基线（500，行高放宽）** |
| body-tight | 16px | 400 | 1.15 | 0.1px | UI 标签 / 紧凑上下文 |
| button | 16px | 600 | 1.15 | 0.3px | 按钮（加宽字距） |
| nav-link | 16px | 500 | 1.40 | 0.3px | 导航链接 |
| caption | 14px | 500 | 1.14 | 0.2px | 小标签 / 元数据 |
| caption-bold | 14px | 600 | 1.40 | 0px | 强调的小标 |
| small | 12px | 600 | 1.33 | 0px | 徽章 / 标签 / 微型字 |
| small-link | 12px | 400 | 1.50 | 0.4px | footer 链接 / 精细字 |
| code | GeistMono 14px | 500 | 1.60 | 0.3px | 代码块 |
| code-small | GeistMono 12px | 400 | 1.60 | 0.2px | 行内代码 / 终端输出 |

**原则**：**正字距**是暗色 UI 里少见的反向操作（+0.2→+0.4px）——暗底上透气可读；**500 是基线**不是 400；Display 克制（64px/600）不做排版炫技；等宽数字用于技术内容用 `tabular-nums`。

---

## 四、组件样式（按钮 / 卡片 / 输入 / 导航 / 键帽 / 徽章）

### 按钮（hover 一律 **opacity 0.6**，不换背景色——招牌交互）
- **Primary Pill（主 CTA）**：透明底 + `#f9f9f9` 白字，药丸形（86px+/`9999px`），多层 inset 阴影 `rgba(255,255,255,0.1) 0 1px 0 inset`。hover：opacity 0.6
- **Secondary**：透明底 + 白字，6px 圆角，边框 `1px solid rgba(255,255,255,0.1)`，投影 `rgba(0,0,0,0.03) 0 7px 3px`。hover：opacity 0.6
- **Ghost**：无底无边，`#6a6b6c` 灰字，86px 圆角，同 inset 高光。hover：opacity 0.6 + 文字提亮到白
- **下载 CTA**：半透明白底 `hsla(0,0%,100%,0.815)` + 深字 `#18191a`，药丸形。hover：变全白 `#ffffff`
- **图标按钮**：`rgba(255,255,255,0.03~0.05)` 底，圆角 50%——关闭 / 菜单

### 卡片 / 容器
```css
.card {
  background: #101111;                 /* surface，非半透明白（区别于 Linear） */
  border: 1px solid rgba(255,255,255,0.06);  /* 极淡白边框，结构必要 */
  border-radius: 12px;                 /* 12 标准 / 16 大卡片 / 20 hero */
}
.card:hover { border-opacity: 提亮; 或轻微阴影增强; }
```

### 抬升 / 双环
- **Elevated Card（双环包含，取代 1px 边框）**：ring shadow `rgb(27,28,30) 0 0 0 1px` 外环 + `rgb(7,8,10) 0 0 0 1px inset` 内环——物理玻璃质感
- **Feature Card**：16–20px 圆角 + 暖晕 `rgba(215,201,175,0.05) 0 0 20px 5px`（冷 canvas 上的暖光）
- **Level 3 Button**：`rgba(255,255,255,0.05) 0 1px 0 inset`（顶高光）+ `rgba(255,255,255,0.25) 0 0 0 1px` + `rgba(0,0,0,0.2) 0 -1px 0 inset`（底暗）——macOS 按钮按压

### 输入 / 表单
- 输入底 `#07080a`，边框 `1px solid rgba(255,255,255,0.08)`，圆角 8px
- 焦点：边框提亮 + 蓝色辉光环 `hsla(202,100%,67%,0.15)`（focus-ring 蓝）
- 输入文字 `#f9f9f9`，占位 `#6a6b6c`；标签 `#9c9c9d`，14px/500

### 导航
- 顶导航：暗底与页面融合，白字链接 16px/500
- 链接：`#9c9c9d` → hover 变白 + 下划线；导航末端一个**半透明白药丸** CTA
- Sticky 顶栏，底部细边框分隔；移动端折叠汉堡，保持暗色主题

### 键盘快捷键键帽（签名组件）
- 渐层背景 `#121212 → #0d0d0d`（上→下），模拟物理键深度
- 多层重阴影 `rgba(0,0,0,0.4) 0 1.5px 0.5px 2.5px` + inset 高光/暗，形成立体 3D 键
- 圆角 4–6px；文字 Inter 12px/600

### 徽章 / 标签
- Neutral badge：`#1b1c1e` 底 + 白字，6px 圆角，14px/500，padding `0 6px`——紧凑药丸式分拣

---

## 五、动效（克制，微交互为主）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑、无过冲）
- **主打 opacity 过渡**：按钮 hover 用 `opacity 0.6` 而非换背景色——这是 Raycast 的招牌交互模式
- **禁**：弹跳 / 弹簧 / 过冲、大幅位移、长叙事动画、炫技 keyframes。命令面板 / 浮层用 opacity + scale 微开，不做 fly-in

---

## 六、Raycast 自己的「别这样做」

- 别用纯黑 `#000000` 当背景——蓝调 `#07080a` 是身份的来源（区别于泛泛暗色主题）
- 别对正文用负字距——Raycast 刻意用**正字距**（+0.2px），负字距会破坏它的空气感（⚠️ 与 Linear 完全相反）
- 别把 Raycast Blue 铺满当主强调——蓝是交互 / 信息，**红**才是品牌色；红只作标点（hero / 危险），不铺满
- 别做单层扁平阴影——多层 inset 系统（外环 + 白顶高光 + 黑底暗）是 macOS 原生质感的核心
- 别用 400 当正文——有 500 就用 500，暗底上 400 会「显得薄」
- 别混暖冷边框——统一走 cool gray（白透明 + 冷灰 `hsl(195,5%,15%)`）边color板
- 别只给 drop shadow 不给 inset 伙伴——阴影永远成对（外环 + 内高光）
- 别用装饰色 / 渐变 / 彩色背景——「暗色虚空是舞台，内容才是表演者」
- 别用背景色过渡做按钮 hover——用 `opacity 0.6`（招牌交互，不换色）

---

## 七、判断词

- ✅ 精密切削、仪器感、暗色原生、蓝调近黑、多层物理阴影、正字距空气感、药丸 CTA、一红一蓝分工、`opacity 0.6` hover、键帽 3D、macOS 玻璃质感
- ❌ 纯黑背景、负字距正文、蓝当品牌主色铺满、单层扁平阴影、400 正文、暖冷边框混用、渐变背景、背景色 hover、炫技动效、大量红

---

## 八、适用边界

**适用于**：暗色开发工具、命令面板 / 启动器、macOS 风格产品、AI 工具 / 桌面效用类（launcher、快捷键面板、CLI 配套 UI）、需要「极简 + 功能优雅 + 仪器感」的暗色工具界面。

**不适用于**：暗色 SaaS 运营后台 / 数据密集管理面板（那用 Linear——见 `reference-linear.md`，它走冷灰蓝紫 + 负字距 + 平表面 + 发丝白边框）、浅色 / 明亮营销落地页（那用 Stripe）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple / Airbnb）。

---

## 附：Raycast vs Linear 速判（同为暗色，气质相反）

| 维度 | Raycast（工具 / 启动器） | Linear（SaaS 后台） |
|:--|:--|:--|
| 背景 | `#07080a` 蓝调近黑 | `#08090a` 冷调近黑 |
| 品牌色 | 红 `#FF6363`（标点）+ 蓝 `hsl(202,..)`（交互） | 单套薰衣草紫 `#5e6ad2`/`#7170ff` |
| 字距 | **正** +0.2px（空气感） | **负**（紧致） |
| 字重基线 | 600 / 500 | 510（400–500 之间） |
| 深度 | 多层 **inset** 物理阴影 + 双环 | 白透明度梯级 + 发丝白边框 |
| 圆角 | 药丸 CTA + 6px 工作半径 | 8px 标准 |
| OpenType | `calt, kern, liga, ss03` | `cv01, ss03` |
| hover | `opacity 0.6` | 提亮 / 背景色过渡 |
