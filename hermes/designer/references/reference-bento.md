# L1 参考解剖 · Bento（浅色网格卡片 · 模块化布局）

> 来源：open-design/design-systems/bento（DESIGN.md + design-tokens.json）
> 用途：任何**浅色模块化网格布局 / 卡片堆叠 / 仪表盘拼块 / 信息聚合看板 / 现代落地页**的设计基准。
> 状态：✅ 范例确认（数据以 design-tokens.json 实测为准；与 DESIGN.md 叙述冲突处以 ⚠️ 标注，**以 token 值为准**）
> 关键提醒：DESIGN.md 叙述的是「暖桃色」调（primary `#FAD4C0` / surface `#FFF5E6`），但 design-tokens.json 实际是**冷蓝灰色调**（accent 蓝 `#2563eb` / bg `#f5f8ff`）。两处严重冲突，**一律采信 token 文件**，详见「冲突标注」。

---

## 一、核心原则（先记这 8 条）

1. **浅色为原生媒介**：页面 canvas `#f5f8ff`（浅蓝白调），卡片 `#ffffff`，正文 `#101828`——**不要用纯白 `#ffffff` 当整页背景**（会糊成一片无层次），也不要出暗色模式
2. **唯一彩色：品牌蓝 `#2563eb`**：CTA / accent / 链接 / meta 全用这一个蓝；hover ≈ 加深 8%、active ≈ 加深 14%，其余全部是灰阶 + slate 蓝（`#344054`/`#667085`）
3. **模块化网格即身份**：bento 的核心是**卡片化拼块**——内容按「卡块」排进一个可预测的网格，块与块之间靠**间距**（glue gap）建立节奏
4. **层级优先靠空白，其次圆角，最后才阴影**：先用 whitespace 分隔区块（比加边框/阴影更干净），再靠大圆角（10/16/24/pill）定义「卡」的味道
5. **边界极柔和、发丝级**：border `#d7e0ef`、border-soft `#edf2f8`——淡蓝灰细线，**不用深色实心边框**做主分隔
6. **阴影克制，分层靠 ring**：`elev-flat none` / `elev-ring 0 0 0 1px var(--border)`（卡片默认）/ `elev-raised 0 20px 52px rgba(16,24,40,0.11)`（抬升面）；focus 用 `0 0 0 4px rgba(37,99,235,0.22)`
7. **留白是布局工具**：区块垂直节奏 `section-y`（desktop 96 / tablet 68 / phone 48）；容器 `1180px` + 居中，gutter（36/24/16）——信息分区比塞满画面重要
8. **标题紧字距、正文松行高**：Display 负字距 `tracking-display -0.025em`；正文行高 `leading-body 1.52`，紧标题 `leading-tight 1.06`

## 二、颜色令牌（以 design-tokens.json 为准）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#f5f8ff` | 页面 canvas / 区块底（浅蓝白，**勿用 `#ffffff` 整页铺**） |
| surface | `#ffffff` | 卡片 / 下拉 / 抬升面（白） |
| surface-warm | `#eaf1ff` | 暖浅蓝 feature 面 / 高亮卡 |
| fg | `#101828` | 主文本（**不是纯黑**，冷墨色） |
| fg-2 | `#344054` | 次级文本 / 正文 |
| muted | `#667085` | 三级文本 / 占位 / 元数据 |
| meta | `#2563eb` | 弱化 / 元数据（蓝；与 accent 同值 ⚠️） |
| border | `#d7e0ef` | 默认边框（蓝灰发丝线） |
| border-soft | `#edf2f8` | 最弱分隔 / 微边框 |
| accent | `#2563eb` | **唯一彩色**：CTA 底 / 链接 / 激活 / 关键交互 |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` ≈ `#225bd8` | accent 的 hover（加深 8%） |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` ≈ `#1f51c5` | accent 的按下态（加深 14%） |
| success | `#16a34a` | 成功 / 完成态 |
| warn | `#f59e0b` | 警告 |
| danger | `#ef4444` | 危险 / 删除 |

**阴影色**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `0 20px 52px rgba(16,24,40,0.11)`（大而柔，非尖锐）；focus-ring `0 0 0 4px rgba(37,99,235,0.22)`（蓝色外发光环）。

### ⚠️ DESIGN.md 与 token 文件冲突标注（这处必须看清）

