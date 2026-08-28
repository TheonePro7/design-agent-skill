# L1 参考解剖 · Intercom（浅色 SaaS 客服/通信营销界面金标准）

> 来源：open-design/design-systems/intercom（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**浅色 SaaS 客服 / 通信 / 帮助台 / 对话式 UI / 编辑式（杂志向）营销落地页**的设计基准。
> 状态：✅ 范例确认（颜色以 design-tokens.json 实测为准；与 DESIGN.md 冲突处已标 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **暖米白是原生画布**：页面底 `#faf9f6`（暖奶油，编辑/杂志阅读感），主文 `#111111`（off-black，**非纯黑 `#000`**）。不用冷白灰，底色永远是暖调。
2. **唯一品牌色：Fin Orange `#ff5600`**（以 Intercom 的 AI agent 「Fin」命名）——只作 AI / 品牌强调，**禁止装饰性滥用**。其余 UI 全靠灰阶 + 暖中性。
3. **锐利几何即身份**：按钮 4px 圆角（近矩形、工业精密感，Intercom 的招牌），导航项 6px，卡片 8px。**别把按钮圆角拉过 4px**。
4. **暖燕麦边框系统**：边框用暖调燕麦色 `#dedbd6`（标准）/ `#ebe9e4`（更浅），用 oklab 透明度控深态。**别用冷灰边框**。
5. **大标题极度负字距**：Display/标题一律紧字距（80px→-2.4px、54px→-1.6px、24px→-0.48px），且**所有标题统一 1.00 行高**；大标题像广告牌，工程感。
6. **物理「生长」交互**：按钮 hover `scale(1.1)` 放大、active `scale(0.85)` 收缩——真实触感（配 `ease-standard`，**无弹跳**）。Intercom 的招牌微交互。
7. **面分层靠「色彩 + 边框」不靠阴影**：层级用暖表面（`#faf9f6` 暖奶油 / `#ffffff` 白抬升）+ 发丝暖边框区分；阴影极克制（raised 仅 `0 2px 8px` 近不可见的暖色 whisper）。
8. **五字体生态**：Saans（几何无衬线，主字体）、Serrif（衬线，编辑时刻）、SaansMono（代码 / 大写标签）、MediumLL / LLMedium（特定 UI 情境）。Mono 大写标签走宽字距（0.6–1.2px）。

## 二、颜色令牌（以 design-tokens.json 为权威）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#faf9f6` | 页面 / canvas（暖奶油，编辑画布） |
| surface | `#ffffff` | 抬升卡片 / 面板层（纯白）⚠️ 与 DESIGN.md §4 卡片用 `#faf9f6` 不同——两层级并存 |
| surface-warm | `#faf9f6` | 暖卡片表面（warm-card 模式） |
| fg | `#111111` | 主文本 / 深色按钮底（off-black，**勿用 `#000`**） |
| fg-2 | `var(--fg)` | 次级文本（别名，全站单标题色） |
| muted | `#7b7b78` | 弱化文本 / 黑色 50（`#7b7b78`） |
| meta | `#9c9fa5` | 三级文本 / 时间戳 / content-tertiary |
| border | `#dedbd6` | 标准边框（暖燕麦） |
| border-soft | `#ebe9e4` | 微边框（更浅暖） |
| accent | `#ff5600` | Fin Orange，AI / 品牌强调**仅此** |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` | accent 元素 hover（加深橙） |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` | accent 按下（更深橙） |
| success | `#00da00` | 成功状态（report 绿） |
| warn | `#eab308` | 警告 |
| danger | `#c41c1c` | 危险 / 删除（= report red） |

**Report / 数据可视化调色板（DESIGN.md prose** ⚠️ **未 token 化，仅限数据图表不可用于 UI 强调）**：Report Blue `#65b5ff` / Report Green `#0bdf50` / Report Red `#c41c1c` / Report Pink `#ff2067` / Report Lime-300 `#b3e01c` / Green `#00da00` / Deep Blue `#0007cb` / Report Orange `#fe4c02`。

