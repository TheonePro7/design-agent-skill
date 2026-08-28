# L1 参考解剖 · Notion（浅色生产力 / 知识库 SaaS 金标准）

> 来源：open-design/design-systems/notion（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**浅色 / 明亮的产品营销页、知识库、文档型 SaaS、生产力工具、白板 / 笔记应用**的设计基线。与 Linear（暗色后台）互补，这是「空白画布」那一极。
> 状态：✅ 范例确认。颜色 / 尺寸以 design-tokens.json（source-backed，score 100 / grade excellent）为准；DESIGN.md 与 tokens 冲突处以 tokens 为准并标 ⚠️。

---

## 一、核心原则（先记这 8 条）

1. **空白画布，别挡内容**：页面 canvas 是纯白 `#ffffff`，主角永远是用户内容（文字 / 页面 / 表格），不是 chrome。设计的目的就是「隐形」。
2. **文字不是纯黑**：主文本用近黑 `rgba(0,0,0,0.95)` 而非 `#000000`——一种微妙的暖意，让大段文字阅读不刺眼。纯黑只留给徽章字 / 强强调场景。
3. **暖中性（暖灰）是灵魂**：所有灰阶都带黄棕底色 `#f6f5f4`（暖白）、`#31302e`（暖暗）、`#615d59`（暖灰 500）、`#a39e98`（暖灰 300）——**绝不用蓝灰 / 冷灰**。这让界面像「质感纸张」而非「冰冷玻璃」。
4. **唯一饱和色 = Notion Blue**：`#0075de` 是核心 UI chrome 里唯一的高饱和色，只给 CTA / 链接 / 交互强调。状态色（成功 / 警告 / 危险）只用于指示元素，不抢主体。
5. **发丝边框**：默认分隔是 `1px solid rgba(0,0,0,0.1)`（whisper border），重一分则嫌吵。结构靠「细边 + 色块轮替」而非粗线。
6. **阴影是「感觉得到、看不见」的**：4~5 层阴影叠加，单层透明度**永不超 0.05**（0.01→0.04），blur 1.04px→52px，营造天然环境光而非电脑感深度。深度靠阴影，不靠边框厚重。
7. **大标题压缩字距**：显示级字号一律负字距（64px→-2.125px / token `-0.033em`），越到正文（16px）回归 normal。字距随字号缩放。
8. **四档字重 + OpenType**：400 读 / 500 交互 / 600 强调·导航 / 700 宣告·标题；显示与标题文字开 `"lnum"`（齐线数字）与 `"locl"`（本地化字形）。

## 二、颜色令牌（source-backed，可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#ffffff` | 页面 / canvas（纯白） |
| surface | `#f6f5f4` | 暖白：区块轮替 / 卡片填充（黄棕底色是精髓） |
| surface-warm | `var(--surface)` | surface 别名（同暖白 tier） |
| fg | `rgba(0,0,0,0.95)` | **主文本 / 标题 / 正文**（近黑，勿用 `#000000`） |
| fg-2 | `#31302e` | 暖暗：surface 上的标题 / 暗底文字 |
| muted | `#615d59` | 次级文本 / 描述 / 弱化标签 |
| meta | `#a39e98` | 占位 / 说明 / 禁用态 / 时间戳 |
| border | `rgba(0,0,0,0.1)` | 标准发丝边框（卡片 / 分隔 / 图片描边） |
| border-soft | `rgba(0,0,0,0.06)` | 更隐的分隔线 / 行分隔 |
| accent | `#0075de` | Notion Blue——CTA / 链接 / 交互（**核心 UI 唯一饱和色**） |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `#005bab` | accent 元素的 hover / 按下深蓝 |
| accent-active | `color-mix(in oklab, accent, black 14%)` | 按下态（由 accent 压暗派生 ≈ `#0062be`）⚠️ |
| success | `#1aae39` | 成功 / 完成徽章（绿，**权威**）⚠️ |
| warn | `#dd5b00` | 警告 / 警示（橙） |
| danger | `#dc2626` | 危险 / 删除 |

**阴影 / 焦点（辅助，非深度主体）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `rgba(0,0,0,0.04) 0 4px 18px, rgba(0,0,0,0.027) 0 2px 7.85px, rgba(0,0,0,0.02) 0 0.8px 2.93px, rgba(0,0,0,0.01) 0 0.175px 1.04px`（四层，单层 ≤0.04）；focus-ring `0 0 0 3px rgba(9,127,232,0.3)`（focus 蓝，`#097fe8` @30%）。

