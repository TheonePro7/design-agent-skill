# L1 参考解剖 · shadcn（浅色 / 中性 / 可定制组件库基线）

> 来源：open-design/design-systems/shadcn（DESIGN.md + design-tokens.json + tokens.css + components.html）
> 用途：任何**浅色 / 中性 / 文档与内容为主 / 要干净可定制**的现代 Web UI、营销落地页、组件库脚手架的默认基线。
> 状态：✅ 范例确认（颜色以 design-tokens.json / tokens.css 实测为准；与 DESIGN.md 冲突处标 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **浅色是原生媒介，纯白画布**：`--bg` 与 `--surface` 都是 `#ffffff`。shadcn **拒绝在不同区块间做背景色差**——深度不靠表面色调（不暖化/冷化），靠**真 1px 边框 + 发丝阴影**。白就是白。
2. **唯一彩色的 accent 是黑色**：`--accent = #000000`，既是主 CTA 底也是焦点色。现实里"黑 CTA 白底"就是 shadcn 的 accent 瞬间。因为**纯黑无法再变暗**，hover / active 向**白色**混（10% / 18%）——镜像 Tailwind 的 `bg-primary hover:bg-primary/90`，悬停**提亮**而非按 schema 默认往黑压。
3. **正文是 slate-900，不是纯黑**：`--fg = #111827`（Tailwind slate-900），带一点冷调防刺眼。**纯黑留给 accent CTA**；正文与 CTA 的语义在一色之间分离。
4. **真实 1px 边框，不用 shadow-as-border**：shadcn 用真 `border: 1px solid`（`--border = #e5e7eb` / slate-200）。品牌腔调是"**你画的是什么就看得到什么**"，不是 Vercel 那种把边框藏进 box-shadow 的做法。shadcn 从不把输入边藏进阴影。
5. **8px 是默认圆角**：`--radius-md = 8px`（`0.5rem`），sm = 6px（`calc(--radius - 2px)`），lg = 12px（`calc(--radius + 4px)`），pill = `9999px`。全尺度 6/8/12/9999 非常克制——**shadcn 拒绝超大 pill 卡片**。
6. **字距克制地 whisper**：`--tracking-display = -0.02em`。shadcn"低语、不吼"；品牌嗓系统（Vercel）那种 `-0.05em` 激进压缩会盖过让 shadcn 可辨认的"平静基线"。
7. **分层靠发丝阴影**：`--elev-raised` 是**两层发丝**（1px + 3px ambient），镜像 Tailwind `shadow-sm`；卡片"whisper lift"，**不是模糊**。无内发光、无大气 wash——functional surface，不是戏剧。
8. **无障碍是不可协商项**：签名 `--focus-ring = 0 0 0 2px var(--bg), 0 0 0 4px var(--accent)`——2px 画布色光环（offset）+ 2px accent 环，即 Tailwind `ring-2 ring-offset-2`，用分层 box-shadow 表达。DESIGN.md §6 明确要求"强 focus-visible 态"，这是规则不是建议。AA 对比 + 语义状态色（green/amber/red）只做状态指示。