DESIGN.md「Color」叙述的是一套**暖色**调，与 token 文件**严重矛盾**。以下逐条标注，**一律以 token 值为准**：

| DESIGN.md 叙述 | 值 | 与 token 对照 |
|:--|:--|:--|
| Primary | `#FAD4C0`（暖桃色） | ⚠️ 错——accent 实为蓝 `#2563eb`（暖桃不是这个系统的 CTA） |
| Secondary | `#80A1C1` | ⚠️ 无对应 token；冷 slate 蓝取 `#344054`/`#667085` |
| Surface | `#FFF5E6`（暖奶油） | ⚠️ 错——surface=`#ffffff`，bg=`#f5f8ff`，surface-warm=`#eaf1ff` |
| Text | `#111827` | ⚠️ 近似但≠——fg 实为 `#101828` |
| Neutral | `#FFF5E6` | ⚠️ 从错误的 surface 派生，删除；中性=灰阶 slate |
| Success | `#16A34A` | ✅ 与 `#16a34a` 一致 |
| Warning | `#D97706` | ⚠️ 错——warn 实为 `#f59e0b` |
| Danger | `#DC2626` | ⚠️ 错——danger 实为 `#ef4444` |

**结论**：这套 DESIGN.md 的「style foundations」叙述文本（暖桃色）是**未经同步的旧描述**。做 bento 界面时，**冷蓝灰 `#f5f8ff` + 品牌蓝 `#2563eb`** 才是真实身份。

## 三、排版（Inter + SF Mono，标题紧字距）

字体栈：`--font-display` = `Inter, system-ui, sans-serif`；`--font-body` = `Inter, system-ui, sans-serif`；`--font-mono` = `"SF Mono", ui-monospace, Menlo, monospace`。

⚠️ DESIGN.md 说 mono 是 `JetBrains Mono`，但 token 文件是 **`SF Mono`**——以 token 为准。字重 DESIGN.md 声称 100–900 全覆盖（Inter Variable 全量），但**无签名字重**：层级用 400（读）/ 500–600（强调导航）/ 600–700（宣告）即可，避免滥用 300 以下与 800 以上。

| Token | 字号 | 用途 |
|:--|:--|:--|
| text-xs | 12px | 元数据 / 标签 / 时间戳 |
| text-sm | 14px | 次级正文 / 导航 |
| text-base | 16px | **默认正文** |
| text-lg | 18px | 介绍文 / 卡内说明 |
| text-xl | 24px | 区块小标题 |
| text-2xl | 36px | 区块标题 |
| text-3xl | 54px | 号 / 副 hero |
| text-4xl | 76px | hero 大标题 |

- 行高：正文 `leading-body 1.52`，标题 `leading-tight 1.06`
- 字距：Display 尺寸 `tracking-display -0.025em`（负字距），正文正常
- ⚠️ DESIGN.md 称排版刻度为 `12/14/16/20/24/32`，但 token 实测是 **`12/14/16/18/24/36/54/76`**——以 token 为准
- 数字 / 数据用等宽（SF Mono / ui-monospace），开 `tabular-nums`

## 四、间距与网格（bento 的骨架）

- **间距阶**：`4 / 8 / 12 / 16 / 20 / 24 / 32 / 48`（space-1…space-12）
- **容器**：`--container-max 1180px`，居中；gutter `desktop 36px / tablet 24px / phone 16px`
- **区块纵向节奏**：`section-y` `desktop 96px / tablet 68px / phone 48px`
- **网格规则**：模块对齐到可预测网格；卡块内 padding 用间距阶（16/20/24），卡间 gap 用 16/24，**避免 ad-hoc 偏移**；跨模块保持一致的垂直韵律

## 五、组件样式（按钮 / 卡片 / 输入）

### 卡片（bento 的核心拼块）
```css
.card {
  background: #ffffff;              /* 白卡，浮于 #f5f8ff canvas 之上 */
  border: 1px solid #d7e0ef;       /* 发丝蓝灰边 */
  border-radius: 16px;             /* sm 10 / md 16 / lg 24 / pill 9999 */
  box-shadow: var(--elev-ring);    /* 默认 ring 阴影，不加厚阴影 */
  padding: 24px;
}
.featured-card { background: #eaf1ff; border-radius: 24px; }  /* surface-warm feature 卡 */
```
- **先空白、后边框**：能靠 whitespace 分隔就别加边框阴影
- 卡片互叠 / 抬升用 `elev-raised 0 20px 52px rgba(16,24,40,0.11)`（大而柔）
- hover 提亮：背景向 `#eaf1ff` 靠 / 边框加深到 `#d7e0ef`，**不放大不位移**

