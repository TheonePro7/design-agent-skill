# L1 参考库 · 设计系统分桶索引（open-design 版）

> 152 个真实设计系统按场景分类。**20 个已蒸馏**（✅ reference-*.md 随包带），**132 个备选**（🔗 源在 open-design/design-systems/<name>，需要时再煮）。
> 用途：做任何项目先查此索引 → 确认项目场景 → 加载对应桶 ✅ 已蒸馏文件。**备选**用 `git clone open-design` 后从源 DESIGN.md + design-tokens.json 取。

---

## A. 暗色运营后台 / 管理面板（数据密集）

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Linear** | 极简暗色、单紫强调、透明梯级、发丝边、负字距 | ✅ `reference-linear.md` |
| **Supabase** | 暗色开发者、翡翠绿 accent、黑 pill CTA | ✅ `reference-supabase.md` |
| **Trading-Terminal** | 交易终端、海军黑蓝底、涨绿跌红 | ✅ `reference-trading-terminal.md` |
| **Dashboard** | 浅色冷调仪表盘、天空蓝、mono 眉题 | ✅ `reference-dashboard.md` |
| Raycast | 暗色启动器、红+蓝双色、物理阴影 | ✅ `reference-raycast.md` |
| Sentry / PostHog · 备选 | PostHog 已蒸馏（浅色橄榄） | 🔗 |

## B. 营销落地页 / 官网（浅色商业）

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Stripe** | 白底、深藏青标题、签名紫、蓝调多层阴影 | ✅ `reference-stripe.md` |
| **Vercel** | 纯白、近黑、阴影即边框、极端负字距 | ✅ `reference-vercel.md` |
| **Bento** | 浅色模块化网格、单一品牌蓝、留白>边框 | ✅ `reference-bento.md` |
| Mintlify / Framer / Webflow · 备选 | 文档/建站 | 🔗 |

## C. 生产力 / 协作 SaaS

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Notion** | 暖中性、超细边框、克制阴影、单蓝 accent | ✅ `reference-notion.md` |
| **Intercom** | 暖奶油底、Fin 橙 accent、4px 几何、物理缩放 | ✅ `reference-intercom.md` |
| Airtable / Figma / Miro / Superhuman · 备选 | 表格/设计/白板/邮件 | 🔗 |

## D. 数据分析 / 图表 / 数据库

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **ClickHouse** | 纯黑画布、Neon Volt 唯一彩色、900 hero | ✅ `reference-clickhouse.md` |
| **PostHog** | 温奶油浅色、橄榄绿、手绘感、IBM Plex | ✅ `reference-posthog.md` |
| Grafana / MongoDB · 备选 | 监控/数据 | 🔗 |

## E. 现代组件库 / 开发者

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **shadcn** | 现代组件库、中性、可定制、Geist | ✅ `reference-shadcn.md` |
| **GitHub** | 白原生、实心边框、实心语义色 | ✅ `reference-github.md` |
| Cursor / OpenCode / Ollama · 备选 | AI 编辑器/本地 | 🔗 |

## F. 消费科技 / 电商 / 生活方式

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Apple** | 大留白、克制冷艳、灰白银、字重 600 | ✅ `reference-apple.md` |
| **Airbnb** | 图片导向、温暖留白、Rausch 红、圆形几何 | ✅ `reference-airbnb.md` |
| Nike / Tesla / Uber / Shopify · 备选 | 消费/出行/电商 | 🔗 |

## G. 媒体 / 娱乐 / 沉浸

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Spotify** | 黑底三级、绿 accent、药丸、重阴影 | ✅ `reference-spotify.md` |
| Discord / Twitch(无) / Netflix(无) · 备选 | 社区/直播 | 🔗 |

## H. 游戏化 / 教育 / 暖色趣味

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Duolingo** | 白底、主绿、实心硬边阴影、800 字重、back-out 弹性 | ✅ `reference-duolingo.md` |
| Kahoot(无) / Grammarly(无) · 备选 | — | 🔗 |

## I. 暖色人文 / AI 内容

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Claude** | 羊皮纸暖色、serif 标题、陶土、环阴影 | ✅ `reference-claude.md` |
| Cohere / Warm-Editorial · 备选 | AI/暖色叙事 | 🔗 |

## J. 极简 / 通用

| 设计系统 | 风格 | 状态 |
|:--|:--|:--|
| **Minimal** | hairline 浅色抬升、恒负字距、8 级间距 | ✅ `reference-minimal.md` |
| Default / Modern / Clean / Simple · 备选 | 通用 | 🔗 |

---

## 使用流程（做项目前必做）

1. **判断场景** → 上面 A~J 哪桶
2. **加载已蒸馏** → 读对应 ✅ `reference-<name>.md`
3. **需要更细/备选风格** → `git clone https://github.com/nexu-io/open-design.git` 后读 `design-systems/<name>/DESIGN.md` + `design-tokens.json`（数据以 token 为准）
4. **确认风格** → `browser_vision` 截真实参考站对比
5. **蒸馏落地** → 按项目 DESIGN.md 写自己的 token/组件

## ⚠️ 数据铁律

- **颜色以 `design-tokens.json` 为准**（source-backed），DESIGN.md 文学描述与 token 冲突时**采信 token**（多处已标注 ⚠️）
- posthog/dashboard 实测为**浅色**（非深色），选参考时注意
- claude 是 serif + **正字距**（与 Linear 负字距相反），勿混用
