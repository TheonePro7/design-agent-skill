# L1 参考解剖 · ClickHouse（暗色数据仪表盘 / 数据库金标准）

> 来源：open-design/design-systems/clickhouse（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**数据密集型 / 数据库 / 数据分析仪表盘 / 监控面板 / 性能指标页 / 深色开发者工具**界面的设计基准。
> 状态：✅ 范例确认（颜色以 design-tokens.json 实测为准；DESIGN.md 与 token 冲突处以 ⚠️ 标注）

---

## 一、核心原则（先记这 9 条）

1. **纯黑是原生画布，不是「深灰」**：页面背景**绝对 `#000000`**（不是 near-black、不是 `#141414`），整页 dark，**绝不出浅色 / 白色背景**。ClickHouse 的界面 = 一块「黑洞画布」上的高性能座舱
2. **唯一彩色：Neon Volt `#faff69`**：酸化黄绿是**全系统唯一色度爆发**——用在强 CTA、accent 边框、链接 hover、高亮卡。其余一律中性灰。靠「neon-on-black」制造最高对比（几乎无渐变，对比本身就是梯度）
3. **字重 900（Inter Black）就是武器**：hero 96px/900 让文字有**物理质量**；全谱 400–900，**「字重即层级」**——重字重就是人格，不可降级
4. **炭灰边框是深度主语言**：在纯黑上阴影几乎不可见，深度**靠 `1px solid rgba(65,65,65,0.8)` 炭灰边框**分档；最独特的深度是 **inset 阴影（「压进表面」）+ neon 边框高亮**
5. **锐利几何 = 数据库精确性**：圆角上限 **8px**（按钮/徽章/代码 4px，卡片 8px）；**绝不超 8px**
6. **大标题走紧字距 / 超紧行高**：display 用 `leading 1.0`（billboard 尺度），`--tracking-display: normal`（大字号不加负字距，靠粗 + 紧）
7. **全大写 + 1.4px 宽字距做结构标签**：section overline 用 14px/600/uppercase/字距 1.4px，在暗底上形成醒目结构标记
8. **状态 / 动作层级**：Forest Green `#166534` **兼作 `--success` + 二级 CTA**（「Get Started」，与 neon 区分动作层级）；**active/pressed 态文字转 Pale Yellow `#f4f692`**（不是纯 opacity 变化）
9. **交互反馈统一**：所有链接 **hover 一律转 Neon Volt**；focus-ring 用 neon 色 tint（`color-mix(in oklab, var(--accent), transparent 70%)`）

## 二、颜色令牌（以 design-tokens.json 为准）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#000000` | 页面 / canvas 背景（**绝对纯黑**，勿用深灰） |
| surface | `#141414` | 按钮底 / 抬升暗面（Near Black） |
| surface-warm | `var(--surface)` | alias（无暖色层，调色板完全中性） |
| fg | `#ffffff` | 主文本（**纯白**，暗面 primary） |
| fg-2 | `#a0a0a0` | 次级正文（Silver） |
| muted | `#a0a0a0` | 说明 / 弱化文本（同 Silver） |
| meta | `#585858` | 元数据 / 最弱中性文本（Mid Gray） |
| border | `rgba(65,65,65,0.8)` | **炭灰主卡片边**（80% 透明）——深度骨架 |
| border-soft | `#343434` | 深炭灰内部分隔（更安静，不抢戏） |
| accent | `#faff69` | **Neon Volt 签名色**（酸化黄绿） |
| accent-on | `#151515` | neon 底上的文字 |
| accent-hover | `#1d1d1d` | neon CTA 的 hover **反转为近黑底** |
| accent-active | `#f4f692` | Pale Yellow——active/pressed 文字态 |
| success | `#166534` | Forest Green——二级 CTA / 成功态（品牌对齐） |
| warn | `#eab308` | 警告 |
| danger | `#dc2626` | 危险 / 删除 |

**⚠️ DESIGN.md 提到但未入 token 的色（勿直接依赖，需按体系自补 alias）**：Dark Forest `#14572f`（边框）、Border Olive `#4f5100`（ghost 按钮边框）、Olive Dark `#161600`、Hover Gray `#3a3a3a`（Dark Solid 按钮 hover）、Border Gray `#e5e7eb`（罕见浅色语境）。**这些仅存在于 DESCRIPTION 描述中，token 集未定义。**

## 三、排版（Inter 主 + Basier 副显示 + Inconsolata 代码）

字体栈（token 权威）：`--font-display: "Inter","Basier",Arial,Helvetica,ui-sans-serif,system-ui,sans-serif`；`--font-body: "Inter",ui-sans-serif,system-ui,-apple-system,"Segoe UI",Roboto,Arial,sans-serif`；`--font-mono: "Inconsolata",ui-monospace,"SF Mono","JetBrains Mono",Menlo,Monaco,Consolas,monospace`。

