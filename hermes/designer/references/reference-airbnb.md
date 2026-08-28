# L1 参考解剖 · Airbnb（消费 / 旅行电商 / 图片导向金标准）

> 来源：open-design/design-systems/airbnb（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**消费 / 旅行 / 住宿 / 家居 / 图片驱动电商平台、温暖留白型 toC 界面**的设计基准。
> 状态：✅ 范例确认（颜色以 design-tokens.json 实测为准；DESIGN.md 叙述中的非 token 颜色一律标注 ⚠️）

---

## 一、核心原则（先记这 9 条）

1. **图片驱动，界面退场**：全出血摄影（full-bleed，4:3 / 16:9，14–20px 圆角）是主视觉词汇；纯白画布让 listing「呼吸」，UI chrome 刻意做薄，让照片成为前景
2. **唯一彩色 = Rausch 珊瑚粉 `#ff385c`**：只用于 primary CTA（Reserve/Search/Add dates）、搜索触发、激活 tab 下划线、心愿单心形、价格强调。**每视口 Rausch 出现硬上限 2 处**——出现第 3 处就中性化一个
3. **浅色原生，卡片不跳变**：`--bg` 与 `--surface` 同为 `#ffffff`——卡片直接坐画布上，**无色调梯级**；分隔靠 Hairline Gray `#dddddd` 边框 + 卡片内的照片，**绝不靠表面 tint**（#Bind 1）
4. **近黑 = Ink Black `#222222`**：承载约九成文本（标题 / 正文 / 导航 / 价格），**永不使用 `#000000`**（#Bind 6 附近叙述）
5. **单一家族扛全场**：Airbnb Cereal VF 从 8px 法律注脚到 28px 页级标题；视觉身份来自族本身，**绝不混排字体**（#Bind 7 前叙述）
6. **500 是新的 400**：系统「正文」基准字重是 500，给每段文字多一层自信密度；强调用 600，标题用 700。**禁用 400-regular**（⚠️ 见下内部矛盾）
7. **圆形 50% 是签名几何**：所有 icon button / 头像 / 心愿单心形一律 `50%` 圆形；按钮按下被还原为 `transform: scale(0.92)` 的物理按压感
8. **三层堆叠阴影是签名抬升**：**禁单层 drop shadow**；booking panel / modal / dropdown 用「2% hairline ring + 4% short blur + 10% medium blur」三层堆叠，读作一次连贯抬升
9. **focus-ring 用 Ink Black，不是 accent**：聚焦标识是 2px `#222222`（不是 Rausch）——否则在 full-bleed 彩色摄影上会消失；叠照片上的圆形按钮另用 4px 白色分隔环

## 二、颜色令牌（以 design-tokens.json 为准，可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#ffffff` | canvas / 页面背景（Canvas White） |
| surface | `#ffffff` | 卡片 / 容器（与 bg 同值，无色调跳变；#Bind 1） |
| surface-warm | `#f7f7f7` | Soft Cloud — footer 底 / map wrapper / 日历中段日期（#Bind 2） |
| fg | `#222222` | Ink Black — 主文本 / 近黑（**勿用 `#000000`**） |
| fg-2 | `#3f3f3f` | Charcoal — focus 输入文本 / 次级强调减速 |
| muted | `#6a6a6a` | Ash Gray — 次级标签 / "Cottage rentals" 式副标题 / muted footer 链接 |
| meta | `#929292` | Mute Gray — 禁用按钮 / 低优先元数据 |
| border | `#dddddd` | Hairline Gray — 主分隔线 / 卡片边框 / 行分隔（布局主力） |
| border-soft | `#ebebeb` | 更浅 hairline — 密集列表内部弱分隔 |
| accent | `#ff385c` | Rausch — primary CTA / 搜索 / 激活 tab / 心形 / 价格强调（**唯一彩色**） |
| accent-on | `#ffffff` | accent 上的文字 |
| accent-hover | `#e31c5f` | accent 元素 hover（手配，插在 Rausch 与 Deep Rausch 之间；#Bind 3）⚠️ DESIGN 未命名 |
| accent-active | `#e00b41` | Deep Rausch — 按下 / 激活态（DESIGN §2 实值，#Bind 3） |
| success | `#008a05` | 成功（手配暖绿，DESIGN 未指定）⚠️ |
| warn | `#c47700` | 警告（burnt amber，DESIGN 未指定）⚠️ |
| danger | `#c13515` | 危险 / 校验错误（Error Red，DESIGN §2） |