**⚠️ DESIGN.md 有、但不在核心 token 集的色（营销 / 装饰专用，非核心 UI）**：Deep Navy `#213183`（次级品牌色，深色 feature 区）、Pink `#ff64c8` / Purple `#391c57` / Brown `#523410`（装饰 / 高级功能强调）、Teal `#2a9d99`（**⚠️ DESIGN 把它标为 success，但 token `--success` = 绿 `#1aae39`，绿是权威**）。徽章色 Badge Blue Bg `#f2f9ff` + Badge Blue Text `#097fe8`；Link Light Blue `#62aef0`（暗底链接）。

## 三、排版（NotionInter = 改良 Inter，OpenType lnum+locl）

字体栈：`font-family: "NotionInter", "Inter", -apple-system, system-ui, "Segoe UI", Helvetica, Arial, sans-serif;`
Mono：`font-family: ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Monaco, Consolas, monospace;`
**显示 / 标题文字**开 `font-feature-settings: "lnum", "locl"`。四档字重：400 读 / 500 交互 / 600 强调·导航 / 700 宣告·标题。

| Role | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| display-hero | 64px | 700 | 1.00 | -2.125px（token -0.033em） | 头图大标题，最大压缩 |
| display-secondary | 54px | 700 | 1.04 | -1.875px | 副 hero / feature 标题 |
| section-heading | 48px | 700 | 1.00 | -1.5px | feature 区块标题 |
| sub-heading-lg | 40px | 700 | 1.50 | normal | 卡片标题 / feature 小节（⚠️ row 用宽松行高） |
| sub-heading | 26px | 700 | 1.23 | -0.625px | 区块小节 / 内容标题 |
| card-title | 22px | 700 | 1.27 | -0.25px | feature 卡 / 列表标题 |
| body-lg | 20px | 600 | 1.40 | -0.125px | 引言 / feature 描述 |
| body | 16px | 400 | 1.50 | normal | 正文（token leading-body） |
| body-md | 16px | 500 | 1.50 | normal | 导航 / 强调 UI |
| body-semibold | 16px | 600 | 1.50 | normal | 强标签 / 激活态 |
| nav / button | 15px | 600 | 1.33 | normal | 导航链接 / 按钮文字 |
| caption | 14px | 500 | 1.43 | normal | 元数据 / 次级标签 |
| caption-light | 14px | 400 | 1.43 | normal | 正文说明 |
| badge | 12px | 600 | 1.33 | **+0.125px** | 徽章 / 标签 / 状态（**唯一正字距**，更易读） |
| micro-label | 12px | 400 | 1.33 | +0.125px | 小元数据 / 时间戳 |

**规则：**
- **压缩随字号**：64px→-2.125px，54px→-1.875px，26px→-0.625px，16px 起 normal。大标题越压越「精准」，正文保持可读。
- **行高随字号收紧**：正文 1.50（16px）→ 副标题 1.23~1.27 → 显示级 1.00~1.04。字越大行越密。
- **四档字重**是系统招牌——比多数系统多一档，层次更细腻。**Badge 的 +0.125px 正字距是全系统唯一正 tracking**。

## 四、组件样式（按钮 / 卡片 / 表格 / 徽章 / 导航）

### 按钮（统一 4px 圆角）
- **Primary（品牌蓝）**：底 `#0075de`，字 `#ffffff`，padding 8px 16px，圆角 4，边框 `1px solid transparent`，hover 底 → `#005bab`，active `scale(0.9)`，focus 蓝环——主 CTA（"Get Notion free" / "Try it"）
- **Secondary / Tertiary**：底 `rgba(0,0,0,0.05)`（半透明暖灰），字 `#000000`，padding 8px 16px，圆角 4，hover 字色变化 + `scale(1.05)`，active `scale(0.9)`——次级操作 / 表单提交
- **Ghost / Link**：透明底，字 `rgba(0,0,0,0.95)`，hover 下划线——三级操作 / 行内链接
- **Pill Badge Button**：底 `#f2f9ff`（淡蓝），字 `#097fe8`，padding 4px 8px，圆角 9999（全药丸），12px/600——状态徽章 / feature 标签 / "New"

### 卡片 / 容器
```css
.card {
  background: #ffffff;
  border: 1px solid rgba(0,0,0,0.1);   /* whisper border —— 永不更重 */
  border-radius: 12px;                 /* 12 标准 / 16 featured-hero */
  box-shadow: elev-raised;             /* 四层，单层 ≤0.04 —— 感觉得到、看不见 */
}
.card:hover { box-shadow: 微微增强; }
.img-card { border-radius: 12px 12px 0 0; }  /* 顶圆，图片铺上半部 */
```
- 无渐变 / 无重边框；分离靠背景色轮替（白 ↔ 暖白 `#f6f5f4`）+ 间距，不用硬分界线。