**字重全谱：400 / 500 / 600 / 700 / 900**（无 300、无 800）。**字重即层级**；`leading`：body 1.5 / display（tight）1.0；display 字距 `normal`。

| Role | 字号 | 字重 | 行高 | 字距 | 备注 |
|:--|:--|:--|:--|:--|:--|
| Display Mega | 96px (`--text-4xl`) | **900** | 1.00 | normal | Inter Black，最大冲击力「物理质量」 |
| Display / Hero | 72px (`--text-3xl`) | 700 | 1.00 | normal | 区块 / hero 标题 |
| Feature Heading | 36px (`--text-2xl`) | 600 | 1.30 | normal | **Basier** 功能锚点标题 |
| Sub-heading | 24px (`--text-xl`) | 600–700 | 1.17–1.38 | normal | 卡片标题 |
| Feature Title | 20px (`--text-lg`) | 600–700 | 1.40 | normal | 小功能标题 |
| Body Large | 18px ⚠️ | 400–700 | 1.56 | normal | 介绍段 / 按钮文字（⚠️ token 未定此档） |
| Body / Button | 16px (`--text-base`) | 400–700 | 1.50 | normal | 正文 / 导航 / 按钮 |
| Uppercase Label | 14px (`--text-sm`) | 600 | 1.43 | **1.4px** | 宽字距结构标签（uppercase）⚠️ tracking 未入 token |
| Caption | 14px (`--text-sm`) | 400–700 | 1.43 | normal | 元数据 / 描述 / 链接 |
| Code | 16px | 600 | 1.50 | normal | Inconsolata，代码块 / 命令（终端感） |
| Small | 12px (`--text-xs`) | 500 | 1.33 | normal | 最小正文 |
| Micro | 11.2px ⚠️ | 500 | 1.79 | normal | 标签 / tiny（⚠️ token 未定此档） |

## 四、组件样式（按钮 / 卡片 / 导航 / 特色组件）

### 按钮
- **Neon Primary**：底 `#faff69`，字 `#151515`（accent-on），padding `0 16px`，圆角 **4**，边框 `1px solid #faff69`；**hover 底反转为近黑 `#1d1d1d`**，字不变；active 字转 `#f4f692`——最吸睛 CTA
- **Dark Solid**（标准动作）：底 `#141414`，字 `#ffffff`，padding `12 16px`，圆角 4/8，边框 `1px solid #141414`；hover 底转 `#3a3a3a`⚠️、字 80% 透明；active 字转 `#f4f692`
- **Forest Green**（「Get Started」转化按钮）：底 `#166534`（success），字 `#ffffff`，padding `12 16px`，边框 `1px solid #141414`；hover 暗色平移；active 字 `#f4f692`
- **Ghost / Outlined**（次级）：底透明，字 `#ffffff`，padding `0 32px`，圆角 4，边框 `1px solid #4f5100`⚠️（olive 调）；active 字 `#f4f692`
- **Pill Toggle**：底透明，圆角 `9999px`（toggle / switch 用）

### 卡片 / 容器
- 底：透明或 near-black（`#141414`）；边框 `1px solid rgba(65,65,65,0.8)`（**炭灰招牌 containment**）；圆角 4（小元素）/ 8（卡片）

### 导航
- 暗色导航于黑底；logo（wordmark + 图标）用 neon/黄；链接白字，**hover 转 Neon Volt**；CTA 用 Neon Volt 或 Forest Green；分类用 uppercase 标签

### 特色组件
- **性能指标 Stats**：超大数字（72px+，700–900），下方简述，关键指标用 neon 高亮——**「性能即论点」的视觉证明**
- **Neon 高亮卡**：标准暗卡 + `1px solid #faff69` 边框，出「selected / featured」态
- **代码块**：暗面 + Inconsolata 600 + neon/白语法高亮，终端风
- **Trust Bar**：暗底公司 logo，单色/白 logo 处理，横排

### 表单 / 焦点
- **Focus ring**（token）：`0 0 0 3px color-mix(in oklab, var(--accent), transparent 70%)`——统一 neon tint 交互信号，链接/按钮/输入一致

## 五、深度与抬高（黑色上阴影几乎不可见，边框做主深度）

| 级别 | 处理 | 用途 |
|:--|:--|:--|
| L0 平 | `none`（elev-flat） | 黑底 / 纯文字块 |
| L1 边框 | `0 0 0 1px var(--border)`（elev-ring） | **标准卡片/容器——主深度机制** |
| L2 微抬 | `0 1px 3px rgba(0,0,0,0.1), 0 1px 2px -1px rgba(0,0,0,0.1)`（elev-raised） | 微卡抬升 |
| L3 抬升 | `0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -4px rgba(0,0,0,0.1)`⚠️ | 特色卡 / hover（DESIGN 描述，未入 token） |
| L4 压入 / inset | `0 4px 25px rgba(0,0,0,0.14) inset`⚠️ | active/pressed——**「压进表面」招牌效果** |
| L5 neon 高亮 | `1px solid #faff69` | featured/selected 卡，最大强调 |
| Focus ring | `0 0 0 3px color-mix(accent, transparent 70%)` | 焦点 ring（token） |

