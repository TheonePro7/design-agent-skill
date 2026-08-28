# L1 参考解剖 · GitHub（开发者平台 / 功能密度金标准）

> 来源：open-design/design-systems/github（DESIGN.md + design-tokens.json + tokens.css，`token-contract.report.json` 实测）
> 用途：任何**代码优先开发者平台 / 代码托管 / CI 工具 / 工程面板 / 数据密集型浅色后台**的设计基准。
> 状态：✅ 范例确认（56 token 全 source-backed，score 100 / grade excellent；颜色以 design-tokens.json 为准，冲突见 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **白是原生媒介，不是「黑皮肤的反面」**：页面画布硬白色 `#ffffff`（`--bg`），次级面 `#f6f8fa`（`--surface`，侧栏/输入底/表头条），代码内嵌面 `#eaeef2`。**无暖调、无渐变、无 tint**——是工程面，不是营销面
2. **信息密度就是品牌**：正文 14px（**不是 16px**），列表行 16px 横 / 12px 纵内边距，行高 1.5 紧凑排布——一个视口能扫百行而不滚动。**留白是稀缺品**
3. **发丝灰边框定义结构**：统一 `#d0d7de`（`--border`）画每个窗格/面板。**深度靠边框不靠阴影**——`--elev-flat:none` 是默认，阴影只在极少数浮层
4. **唯一交互色 = Primer 蓝 `#0969da`**：链接、主 CTA、焦点环全部走它。**绿 `#1a7f37` 只给成功/合并/open 状态**，不抢交互
5. **系统字体即声明**：全文 `system-ui`（-apple-system / Segoe UI / Noto Sans / Helvetica），**一辈子不加载 webfont**——慢连接秒渲染是 GitHub 的立场；代码用 `SFMono / Menlo / Consolas`
6. **字重二元制**：默认 400，标题与强调 600。**没有 500、没有 700**（此点与 Linear 的 510/590 完全相反）
7. **圆形状态胶囊是语义锚点**：Issue/PR 状态用 9999px 药丸 + 强语义色（open 绿 / closed 红 / merged 紫 / draft 灰），一眼读状态
8. **跟 Linear 是相反的两极**：Linear = 暗色原生 + 半透明面 + 白透明度梯级分深度；GitHub = **白原生 + 实心灰边框 + 实心色语义标签**。做 GitHub 风就**别**用半透明/发丝白那套

## 二、颜色令牌（可直接照抄，以 design-tokens.json 为准）

### L1 主色（source-backed，被 `tokens.css:30-53` 逐条背书）

| Token | 值 | 用途 |
|:--|:--|:--|
| --bg | `#ffffff` | 页面 / canvas 主背景（硬白，**无暖调**） |
| --surface | `#f6f8fa` | 次级面 / 侧栏 / 输入底 / 表头条（canvas-subtle） |
| --surface-warm | `var(--surface)` | 别名槽，Primer 无暖层（⚠️ 即 --surface 本身） |
| --fg | `#1f2328` | 主文本 / 标题 / ink（fg-default） |
| --fg-2 | `#1f2328` | 别名槽，Primer 不拆 B-slot，同 ink |
| --muted | `#656d76` | 次级文本 / 说明 / 文件路径（fg-muted） |
| --meta | `#656d76` | 元数据，同 muted 层 |
| --border | `#d0d7de` | **发丝结构边框**（默认，面板/卡片/输入） |
| --border-soft | `#d8dee4` | 面板内分隔线（border-muted） |
| --accent | `#0969da` | **Primer 蓝**：链接 / 主 CTA / 焦点环基色——系统唯一交互色 |
| --accent-on | `#ffffff` | accent 上的文字 |
| --accent-hover | `#0550ae` | accent hover / 按下 |
| --accent-active | `color-mix(in oklab, var(--accent), black 14%)` | accent active（⚠️ 计算值，勿硬编码） |
| --success | `#1a7f37` | **GitHub 绿**：合并 / open / 成功——唯一绿语义 |
| --warn | `#9a6700` | 注意力黄琥珀文字 |
| --danger | `#cf222e` | closed / 破坏性操作红 |