### 表格（源未显式给出，按系统规律推断——⚠️ Inferred）
- 无斑马纹，行间用 `rgba(0,0,0,0.06)` 发丝线分隔，列宽天然对齐，无竖向分隔
- 表头 14px/500/`#615d59`（小标签感）；单元格 14px/400/`rgba(0,0,0,0.95)`（次级 `#615d59`）
- hover 行背景提亮到 `#f6f5f4` 或 `rgba(0,0,0,0.02)`；数字用等宽 + `tabular-nums`

### 徽章 / Pill
- **Status Pill**：底 `#f2f9ff`，字 `#097fe8`，圆角 9999，padding 4px 8px，12px/600（状态 / 标签，"New"）
- **Success Pill**：底 `#1aae39`（绿），字 `#ffffff`，圆角 9999（完成指示）
- **Neutral Badge**：透明 + `#615d59` 字，圆角 9999，发丝边 `rgba(0,0,0,0.1)`，12px/600（普通 tags）

### 输入 / 表单
- 底 `#ffffff`，字 `rgba(0,0,0,0.9)`，边框 `1px solid #dddddd`，padding 6px，圆角 4，focus 蓝环 `focus-ring`，placeholder 用暖灰 `#a39e98`

### 导航
- 白色横排导航（**非 sticky**）；品牌 logo 居左（33×34px 图标 + wordmark）
- 链接 15px/600/近黑，hover 字色变化；CTA 蓝 pill "Get Notion free" 居右；移动端汉堡折叠

## 五、动效（克制、快速、无叙事）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑、无过冲）
- **只做微交互**：按钮 hover `scale(1.05)`→按下 `scale(0.9)`；文字 hover 变色 + 链接下划线弹出，过渡 `color` / `background-color` / `box-shadow` / `transform`
- **禁**：弹跳 / 弹性 / 过冲（spring）、大幅移动、长叙事动画、大范围 fade 扫场、炫技 keyframes

## 六、Notion 自己的「别这样做」

- 别用冷灰 / 蓝灰——调色板是**暖中性**（黄棕底 `#f6f5f4` / `#31302e` / `#615d59` / `#a39e98`），用蓝灰就不是 Notion
- 别用纯黑 `#000000` 当主文本——主文永远 `rgba(0,0,0,0.95)`（近黑带暖意）
- 别加第二个高饱和强调色——核心 UI 只绕 Notion Blue `#0075de` 转；粉 / 紫 / 棕 / teal 仅营销装饰
- 别用重边框 / 实心暗线做主分隔——默认发丝 `rgba(0,0,0,0.1)`，重一分就吵
- 别把阴影调重——单层透明度**永不超 0.05**（0.01→0.04），深度是「感觉而非看见」
- 别在大字号加正字距——显示级一律负字距（64px→-2.125px），正文 16px 起才放松
- 别给按钮用大圆角——4px 是按钮 / 输入的圆角，药丸 9999 只给 badge / pill
- 别用单层硬阴影 / 强烈 drop-shadow——多层的低透明累积才是 Notion 质感的来源
- 别做 sticky 高亮导航 / 放射状装饰——Notion 是「内容让路」的空白画布，chrome 应隐身

## 七、判断词

- ✅ 白 canvas、近黑文字（`rgba(0,0,0,0.95)`）、暖灰系、蓝 accent、发丝边、多层低透明阴影、负字距大标、大留白、内容让路、知识库 / 文档 / 生产力工具感
- ❌ 冷蓝灰、纯黑主文本、多个高饱和强调色、重边框、单层硬阴影、正字距大标、大圆角按钮、炫技动效、满屏 chrome 抢戏

## 八、适用边界

**适用于**：浅色 / 明亮的产品营销落地页、知识库、文档型 SaaS、笔记 / 白板 / 生产力工具、协作工作台、需要「空灵 / 留白 / 温度」的浅色界面。

**不适用于**：暗色 SaaS 运营后台 / 管理面板 / 开发者工具（那用 Linear，见 `reference-linear.md`）、需要强烈品牌视觉的营销 hero（那用 Stripe / Vercel）、暖色人文品牌（那用 Claude）、消费级电商 / 影音（那用 Apple / Airbnb）、任何需要「冷灰 + 暗色原生」的工程感界面。