### 按钮
- **Primary（主 CTA）**：底 `#2563eb`，字 `#ffffff`，圆角 10–12，hover 加深 8%、active 加深 14%——⚠️ DESIGN.md 写主 CTA 用 `#FAD4C0`，**错，用 `#2563eb`**
- **Secondary**：底 `#ffffff`，字 `#344054`，边框 `1px solid #d7e0ef`，圆角 10——次级操作，保持中性
- **Ghost / Text**：透明底 + `#2563eb` 字——低频 / 链接型操作
- focus-visible 一律用 `0 0 0 4px rgba(37,99,235,0.22)` 蓝色外发光环（强焦点可见）

### 输入 / 表单
- 底 `#ffffff`，字 `#101828`，边框 `1px solid #d7e0ef`，圆角 8–10，占位 `#667085`
- **强 focus-visible**（蓝色外发光环）+ 清晰 label + 可预测的 error 文案（error 用 `#ef4444`，不用花式提示）
- 错误态边框 `#ef4444`，成功态 `#16a34a`

### 徽章 / 状态点
- 状态 pill 用 success `#16a34a` / warn `#f59e0b` / danger `#ef4444`，小字号（12px）+ 圆角 pill `9999px`

## 六、动效（克制、快速、突出品牌蓝）

- **时长**：fast `150ms` / base `240ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑，无过冲）
- **只做短促、有目的的过渡**：hover / focus-visible / active / disabled / loading **全部显式**；过渡 `background-color`、`border-color`、`opacity`、微位移（≤2px）
- 用品牌蓝 `#2563eb` 作为「交互正在发生」的信号（hover 变深/焦点环变蓝）
- **禁**：弹跳 / 弹性 / 过冲、大幅位移、长叙事动画、炫技 keyframes、无目的的大范围 fade 扫场

## 七、Bento 自己的「别这样做」

- 别把 `#ffffff` 当整页背景——canvas 永远是 `#f5f8ff`，白是「卡」不是「底」
- ❌ 别信 DESIGN.md 的暖桃色主色——**CTA 就是品牌蓝 `#2563eb`**（那套 `#FAD4C0`/`#FFF5E6` 是过期描述，已冲突标注）
- 别引入 off-palette 颜色去解决本可用 token 解决的问题（状态色/交互色全在表内）
- 别用同一字号字重扁平化层级——标题要有紧字距 + 更大字号，正文要松行高
- 别用深色实心边框做主分隔——发丝蓝灰 `#d7e0ef`/`#edf2f8` 才是默认
- 别用大而锐/多层的阴影——分层靠 `ring`（`0 0 0 1px`）+ 大而柔的 `elev-raised`，别做投影堆叠
- 别破坏网格对齐 / ad-hoc 偏移——模块必须落进可预测的 1180px 容器网格
- 别混用无关视觉隐喻 / 装饰效果削弱可读性或可访问性
- 别跳过 focus-visible 状态 / error 文案——交互态必须显式、可预期

## 八、判断词

- ✅ 浅色原生、白卡浮于浅蓝 canvas、模块化网格拼块、极柔发丝边框、大圆角、克制阴影（ring 为主）、紧字距大标、留白充沛、单一品牌蓝 `#2563eb`
- ❌ 纯白整页底、深色实心粗边框、尖锐/多层阴影、暖桃色 CTA、过度动效、同字号扁平层级、破坏网格、多强调色、炫技装饰

## 九、适用边界

**适用于**：浅色模块化网格布局、卡片堆叠 / 拼块仪表盘、信息聚合看板、SaaS 数据产品首页、现代落地页、任何把信息「分块呈现、快速扫描」的布局型界面。

**不适用于**：暗色 SaaS 运营后台（那用 Linear——见 `reference-linear.md`）、强调品牌感情色的人文品牌（那用 Claude）、奢华/高级感深色落地页（那用 Stripe/Vercel 系）、需要「低分割度、连续阅读」的长文页面。