**排版 / 结构令牌**：`--font-display` = `--font-body` = `Airbnb Cereal VF, Airbnb Cereal App, Circular, -apple-system, system-ui, Helvetica Neue, Roboto, sans-serif`（同栈，身份来自族本身）；`--font-mono` = `ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Monaco, Consolas, monospace`。

**阴影 / 焦点**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（边框当阴影）；elev-raised `rgba(0,0,0,0.02) 0 0 0 1px, rgba(0,0,0,0.04) 0 2px 6px 0, rgba(0,0,0,0.1) 0 4px 8px 0`（签名三层）；focus-ring `0 0 0 2px var(--fg)`（**Ink Black，非 accent**；#Bind 6）。

**⚠️ 冲突 / 非 token 颜色（只存在于 DESIGN.md 叙述层，不在 tokens，谨慎使用）**：
- **Stone Gray `#c1c1c1`** — 非 token。DESIGN §2 用作三级分隔 / 图标描边 / 占位头像；§4 又用作「禁用按钮文字」。但 §2 说禁用按钮用 `#929292`（meta）、§4 却用 `#c1c1c1`——**DESIGN 内部矛盾，禁用文字以 token `#929292` 为准** ⚠️
- **Plus Magenta `#92174d`** — 非 token。Airbnb Plus 产品层 accent，**只在该层内联**，不提升为共享 token（tokens.css 注释刻意不提升）⚠️
- **Luxe Purple `#460479`** — 非 token。Airbnb Luxe 产品层 accent，只内联 ⚠️
- **Info Blue `#428bff`** — 非 token。法律 / 说明链接（terms / privacy / disclosures），系统内唯一非单色链接色 ⚠️
- **Deep Error `#b32505`** — 非 token。错误状态按下 / hover 变体 ⚠️
- **Translucent Black `rgba(0,0,0,0.24)`** — 非 token。禁用 material 标签 ⚠️
- **品牌渐变 `linear-gradient(90deg, #ff385c 0%, #e00b41 50%, #92174d 100%)`** — 只用于 wordmark / 搜索按钮的「branded moment」，**绝不当整面**；终端值含非 token 的 Plus Magenta ⚠️

> 语义色纪律：总语义色像素占比 <5%——Airbnb 几乎不渲染状态。success / warn 是 tokens.css 手配值，非 DESIGN 品牌事。

## 三、排版（Airbnb Cereal VF 单一家族，无 OpenType 签名）

字体栈：`--font-display` = `--font-body` = `"Airbnb Cereal VF", "Airbnb Cereal App", Circular, -apple-system, system-ui, "Helvetica Neue", Roboto, sans-serif`
Mono：`ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Monaco, Consolas, monospace`
**字号阶梯**（token）：`text-xs 12 / text-sm 14 / text-base 16 / text-lg 20 / text-xl 22 / text-2xl 28 / text-3xl 44 / text-4xl 56px`。
**全局**：`--leading-body 1.43`、`--leading-tight 1.2`、`--tracking-display -0.02em`（仅 ≥20px 生效）。

| Token | 字号 | 字重 | 行高 | 字距 | 用途 |
|:--|:--|:--|:--|:--|:--|
| text-4xl | 56px | 700 | 1.20 | — | Guest Favorite 评分上限（display ceiling） |
| text-3xl | 44px | 700 | 1.20 | — | Guest Favorite 评分 / hero numeral |
| text-2xl | 28px | 700 | 1.43 | 0 | 区块标题（"Inspiration for future getaways"） |
| text-xl | 22px | 500 | 1.18 | -0.44px | 子区块标题（"What this place offers"） |
| text-lg | 20px | 600 | 1.20 | -0.18px | 房源标题（listing headline） |
| text-base | 16px | 500–600 | 1.25 | 0 | 正文 medium / 副标题 bold / button large |
| text-sm | 14px | 500–600 | 1.29–1.43 | 0 | 按钮默认 / 链接 / 说明；600 用 `salt` |
| text-xs | 12px | 400–700 | 1.33 | 0 | footer 免责 / micro-copy / 700 做 NEW pill |

**补充（DESIGN.md 叙述层，多于 token）**：Card Title 21px/700、Caption Small 13px/400、Badge Uppercase 11px/600（走 `salt`）、Superscript 8px/700（唯一大写字距 +0.32px）。语义字号以上表中文 token 为准，细分时可从 DESIGN 取。⚠️