**暖中性灰阶（DESIGN.md prose）**：Black-80 `#313130` / Black-60 `#626260` / Black-50 `#7b7b78` / Content-Tertiary `#9c9fa5` / Oat `#dedbd6` / Warm-Sand `#d3cec6`。

**环境令牌**：radius `sm 4px / md 6px / lg 8px / pill 9999px`⚠️（pill 令牌存在但 DESIGN.md 禁 pill 按钮——只给 chip/徽章）；space `4/8/12/16/20/24/32/48`；section-y `desktop 96 / tablet 64 / phone 48`；container `max 1280px`，gutter `desktop 24 / tablet 16 / phone 12`。

**阴影 / 焦点**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `0 2px 8px color-mix(in oklab, var(--fg), transparent 94%)`（暖 fg 做阴影色，**不泛灰**）；focus-ring `0 0 0 3px color-mix(in oklab, var(--accent), transparent 70%)`（橙调，键盘焦点贴合 Fin 强调）。

## 三、排版（五字体，全部标题 400 / 1.00 行高 + 负字距）

字体栈：
- Display / Body：`"Saans", "Saans Fallback", ui-sans-serif, system-ui, -apple-system, "Segoe UI", Arial, sans-serif`
- Mono：`"SaansMono", "SaansMono Fallback", ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Consolas, monospace`
- Serif：`"Serrif", "Serrif Fallback", ui-serif, Georgia`
- UI：`"MediumLL", "LLMedium", system-ui, -apple-system`

Token 基础档（design-tokens.json）：`--text-xs 12 / sm 14 / base 16 / lg 20 / xl 24 / 2xl 32 / 3xl 54 / 4xl 80`；`--leading-body 1.5 / --leading-tight 1.0`；`--tracking-display -0.03em`。

**层级表（DESIGN.md）**：

| 角色 | 字体 | 字号 | 字重 | 行高 | 字距 |
|:--|:--|:--|:--|:--|:--|
| Display Hero | Saans | 80px | 400 | 1.00 | -2.4px |
| Section Heading | Saans | 54px | 400 | 1.00 | -1.6px |
| Sub-heading | Saans | 40px | 400 | 1.00 | -1.2px |
| Card Title | Saans | 32px | 400 | 1.00 | -0.96px |
| Feature Title | Saans | 24px | 400 | 1.00 | -0.48px |
| Body Emphasis | Saans | 20px | 400 | 0.95 | -0.2px |
| Nav / UI | Saans | 18px | 400 | 1.00 | normal |
| Body | Saans | 16px | 400 | 1.50 | normal |
| Body Light | Saans | 14px | **300** | 1.40 | normal |
| Button | Saans | 16 / 14px | 400 | 1.50 / 1.43 | normal |
| Button Bold | LLMedium | 16px | **700** | 1.20 | 0.16px |
| Serif Body | Serrif | 16px | **300** | 1.40 | -0.16px |
| Mono Label | SaansMono | 12px | 400–500 | 1.00–1.30 | 0.6–1.2px（大写） |

**要点**：标题共压一行高 1.00、全 400 字重（**不是** Linear 的 510/590）——靠「字号差 + 负字距」分层而非字重；大字号走极度负字距、小字号（≤24px）可放松回 normal；按钮强调用 LLMedium 700（Intercom 允许，与 Linear 的「禁 700」相反）。

## 四、组件样式（按钮 / 卡片 / 导航）

### 按钮
- **Primary Dark（主 CTA）**：底 `#111111`，字 `#ffffff`，padding `0 14px`，圆角 4；hover → **白底 + 深字 + `scale(1.1)`**，active → **绿底 `#2c6415` + `scale(0.85)`**。⚠️ 这两个状态色是 DESIGN.md prose 值，**无对应 token**——且绿 `#2c6415` ≠ token 的 `--success #00da00`，勿混淆。
- **Outlined**：底透明，字 `#111111`，边框 `1px solid #111111`，圆角 4，同款 `scale(1.1)` hover / `scale(0.85)` active
- **Warm Card Button**：底 `#faf9f6`，字 `#111111`，padding `16px`，边框 `1px solid oklab(... / 0.1)`