### DESIGN.md 语义扩展（⚠️ 仅 DESIGN.md 出现，未 token 化——按需使用，区分对待）

> 这些是 DESIGN.md 手写的额外色，**没有进 design-tokens.json**（56 token 只含上面主色 + 排版/间距/结构层）。在 token 体系里不保证，标注 ⚠️ 以明示其「设计文档级」而非「token 级」的出处。

- ‼️ **Primary Green Button 底色 `#1f883d`**（DESIGN.md §4）：与 token `--success #1a7f37` **冲突**——绿语义值 token 只保证 `#1a7f37`。做实底绿 CTA 时**以 `--success #1a7f37` 为准**（拿它当 hover 深色也可），`#1f883d` 仅当 DESIGN.md 层的按钮亮底参考 ⚠️
- ⚠️ `accent-subtle `#ddf4ff``：callout / info 横幅的柔和蓝面
- ⚠️ `success-subtle `#dafbe1``：成功面 tint
- ⚠️ `danger-subtle `#ffebe9``：报错横幅面
- ⚠️ `attention-subtle `#fff8c5``：警告横幅面
- ⚠️ `done-purple `#8250df``：合并并归档 / done / 高级徽章
- ⚠️ `sponsor-pink `#bf3989``：Sponsors 心形品牌色
- ⚠️ `border-subtle `#eaeef2``：表格行弱分隔（注意：CODE 块背景也用 `#eaeef2`）

### Dark Theme（⚠️ DESIGN.md §2 手写，全部未 token 化）

| 变量（DESIGN.md 名） | 值 | 用途 |
|:--|:--|:--|
| Dark Canvas | `#0d1117` | 暗底页背景 |
| Dark Surface | `#161b22` | 暗底次级面 / 侧栏 / 表头 |
| Dark Border | `#30363d` | 暗底标准边框 |
| Dark Fg | `#e6edf3` | 暗底主文本 |

**结构层 token（source-backed）**：radius sm/md `6px`（Primer 通用）、lg `12px`、pill `9999px`。间距 4px 基数 `--space-1..12`：4/8/12/16/20/24/32/48。容器 max-width `1280px`，gutter desktop 24 / tablet+phone 16。section-y desktop 64 / tablet 48 / phone 32。

## 三、排版（system-ui + SFMono，无 webfont）

字体栈：`font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Noto Sans", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";`
Mono：`font-family: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas, "Liberation Mono", monospace;`
**系统字体始终、永不自担 webfont**。字重只有 400 / 600 两档。唯一负字距在 Display（`--tracking-display: -0.01em`）。

| 层级 | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| Display | 32px (`--text-4xl`) | 600 | 1.25 | -0.01em | repo header / hero |
| H1 | 24px (`--text-2xl`) | 600 | 1.25 | normal | 页标题 |
| H2 | 20px (`--text-xl`) | 600 | 1.25 | normal | 区块标题 |
| H3 | 16px (`--text-lg`) | 600 | 1.25 | normal | 子区块 / 面板头 |
| Body | **14px** (`--text-sm`/`--text-base`) | 400 | 1.5 | normal | **默认正文——不是 16px** |
| Body Small / Meta | 12px (`--text-xs`) | 400 | 1.4 | normal | 说明 / 文件元数据 |
| Code | SFMono 12px | 400 | 1.45 | normal | 代码块 / diff |
| Code Inline | SFMono 0.85em | 400 | inherit | normal | 行内 `code` |

**徽章/Label 字**：12px / 500（⚠️ DESIGN.md §4 Label 用了 500——与「无 500」冲突，**优先按 400 或 600 处理**；标签的可读性用 padding+圆角补偿）。

## 四、组件样式（按钮 / 卡片 / 输入 / 状态胶囊 / 标签）