**深度哲学**：ClickHouse 在纯黑上用阴影，几乎不可见——**边框与 inset 才是深度母语**；neon 边框高亮是「抢注意力」的主机制。

## 六、布局 / 间距 / 圆角

- **间距 8px 网格**，token 刻度：`4/8/12/16/20/24/32/48`（space-1…space-12）。**⚠️ DESIGN 所列 `2/6/7/10/25/40/44` 不在 token 刻度内**，用 token 刻度
- **区块纵向节奏**（宽松）：desktop `64px` / tablet `48px` / phone `32px`
- **容器宽度**：`--container-max: 1280px`（**token 权威默认**）。**⚠️ DESIGN 称「up to 2200px 超宽」**——那是 ultra-wide 上限，1280px 才是可用默认
- **gutter**：desktop `24px` / tablet `16px` / phone `12px`
- **圆角**：4px（按钮/徽章/代码）· 8px（卡片/容器）· `9999px`（toggle/状态指示）；**绝不超 8px**

## 七、动效（克制——强度在颜色与字重，不在动画）

- **时长**：fast `150ms` / base `200ms`
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（ease-standard）
- **只过渡**：`background-color` / `border-color` / `opacity`，snappy 到足以感觉「高性能」；**禁** spring/过冲/长叙事/炫技 keyframes

## 八、ClickHouse 自己的「别这样做」

- 别引入额外颜色——严格 黑 / neon / 绿 / 灰
- 别把 neon 当大背景填充——它只是 accent 边框 + CTA 底
- 别把 hero/display 字重降到 **700 以下**——重字重是人格
- 别用浅色 / 白背景——**整页 dark**
- 别把圆角做到 8px 以上——锐利几何反映数据库精确性
- 别在黑色上用柔和扩散阴影——看不见；**用边框做主深度**
- 别跳过 pressed 的 **inset 阴影**——「压进表面」是招牌
- 别用暖中性色——**所有灰都完全中性**
- 别把页面背景替换成深灰 `#141414`——永远 `#000000`
- 别用纯黑 `#000000` 当次级 deep 画布之外还在浅色上套一层——无浅色模式
- 别把容器默认拉满到 2200px——token 默认 1280px
- 别用暖黄 / 暖橙做交互——accent 是酸黄绿（`#faff69`），不是琥珀

## 九、判断词

- ✅ 终端 / 仪表盘感、neon-on-black 高对比、重量感字重（900）、锐利 4/8px 几何、炭灰边框、资源密集 / 大口径数字、性能数据即视觉论点、uppercase 宽字距结构标签
- ❌ 柔和渐变、软阴影、暖色 / 浅色、圆润大圆角、多强调色、细字重 hero、轻快 friendly 风、长叙事动效

## 十、适用边界

**适用于**：数据分析 / 数据库产品（ClickHouse 类）、数据仪表盘 / 监控面板 / BI、性能指标与测试基准页、深色开发者工具 / 终端风、一切「数据密集 + 深色 + 图表」界面。

**不适用于**：浅色 / 明亮营销落地页（那用 Stripe——`reference-stripe.md`）、克制极简暗色 SaaS 运营后台（那用 Linear——`reference-linear.md`，Linear 是冷灰 + 蓝紫 + 发丝白边框、克制的「工程感」；ClickHouse 是纯黑 + neon volt + 字重 900、张狂的「速度感」，虽是同属暗色但人格相反）、暖色人文品牌（Claude）、消费级电商、需要「轻快友好」的浅色产品界面。

---

### 与 Linear 的快速区分（同为暗色，用途不同）
| 维度 | Linear | ClickHouse |
|:--|:--|:--|
| 画布 | `#08090a` 近黑（带冷蓝调），**忌纯黑** | `#000000` 绝对纯黑 |
| 彩色 | 薰衣草 indigo `#5e6ad2` / 紫 `#7170ff`（冷） | Neon Volt `#faff69` 酸黄绿（唯一爆发） |
| 深度 | 白透明度梯级 `rgba(255,255,255,0.02~0.05)` + 发丝白边框 | 炭灰边框 `rgba(65,65,65,0.8)` + inset 压入 |
| 字重 | 签名 510，上限 590，**禁 700** | 签名/武器 **900**，全谱 400–900 |
| 情绪 | 精密、克制、冷工程感 | 高对比、速度、张狂功率感 |