> 附：**"可定制"是核心卖点**——复制的组件 + Radix 原语 + Tailwind 工具类 + `:root` design tokens。占位 token（`--surface-warm` / `--fg-2` / `--meta` / `--border-soft`）都 alias 到主 token，**供第三方主题（如 Stone/Warm preset）独立重绑**；`tailwind-v4.css` 再把每个 token 映射成 `@theme` 变量供全量工具类生成。它是"build your own"的白纸，不是个性招牌。

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| `--bg` | `#ffffff` | 页面 / canvas 背景（纯白） |
| `--surface` | `#ffffff` | 卡片 / 面板（与 bg 同；深度靠边框 + 阴影）⚠️ DESIGN §2 Surface |
| `--surface-warm` | `var(--surface)` | ⚠️ 占位 alias——shadcn 无第三暖层，第三方主题独立重绑 |
| `--fg` | `#111827` | 主正文（slate-900，**非纯黑**）DESIGN §2 Text |
| `--fg-2` | `var(--fg)` | ⚠️ 占位 alias——无第二正文层 |
| `--muted` | `#64748b` | 次级 / 说明 / 占位（slate-500） |
| `--meta` | `var(--muted)` | ⚠️ 占位 alias——无元数据专属层 |
| `--border` | `#e5e7eb` | 卡片边 / 输入边 / 分隔线（slate-200） |
| `--border-soft` | `var(--border)` | ⚠️ 占位 alias——无软/硬档之分 |
| `--accent` | `#000000` | CTA 底 / 焦点 / 链接（纯黑）DESIGN §2 Primary |
| `--accent-on` | `#ffffff` | accent 上的白字 |
| `--accent-hover` | `color-mix(accent, white 10%)` ≈ `#1a1a1a` | 悬停——**向白提亮，不加深** |
| `--accent-active` | `color-mix(accent, white 18%)` ≈ `#2e2e2e` | 按下——明确的 pressed delta |
| `--success` | `#16a34a` | 成功状态（green-600；DESIGN 写作 `#16A34A` 同值） |
| `--warn` | `#d97706` | 警告（amber-600，非 schema 默认黄）DESIGN §2 Warning |
| `--danger` | `#dc2626` | 危险 / 删除（red-600）DESIGN §2 Danger |

**⚠️ 冲突与说明**
- DESIGN §2 有 **`Secondary: #111111`**，但 design-tokens.json **无 `--secondary` token**——二次前景通过 `--border` + `--muted` 实现，正文梯度不靠第二个前景色。
- DESIGN §2 **`Neutral: #ffffff`** 仅是 `--surface` 的派生别名，**非独立 token**。
- DESIGN §3 字阶封顶 **32px**（12/14/16/20/24/32）；tokens.css **延展到 40/48**（`--text-3xl/4xl`）供 marketing hero，属文档外的扩展。
- DESIGN §3 字重声明 **100–900 全谱**；实际落点只有 **400 / 500 / 600** 且**无字重 token**（层次靠字号 + 间距，非字重爆量）。

**阴影 / 焦点（辅助）**：`--elev-flat: none`；`--elev-ring: 0 0 0 1px var(--border)`（border-as-shadow 仅用于不适合真边框需位移处）；`--elev-raised: 0 1px 2px 0 color-mix(fg, transparent 92%), 0 1px 3px 0 color-mix(fg, transparent 88%)`；`--focus-ring: 0 0 0 2px var(--bg), 0 0 0 4px var(--accent)`。

## 三、排版（Geist Sans + Fira Code）

字体栈：`font-family: "Geist", "Geist Sans", -apple-system, system-ui, "Segoe UI", Arial, sans-serif;`（display 与 body 同栈）
Mono：`font-family: "Fira Code", ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Monaco, Consolas, monospace;`
正文 `--leading-body: 1.5`；标题 `--leading-tight: 1.2`；display 字距 `-0.02em`（h3/h4 额外 `-0.01em`）。层级靠字号 + 字重 + 字距，**颜色不参与层阶**（标题全落 `--fg`）。

| Token | 字号 | 字重 | 行高 | 用途 |
|:--|:--|:--|:--|:--|
| `--text-xs` | 12px | 500 | — | caption / 元数据 / badge |
| `--text-sm` | 14px | 500（按钮） | 1.43 | 按钮 / 输入 / 次级正文 |
| `--text-base` | 16px | 400 | 1.5 | 正文基线 |
| `--text-lg` | 20px | 600 | 1.6 | lede / featured 段 |
| `--text-xl` | 24px | 600 | — | 卡片标题 / H3 |
| `--text-2xl` | 32px | 600 | — | 区块标题 / H2 |
| `--text-3xl` | 40px | 600 | — | H1（marketing hero）⚠️ 超出 DESIGN 文档 |
| `--text-4xl` | 48px | 600 | — | display hero（仅营销页）⚠️ 超出 DESIGN 文档 |

**眼眉 / eyebrow 签名**：`font-family: var(--font-mono); font-size: var(--text-xs); font-weight: 500; line-height: 1; color: var(--muted); text-transform: uppercase; letter-spacing: 0.08em;`——小号大写的 mono 区段路标（shadcn docs 导航 / 原始索引的 "section signpost" 样式）。