### 按钮
- **Primary（绿）**：底 `#1f883d`，字 `#ffffff`，边框 `1px solid rgba(31,35,40,0.15)`，padding 5px 16px，圆角 6，阴影 `0 1px 0 rgba(31,35,40,0.1)`；hover 底 `#1a7f37`。作用于「Create repository」/「Merge pull request」。⚠️ 绿底以 `--success #1a7f37` 为准（见二）
- **Default**：底 `#f6f8fa`，字 `#1f2328`，边框 `1px solid #d0d7de`，padding 5px 16px，圆角 6；hover 底 `#f3f4f6`
- **Outline（蓝链接式）**：底 `#ffffff`，字 `#0969da`，边框 `1px solid #d0d7de`；hover 底 `#0969da`、字 `#ffffff`
- **Danger**：底 `#ffffff`，字 `#cf222e`，边框 `1px solid #d0d7de`；hover 底 `#a40e26`、字 `#ffffff`

### 卡片 / Box
- 底 `#ffffff`，边框 `1px solid #d0d7de`，圆角 6，padding 16px（头）+16px（体）
- 头部常带 `#f6f8fa` 色条 + 底边框——用色条而非阴影做分区

### 输入
- 底 `#ffffff`，边框 `1px solid #d0d7de`，圆角 6，padding 5px 12px
- focus：边框 `#0969da`，ring `0 0 0 3px rgba(9,105,218,0.3)`（=`--focus-ring`）

### 状态胶囊（Issue / PR，9999px 药丸）
- **Open**：底 `#1a7f37`，字白，padding 4px 10px，radius 9999px
- **Closed**：底 `#cf222e`，字白
- **Merged**：底 `#8250df`（done-purple），字白
- **Draft**：底 `#6e7781`，字白

### 标签（Issue/PR 上的 Tags）
- padding `0 7px`，radius 9999px，字号 12px / 500
- 底与文字**程序化**：底色即 label 色，前景色按对比度自动计算

## 五、动效（更克制，几乎是「黑」）

- **时长**：hover `80ms`（`--motion-fast`）；菜单/popover 展开 `200ms`（`--motion-base`）
- **曲线**：`ease-out` 出场（`--ease-standard`），`ease-in` 收起
- **刻意避免**：页面加载动画、视差、持续微交互。**东西出现，它们不表演**——这是 GitHub 的克制极限
- 对比 Linear 的 150/200ms + 顺滑曲线，GitHub 干脆 80ms 快闪 + 不渲染叙事

## 六、GitHub 自己的「别这样做」

- 别脱离「密集列表 + 边框盒 + 系统字体」三者一起来做——孤立一个绿按钮不够，要整套工程面
- 别把绿当交互色——**绿只给构建性/成功态**（merge / open / success），交互一律蓝
- 别在绿系列外再发明一种「主色」——蓝 `#0969da` 是唯一交互色
- 别用装饰性阴影或大营销卡片——那是浅色营销页（Stripe 范畴）；工程面用**边框 + 紧凑间距**
- 别用暖色做交互 / 别加渐变 tint / 别用半透明发丝白边框——白底是实心边、实心色语义
- 别加载 webfont / 别用大字号正字距——system-ui + 仅 Display 负字距
- 别用 500 / 700 字重——只有 400 和 600
- 别做动画叙事——80ms hover / 200ms open，无 page-load 动效、无视差

## 七、判断词

- ✅ 白色原生画布、发丝灰边框分格、Primer 蓝交互、绿仅成功态、14px 高密度正文、system-ui + SFMono、二元字重（400/600）、圆形语义状态胶囊、Octicon 单线图标、安静克制的快速动效
- ❌ 阴影深度的卡片、半透明白边框、渐变、多彩营销色、暖色交互、自担 webfont、大圆角装饰 CTA、500/700 字重、动画叙事、彩色 glow

## 八、适用边界

**适用于**：代码托管 / Git 平台、CI/CD 面板、开发者控制台、数据密集型浅色后台管理面板、issue/PR/工作流类工具、工程提效型 SaaS。

**不适用于**：暗色 SaaS 运营后台金标准（那用 Linear——见 `reference-linear.md`）、浅色高消费感营销落地页（那用 Stripe）、暖色人文品牌（那用 Claude）、消费级电商与轻快友好型消费产品。