**原则**：
- **单一家族，多字重**——从不混排 display face
- **500 是新的 400**——正文基准字重 500；⚠️ DESIGN §7 说「别用 400」，但层级表里 Caption Small 13px / Micro Default 12px 用了 400——仅限这类**极小描述可破例 400**，正文一律 ≥500
- **负数字距只给 display（≥20px）**：-0.18 ~ -0.44px（token `-0.02em`），body 保持 0 字距
- **紧行高给题、松行高给正文**：display 1.18–1.25，body/caption 1.43
- **除 8px superscript 外不全大写**——其余用句子大小写 + 字重渐变
- **替代字体**（无 Cereal 授权）：Circular Std（商业）或 Inter（免费，display 尺寸 -0.01em）；macOS/iOS 上 `system-ui` 解析为 SF 亦可接受
- **OpenType**：`salt`（风格化交替）开在 11px / 14px / 600 紧凑标签上

## 四、组件样式（按钮 / 卡片 / 输入 / 导航 / 图片）

### 按钮
- **Primary CTA**（Reserve / Search / Add dates）：底 Rausch `#ff385c`，字 `#ffffff`（Cereal 500 / 16px），padding ~14px 纵 × 24px 横，圆角 8，无边框；按下 `transform: scale(0.92)` + `0 0 0 2px #222222` focus ring
- **Secondary**（Become a host / outlined tertiary）：底 `#ffffff`，字 Ink `#222222`（14–16px / 500），padding 10px 16px，圆角 20（pill）或 8（方），边框 `1px solid #dddddd`
- **Icon-Only 圆形**（back / share / favorite / carousel）：底 `#f2f2f2` 或白底 + 1px 半透黑边，icon `#222222` 描边 16–20px，尺径 32–44px，圆角 50%，按下 scale(0.92)，叠照片时外套 `0 0 0 4px rgb(255,255,255)` 白色分隔环
- **Disabled**：底 `#f2f2f2`，字 `#c1c1c1`（⚠️ 建议用 token `#929292`），opacity 0.5
- **Pill Tab**（Homes / Experiences / Services）：透明底，字 Ink `#222222`（500 / 16px），padding 8px 14px，激活态 2px Ink 下划线，上方叠 36–48px 3D 渲染图标

### 卡片 / 容器
- **Listing Card**：底 `#ffffff`，图片 4:3 full-bleed + 14px 圆角，正文直接在透明底上；**无阴影**（分隔靠留白 + 照片固有圆角）；元数据行间 4–8px 间隙；结构：城市(16px/600) → 距离时长(14px/500 Ash) → 日期 → 价格行「per night」
- **Detail Booking Panel**（右栏吸顶）：底 `#ffffff`，圆角 14–20，边框 1px `#dddddd`，三层堆叠阴影（elev-raised），padding 24px，宽 ~370px，吸顶 120px；内容：价格题 → 日期 → 客人数 → Rausch CTA → 12px 免责声明
- **Amenity Grid**：底 `#ffffff`，**行级** 1px `#dddddd`（不是逐项），每行 padding 16px 纵；24px 描边图标 + 16px/500 标签
- **Review Card**：底 `#ffffff`，**无边框**（靠 grid gap），40px 圆形头像 + 16px/600 名字 + 14px/400 Ash 日期一行，下接 14px/500 正文

### 输入 / 表单
- **Search Bar**：底 `#ffffff`，外框 `1px solid #dddddd` 包裹三段（Where / When / Who），三段间竖分隔；圆角 32（全 pill）；阴影 `rgba(0,0,0,0.04) 0 2px 6px 0`；每段 12px/500 标签 + 14px/500 placeholder；右缘 48px Rausch 圆形提交钮
- **Text Input**：底 `#ffffff`，边框 1px `#dddddd`，圆角 8，padding 14px 16px；focus 切换边框为 Ink + 加 `0 0 0 2px` 黑外环；error 边框转 `#c13515`（helper 同色）
- **Date Picker**：7 列网格，圆形 50% 日期格 40–44px 宽；选中区 Ink `#222222` 底 + 白数字；首尾锚更大实心圆，中段日期用 Soft Cloud `#f7f7f7`

### 导航
- **Top Nav（桌面）**：高 ~80px，底 `#ffffff`，左 wordmark+logo（Rausch 102×32），中三分 tab picker（3D 图标 + 16px/500 标签，激活 2px Ink 下划线），右 Become a host / 32px 圆形地球 / 36px 头像汉堡；底边框 1px `#dddddd`
- **Top Nav（移动）**：整宽搜索 pill；picker 图标缩到 ~28px；底部固定 tab bar（Explore 激活 Rausch / Wishlists / Log in，24px 图标 + 12px 标签）
- **Detail Secondary Nav**：吸顶横向锚链（Photos · Amenities · Reviews · Location · Host），高 56px，底边框 1px `#dddddd`