**正文变体**：`.body-muted` → `--muted`；`.body-sm` → `--text-sm`；`.body-meta` → `--muted` + `--text-sm`。`lede` → `--text-lg` / 1.6 / `--muted`。

## 四、组件样式（按钮 / 卡片 / 输入 / 徽章 / 链接 / 代码块 / 布局）

### 按钮（btn 基线：padding 8px 16px，gap 8px，radius 6px，14px/500，line-height 1.43，transition bg/border/color/box-shadow 150ms）
- **Primary（黑 CTA）**：底 `--accent`(#000)，字 `--accent-on`(#fff)，边框同 accent；**hover 底变 `--accent-hover`(≈#1a1a1a) 提亮**，active 变 `--accent-active`(≈#2e2e2e)——黑底白字，hover 抬一格不加深
- **Secondary / Outline**：底 `--surface`(#fff)，字 `--fg`，边框 `--border`(#e5e7eb)；hover 底 `color-mix(bg, fg 4%)`（极淡灰 wash）
- **Ghost**：透明底，字 `--fg`，内边距 12px；hover 底 `color-mix(bg, fg 6%)`
- **focus-visible**：`outline: none` + `box-shadow: var(--focus-ring)`（2px 白 offset 光环 + 2px 黑 ring）

### 卡片（Card：border 承载边缘，shadow 只给一丢丢 lift）
```css
.card {
  background: var(--surface);      /* 纯白 */
  border: 1px solid var(--border); /* 真 1px 实边框 —— 不用 shadow-as-border */
  border-radius: var(--radius-md); /* 8px 默认 */
  padding: var(--space-6);         /* 24px */
  gap: var(--space-3);             /* 12px */
  box-shadow: var(--elev-raised);  /* 1px+3px 发丝，非模糊 */
}
.card:hover { border-color: color-mix(fg, transparent 75%); box-shadow: 略深一档; }
```

### 输入（field：flex col，gap 8px）
- label：14px/500 `--fg`；input：padding 8px 12px，`1px var(--border)`，radius 6px，底 `--surface`，字 `--fg`，14px/1.43
- placeholder：`--muted`；hover：`border-color: color-mix(fg, transparent 70%)`；**focus-visible：边框转 `--accent` + `box-shadow: var(--focus-ring)`**（边框收进内环）
- help 文本：12px `--muted`

### 徽章（inline-flex，gap 4px，padding 2px 10px，border 透明，radius `--radius-pill`(9999)，12px/500）
- **default（黑实心）**：底 `--accent`，字 `--accent-on`
- **secondary（灰）**：底 `color-mix(bg, fg 5%)`，字 `--fg`
- **outline**：透明底，字 `--fg`，边框 `--border`
- **success**：字 `--success`(green)，底 `color-mix(success, white 88%)`（淡绿）
- **dot**：6px 圆点，`currentColor`

### 链接（可访问性优先，正文内不引入彩色）
- 字 `--fg`，`text-decoration: underline`，`text-underline-offset: 3px`，`text-decoration-thickness: 1px`；hover：厚度提为 2px；focus-visible：radius 2px + `var(--focus-ring)`

### 代码块 / Kbd / Install block（shadcn 最可辨认的表面）
- kbd：mono，12px，padding 2px 6px，`1px var(--border)`，radius 6px，底 `--surface`，字 `--fg`，`box-shadow: 0 1px 0 var(--border)`
- install-block（`$ npx shadcn add ...` CLI 面板）：mono 14px/1.5，底 `--surface`，`1px var(--border)`，radius 8px，padding 16px 20px，`--elev-raised`；prompt `$` 用 `--muted`；copy 按钮：透明底 + `1px var(--border)` + radius 6px + 12px/500 `--muted`，hover 字提亮 `--fg`

### 布局 / 网格 / 圆角 / 间距
- container：`max-width: var(--container-max)`(1280px / `max-w-7xl`)，`margin-inline: auto`，`padding-inline: var(--container-gutter-desktop)`(24px)；断点 1023px→16px，639px→16px（phone **永不 edge-bleed**）
- section：`padding-block: var(--section-y-*)`（desktop 96 / tablet 64 / phone 48）；`section + section` → `border-top: 1px var(--border)`
- stack 工具类：`stack-2/3/4/6` = `margin-block-start` 8/12/16/24px
- 圆角：sm 6 / md 8 / lg 12 / pill 9999；间距：4/8/12/16/20/24/32/48（schema 为补足 8 档加了 20、48）

## 五、动效（克制、快速、无叙事）

- **时长**：`--motion-fast: 150ms` / `--motion-base: 200ms`（DESIGN §7 范围 150–250ms）
- **曲线**：`--ease-standard: cubic-bezier(0.2, 0, 0, 1)`（减速出场、尾段顺滑、无过冲）
- **只过渡** `background-color`、`border-color`、`color`、`box-shadow`——**不拿 transform 当主动画**
- **禁**：长叙事进场、编排式 choreographed entrance、大幅位移、炫技 keyframes、弹性/过冲（spring）
- 交互态（hover / focus-visible / active / disabled / loading）必须全部显式

## 六、shadcn 自己的「别这样做」

- 别在不同区块间做背景色差——`--bg` 与 `--surface` 都是纯白，深度靠**真 1px 边框 + 发丝阴影**，不是靠表面色调（不暖化 / 不冷化）
- 别用 `#000000` 当正文——正文永远 `--fg`(#111827 / slate-900)，**纯黑只给 accent CTA**
- 别用 shadow-as-border（Vercel 式）——shadcn 用**真 1px 实边框**，要"画了什么就看得到什么"
- 别引入 palette 外的颜色——**有 token 就用 token**，不硬塞色值；语义色（green/amber/red）只做状态 badge / 校验，**总量 <5% 像素**，不做填充 chrome
- 别用超大 pill / 夸张圆角卡片——圆角尺度 6/8/12/9999，`radius-md` 8px 是默认；**拒绝 oversized pill cards**
- 别用激进负字距 `-0.05em`——`--tracking-display` 只有 `-0.02em`，shadcn whisper
- 别用多层模糊阴影 / 大气光 / 内发光——`--elev-raised` 是 1px+3px 发丝，card 只"whisper lift"
- 别靠颜色做文字层级——层级靠字号 + 字重 + 间距；标题全落 `--fg`，accent 只给 CTA
- 别让一个彩色强调色到处用——仅黑 accent 一套（中性单色）；语义色仅作状态指示
- 别跳过无障碍——`--focus-ring`（2px bg 光环 offset + 2px accent ring）是必须，AA 对比必备
- 别绕过 token 直接写 CSS 值——所有值走 `var(--*)`；`tailwind-v4.css` 已把 token 映射成 `@theme` 工具类

## 七、判断词

- ✅ 浅色、干净、单色、中性、可定制、可访问、Geist Sans、黑 CTA、真 1px 边框、8px 圆角、发丝阴影、`-0.02em` 字距、工程 / 文档感、"build your own" 的白纸感
- ❌ 变色背景分层、多彩强调色、渐变、彩色 glow、大圆角 pill 卡片、`-0.05em` 负字距、重型模糊阴影、用颜色分文字层级、无 focus ring、纯黑正文、shadow-as-border、把语义色当装饰 chrome

## 八、适用边界

**适用于**：浅色 SaaS 产品、营销落地页、文档 / 知识库官网、组件库脚手架、任何"以内容 / 文档为主、要干净中性可定制"的现代 Web UI。这是**最通用的浅色基线**——需要"从白纸开始搭一套可换皮肤组件"时用 shadcn。

**不适用于**：暗色运营后台 / 管理面板 / 数据密集型界面（那用 Linear——见 `reference-linear.md`）、需要大胆强视觉个性的消费级品牌页（那用 Vercel / Stripe——见 `reference-vercel.md` / `reference-stripe.md`）、暖色人文品牌（那用 Claude）、追求"look how lifted this is"的重叠厚重卡片层。它是画布，不是招牌。