### 卡片 / 容器
```css
.card {
  background: #faf9f6;          /* 暖奶油；抬升卡片可切 #ffffff（--surface） */
  border: 1px solid #dedbd6;    /* 暖燕麦发丝边框 */
  border-radius: 8px;           /* 4 按钮 / 6 导航项 / 8 卡片容器 */
  /* 无可见阴影 —— 深度靠暖边框 + 表面色差 */
}
```

### 导航
- 链接 Saans 16px；off-black 字 on 白（`#faf9f6`/`#ffffff`）；按钮 4–6px 小圆角
- Fin Orange `#ff5600` 只用于 AI 功能徽标 / 入口，不作导航文字
- sticky header 沿用暖画布或白抬升面 + 底部 `1px solid #dedbd6` 发丝线

### 数据可视化（报表，专属）
- 用 report 调色板多色（蓝/绿/红/粉/柠檬/深蓝）——**只进图表，不进 UI**；UI 强调永远单橙
- 统计数字用 mono（SaansMono）+ 等宽数字

## 五、动效（克制但带「物理感」）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、无过冲）——**Linear 同款曲线**
- **招牌**：按钮 / 点击元素 `scale(1.1)` hover 放大、`scale(0.85)` active 收缩；过渡 `transform`、`background-color`、`color`、`opacity`
- **限**：只做微交互，不做长叙事动画 / 大范围 fade 扫场 / 炫技 keyframes；但「放大—收缩」是 Intercom 刻意保留的物理接触感，**不要平掉它**

## 六、Intercom 自己的「别这样做」

- 别出「冷灰」页面——底色永远是暖奶油 `#faf9f6` + 暖燕麦边框 `#dedbd6`
- 别把按钮圆角拉过 **4px**——锐利几何是身份（pill 只给 chip / 徽章，令牌有但按钮禁）
- 别装饰性滥用 Fin Orange `#ff5600`——只作 AI / 品牌强调（token 语义明确 singular accent）
- 别跳过大标题负字距——80px 要 -2.4px，这是「广告牌工程感」的来源
- 别用冷灰边框 `#9c9fa5` 一类做界面分隔——一律暖燕麦 `#dedbd6` / `#ebe9e4`
- 别把 report 多色调色板（蓝/绿/粉/柠檬…）拿到 UI 里——那是数据可视化专用
- 别用 `#000` 纯黑当主文 / 大底——off-black `#111111` 是正解
- 别把阴影当深度主语言——靠暖边框 + 表面色差分层（raised 阴影近不可见）
- 别平掉按钮的 `scale(1.1)` / `scale(0.85)`——那是 Intercom 的物理签名

## 七、判断词

- ✅ 浅暖、编辑 / 杂志阅读感、锐利近矩形按钮（4px）、暖燕麦发丝边框、极度负字距大标、唯一橙强调、物理缩放交互、五字体生态、数据报表多色但 UI 单橙
- ❌ 冷灰边框、>4px 按钮圆角、装饰性 Fin 橙、跳过大标题负字距（正字距）、多 UI 强调色（红/绿/蓝进 UI）、深阴影 / 彩色 glow、纯黑背景或纯黑主文、把 logo/pill 圆角用到 CTA、重字重（≥700 泛滥）

## 八、适用边界

**适用于**：浅色 SaaS **客服 / 通信 / 帮助台 / 工单 / 对话式 AI 助手**类产品与营销落地页、编辑式（杂志向）内容页、温暖可信的 B2B 客服品牌站、带数据可视化报表的客服后台。核心是「温暖 + 可信 + 对话 + AI 强调」。

**不适用于**：暗色运营后台 / 管理面板（那用 Linear —— 见 `reference-linear.md`）、冷色调科技 / 数据库品牌（那用 Stripe / ClickHouse）、需要极简克制而非温暖友好的产品、消费级电商（那用 Apple / Airbnb）、暖色人文品牌（那用 Claude）。