### 图片处理
- 主比例：4:3 列表格 / 16:9 体验 hero / 1:1 头像；圆角 14 列表 / 20 hero 框 / 50% 头像
- Detail 五图网格：左 1 大图(50%宽) + 右 2×2 小图，共享 20px 外圆角容器
- 懒加载 + 模糊占位；carousel 居中 32px 圆形箭头，圆点指示位底部上方 12px

### 标志性组件
- **Guest Favorite 桂冠锁标**：居中评分 44–56px/700，左右 SVG 桂冠 ~48px，下 12px/700 大写 `GUEST FAVORITE`（+0.32px）+ 14px/500 Ash 副标；整宽白画布无容器边框
- **Tri-Tab Picker**：三个 tab 各 3D 图标(~48px) + 16px/500 标签；Experiences / Services 图标右上角叠 12px/700 白字深蓝 `NEW` pill；激活 2px Ink 下划线
- **Inspiration 城市网格**：6 列（移动 2 列）；16px/600 城市名 + 14px/500 Ash 房源类型副标；纯文本无图；上方按类别 tab（激活下划线 + 字重 +）
- **Reserve 吸顶卡**：桌面 scroll 过 hero 后 fixed 120px；移动塌成底部全宽条（"From $X / night" + Rausch Reserve pill）；始终 价格→日期→人数→CTA→免责
- **Experience Host Card**：全宽圆角容器，顶部 3:2 封面，56px 宿主头像 50% 叠出封面底缘；下 16px/700 名 + 14px/500 Ash 资历 + 小 Rausch "Message host" pill

## 五、布局与留白

- **间距基元 8px**：token `--space-1 4 / -2 8 / -3 12 / -4 16 / -5 20 / -6 24 / -8 32 / -12 48`；⚠️ DESIGN 另提及 off-grid 值（2/3/5.5/6/10/11/15/18.5/22px）用于像素级图标对齐——**只内联用，不提升为共享 token**
- **区块纵距**：`--section-y-desktop 64 / -tablet 48 / -phone 32px`
- **容器**：`--container-max 1280px`（detail 页）；gutter `desktop 40 / tablet 24 / phone 16px`；首页 ultra-wide 网格可放到 1760–1920px
- **卡片内边距**：booking 24px / amenity 行 16px / listing 元数据 12px；卡片间 gutter 24 桌面 / 16 移动；堆叠文本行 4–8px
- **网格**：列表格 6 列 ≥1760 / 5 ≥1440 / 4 ≥1128 / 3 ≥800 / 2 ≥550 / 1 <550；detail 页 2 列非对称——主内容 ~58% / 吸顶 booking 面板 ~36% / gutter ~6%；footer 3 列
- **留白哲学**：**用留白做分组**——listing 卡片间 24px gutter 让每张照片读作独立对象，但卡内元数据 4–8px 让城市/日期/价格成一单位；「卡片与页面之间」的边界比卡内内容承担更多的分隔工作。密集但绝不拥挤。

### 圆角档位
| Radius | 值 | 用途 |
|:--|:--|:--|
| sm | 8px | 文字按钮 / 下拉 / 输入 / 小工具钮 |
| md | 14px | **主力**——列表卡照片 / 通用容器 / 徽章 |
| lg | 20px | pill 主按钮 / hero 图框 / booking 面板 |
| pill | 9999px | 所有圆形 icon 钮 / 头像 / 心愿单心形（签名几何） |
| ⚠️ 32px | （非 token） | 搜索栏 pill：DESIGN 叙述层 |
| ⚠️ 4px / 50% | （非 token） | 内联锚点 / tag chips；50% = 圆形等价 pill 的视觉状态 |

## 六、深度与层级（堆叠阴影，禁单层）

| Level | 处理 | 用途 |
|:--|:--|:--|
| Level 0 | 无阴影 | 列表卡 / 正文内容 / 纯文本节 |
| Level 1 | `rgba(0,0,0,0.08) 0 4px 12px` | 按下态 icon 按钮（back/share/favorite）轻抬升 |
| Level 2 | elev-raised 三层堆叠（2% / 4% / 10%） | booking 面板 / modal / dropdown——**签名抬升** |
| Focus | `0 0 0 2px #222222` | 激活按钮 / 聚焦搜索框（#Bind 6，Ink 非 accent） |
| White ring | `rgb(255,255,255) 0 0 0 4px` | 叠照片上的圆形按钮，4px 白色分隔环 |

**阴影哲学**：用**堆叠分层阴影**而非单层 drop——2% hairline ring + 4% 短模糊 + 10% 中模糊，读作一次连贯抬升，同时给边缘一层抗锯齿的高级感。**装饰性深度靠摄影**（full-bleed 照片）承担，UI 合成效果（渐变/glow/厚阴影）几乎不用。

## 七、动效（克制、快速、无叙事）

- **时长**：`--motion-fast 150ms` / `--motion-base 200ms`；**曲线**：`--ease-standard cubic-bezier(0.2, 0, 0, 1)`（减速出场、尾段顺滑、无过冲）
- **签名手势**：按钮按下 `transform: scale(0.92)`（物理按压回弹，150ms）
- **只做微交互**：hover / focus / 按压时过渡 `background-color`、`border-color`、轻微 `transform`/`opacity`
- **禁**：弹簧 / 弹性过冲、大幅位移、长叙事动画、大范围 fade 扫场、炫技 keyframes
- ⚠️ DESIGN.md 未捕获动效（静态抽取范围）；上述为 tokens.css 按品牌触觉手配的默认值，实际以组件压强为准

## 八、Airbnb 自己的「别这样做」

- **Do**：Rausch 只留给 primary action + 激活 tab 指示，别稀释；让照片呼吸（4:3 + 14–20px 圆角，无叠加文字、无渐变 scrim）；Ink Black `#222222` 承载一切 Rausch 以下文本层，绝不 `#000000`；3D 图标配平面排版（单表面内不混插图风格）；堆三层低透明度阴影（2/4/10%）作签名抬升；Hairline Gray `#dddddd` 1px 做所有 card-to-card / row-to-row 分隔；booking 面板桌面吸顶、移动塌成底部 reserve 条；元数据内 4–8px、卡间 24px——信息密度是刻意的
- **Don't**：别引入 Rausch / Plus Magenta / Luxe Purple 之外的二级 accent；别把文字叠进照片（caption 永远在图片下方）；别用 all-caps（除 8px superscript）；别把 icon 按钮圆到除 50% 以外；别给 listing 卡加阴影；别用渐变背景（唯一渐变是 wordmark 的窄 Rausch→magenta sweep）；别用 400 regular 当正文（body 是 500）；别用其它 display 面替换 Cereal VF（单家是有意的）

## 九、判断词

- ✅ 图片驱动 / 纯白画布 / 温暖珊瑚唯一彩色 / 大留白分组 / 圆形 50% 几何 / 三层堆叠阴影 / 单一 Cereal VF 族 / 单色调近黑文字 / 旅行杂志感
- ❌ 多强调色 / 暗色模式 / 渐变背景 / 文字叠图 / 重型单层阴影 / all-caps / 非圆形图标钮 / 400 regular 正文 / 混排字体 / 厚重卡片装饰

## 十、适用边界

**适用于**：旅行 / 住宿 / 体验电商平台、家居 / 生活方式 / 图片导向 toC 产品、内容画廊式页面、温暖留白型落地页、消费 marketplace、需要「信任 + 舒适感」的民宿 / 房源 / 预订类界面。

**不适用于**：暗色 SaaS 运营后台 / 开发者工具（那用 Linear——见 `reference-linear.md`）、冷灰科技感 B 端（那用 Apple——见 `reference-apple.md`）、需要「暗色 / 数据密集 / 精密工具感」的界面、多彩灵动 / 游戏感 / 渐变炫技的装饰性落地页。

---

### 备注：与 Linear（暗色参考）的对照锚点
- **Airbnb = 浅色 / 消费 / 图片主导 / 温暖留白**；**Linear = 暗色 / B 端工具 / 信息密度 / 白透明度梯级**。
- 相较 Apple（同为消费、同为浅色）：Apple 是**冷灰白银 + 微倾商业极简**（灰阶偏银冷、留白克制、蓝唯一彩色、近黑 `#1d1d1f`、无 off-grid 密度）；Airbnb 是**暖珊瑚 + 旅行杂志的温暖留白**（唯一珊瑚粉、哈欠大留白、off-grid 像素对齐、单一家族承压、三层堆叠阴影）。两者底色都是白底，**不要混用 accent**（Apple 蓝 vs Airbnb 珊瑚粉）——用哪套就整哪套的字符。
- Airbnb 没有原生暗色模式 —— 只描述单一明亮主题。
