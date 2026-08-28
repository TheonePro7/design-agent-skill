# L1 参考解剖 · Dashboard（浅色·冷调·数据可视化后台模板）

> 来源：open-design/design-systems/dashboard（DESIGN.md + design-tokens.json + tokens.css + components.html）
> 用途：任何**浅色数据看板 / 分析后台 / 指标墙 / 实时监控面板**的设计基准。
> 状态：⚠️ 有冲突（DESIGN.md = Professional & Corporate 声称「暗色 cloud-platform」，但落地 token 实为**浅色冷调**；颜色一律以 design-tokens.json / tokens.css 为准，与 DESIGN.md 冲突处已标 ⚠️）

---

## 一、核心原则（先记这 8 条）

1. **浅色冷调，不是暗色**：DESIGN.md 自称 dark（surface `#09090B`、text `#FAFAFA`），但落地全程是**浅色**——bg `#f4f7fb`（冷蓝灰）+ 纯白 surface `#ffffff` + 深蓝灰正文 `#111827`。以 token 为准做浅色，别做黑底。
2. **唯一强调色：天空蓝 sky**：`#0ea5e9` 是 accent / CTA 底 / meta 眉题 / 状态色 / hover 描边，全系统仅此一套彩色身份，其余全是带蓝调的冷灰阶。**无 Secondary 强调色**。
3. **冷灰阶分层（带蓝的灰，不是中性灰）**：`#111827`（主文，近黑蓝）→ `#334155`（次级/lead/标签）→ `#64748b`（muted/占位/metric 标签）→ 冷暖面各司其职。层级清晰，不靠字重堆。
4. **mono 大写眉题（eyebrow）是签名**：`color: var(--meta)` `#0ea5e9`，IBM Plex Mono `11px/700`，`letter-spacing: 0.12em`，uppercase。所有区块顶部的「小标签」都这样写——没有它就失去 Dashboard 的签名感。
5. **玻璃感面板（glass-like panel）**：panel 底 = `color-mix(in oklab, var(--surface), transparent 4%)` 半透明白 + `1px solid var(--border)` `#d8e2ee` + 大软阴影 `0 18px 46px rgba(15,23,42,0.10)`，`overflow: hidden`。
6. **状态优先（status-first）**：status 徽章 = mono 大写小字 + 8px 状态圆点（success 绿 `#10b981`）。关键数据用 `.status` 圆点 + metric 大数字传达，比文字更早被看见。
7. **8pt 网格 + 分数圆角**：spacing `4/8/12/16/20/24/32/48`；radius-sm `8px` / md `12px` / lg `18px` / pill `9999px`。对齐靠 8pt 基线，别用 ad-hoc 偏移。
8. **大标题走超重 + 负字距**：h1 用 `font-weight: 760`（非常规档），`56px`，`-0.015em`，`leading-tight 1.1`；数据 metric 用 `30px`（`text-2xl`）。字重骨架是 `400 正文 / 700 标题·按钮 / 760 大标`。

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#f4f7fb` | 页面 / canvas 背景（冷蓝灰，浅色） |
| surface | `#ffffff` | 卡片 / 工具栏 / 输入底（**纯白只做面**） |
| surface-warm | `#eef6ff` | 暖调 mini-card / 抬升面（浅蓝白） |
| fg | `#111827` | 主文本（深蓝灰，**勿用纯黑 `#000000`**） |
| fg-2 | `#334155` | 次级文本 / lead / 标签 |
| muted | `#64748b` | 三级文本 / 占位 / metric 标签 |
| meta | `#0ea5e9` | 眉题 / 状态色 / 链接强调 |
| border | `#d8e2ee` | 默认边框（卡片 / 面板 / 输入） |
| border-soft | `#edf3f8` | 微边框 / 分隔线 |
| accent | `#0ea5e9` | CTA 底 / 强调 / hover 描边（天空蓝）**仅此** |
| accent-on | `#04131d` | accent 上的文字（近黑蓝） |
| accent-hover | `color-mix(in oklab, var(--accent), black 8%)` ≈ `~#0d98d6` | accent 的 hover（向黑混合） |
| accent-active | `color-mix(in oklab, var(--accent), black 14%)` ≈ `~#0c8ec8` | accent 按下态（更暗） |
| success | `#10b981` | 成功状态圆点 / 指示**仅此** |
| warn | `#f59e0b` | 警告 |
| danger | `#ef4444` | 危险 / 删除 |

**冲突标注**：
- ⚠️ **暗色 vs 浅色**：DESIGN.md 写 Surface `#09090B` / Text `#FAFAFA`（暗色），token 实为 surface `#ffffff` / fg `#111827`（浅色）。以 token 为准。
- ⚠️ **强调色**：DESIGN.md 写 Primary `#0C5CAB` / Secondary `#0A4A8A`，token 无对应；真实 accent 为天空蓝 `#0ea5e9`，**无 Secondary token**（次要按钮用 surface 白底 + border 描边）。
- ✅ **状态三色命中**：DESIGN.md 的 Success/Warning/Danger `#10B981` `#F59E0B` `#EF4444` 与 token 完全一致。
- ⚠️ `accent-hover`/`accent-active` 为 `color-mix(in oklab, var(--accent), black 8%/14%)`，方向**向黑**（变深），无硬编码 hex。

**阴影**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow，secondary 按钮/卡片描边）；elev-raised `0 18px 46px rgba(15, 23, 42, 0.10)`（面板大软阴影，**distinctive**）；focus-ring `0 0 0 4px rgba(14, 165, 233, 0.22)`（天空蓝焦点光晕，无障碍签名）。

## 三、排版（Inter + IBM Plex Mono，meta 眉题签名）

字体栈：
- body/display：`--font-body` / `--font-display` = `Inter, system-ui, sans-serif`（两者同值）。
- mono：`--font-mono` = `"IBM Plex Mono", ui-monospace, Menlo, monospace`。

| Scale | 字号 | 字重 | 行高 | 用途 |
|:--|:--|:--|:--|:--|
| text-4xl | 56px | 760 | tight 1.1 | h1 大标题（`max-width: 820px`） |
| text-3xl | 42px | 700 | tight 1.1 | h2 区块标题 |
| text-2xl | 30px | display | tight 1.1 | metric 大数字 / 数值 |
| text-xl | 22px | 700 | tight 1.1 | h3 卡片 / 功能标题 |
| text-lg | 17px | 400 | body 1.48 | lead 导语（`max-width: 640px`, fg-2） |
| text-base | 15px | 400 | body 1.48 | 正文（body 默认） |
| text-sm | 13px | 700 | 1 | 按钮 / label / metric 标签 |
| text-xs | 11px | 700 | 1 | eyebrow / status 大写标签 |

标题统一 `letter-spacing: var(--tracking-display)` = `-0.015em`。字重骨架：正文 400、标题/按钮/label 700、h1 超重 760。

**冲突标注** ⚠️：DESIGN.md 声称 primary/display 用 IBM Plex Sans、scale `12/14/16/20/24/32`，但 token 落地为 **Inter（display/body）+ IBM Plex Mono（mono）**、scale `11/13/15/17/22/30/42/56`；且 DESIGN.md 列 100–900 全档可用，实际主要用 `400/700/760` 三档。

## 四、组件样式（按钮 / 面板 / 指标网格 / 卡片 / 状态徽章 / 表单 / 布局）

### 按钮（`.btn`）
```css
.btn { display:inline-flex; align-items:center; justify-content:center; min-height:44px; padding:0 var(--space-5); /* 20px */
  border:1px solid transparent; border-radius:var(--radius-md); /* 12px */
  font:700 var(--text-sm)/1 var(--font-body); cursor:pointer;
  transition: background-color, border-color, color, transform, box-shadow var(--motion-fast) var(--ease-standard); }
.btn:focus-visible { outline:none; box-shadow:var(--focus-ring); }
.btn-primary { background:var(--accent); color:var(--accent-on); }        /* #0ea5e9 / #04131d */
.btn-primary:hover { background:var(--accent-hover); transform:translateY(-1px); }
.btn-secondary { background:var(--surface); color:var(--fg); border-color:var(--border); box-shadow:var(--elev-ring); }
.btn-secondary:hover { border-color:var(--accent); color:var(--accent); }
```

### 面板 / 卡片（`.panel`）— 玻璃感
```css
.panel { background:color-mix(in oklab, var(--surface), transparent 4%); border:1px solid var(--border);
  border-radius:var(--radius-lg); box-shadow:var(--elev-raised); overflow:hidden; }
.panel-head { display:flex; justify-content:space-between; align-items:center; gap:16px; padding:20px;
  border-bottom:1px solid var(--border-soft); }
```

### 指标网格（`.metric-grid`）— dashboard 核心
- `.metric-grid`：`display:grid; grid-template-columns:repeat(3,1fr); border-bottom:1px solid var(--border-soft)`。
- `.metric`：`padding:20px; border-right:1px solid var(--border-soft)`；`:last-child` 去右边框。
- `.metric strong`：`display:block; font-family:var(--font-display); font-size:var(--text-2xl); line-height:var(--leading-tight)`（数值大标 30px/1.1）。
- `.metric span`：`color:var(--muted); font-size:var(--text-sm)`（13px 标签）。

### 卡片行 / 瓦片
- `.card-row`：`grid; grid-template-columns:1fr 1fr; gap:16px; padding:20px`。
- `.mini-card`：`min-height:148px; padding:20px; border:1px solid var(--border-soft); border-radius:var(--radius-md); background:var(--surface-warm)`（#eef6ff）；`p` 用 muted、13px、`margin-top:12px`。
- `.tile`：`padding:20px; border:1px solid var(--border); border-radius:var(--radius-md); background:var(--surface)`。

### 状态徽章（`.status`）— 签名
```css
.status { display:inline-flex; align-items:center; gap:var(--space-2); color:var(--meta);
  font:700 var(--text-xs)/1 var(--font-mono); text-transform:uppercase; letter-spacing:0.08em; }
.status::before { width:8px; height:8px; border-radius:var(--radius-pill); background:var(--success); content:""; }
```

### 表单（`.field` / `input`）
- `.field`：`display:grid; gap:var(--space-2); margin-top:20px`。
- `label`：`color:var(--fg-2); font-size:var(--text-sm); font-weight:700`。
- `input`：`width:100%; min-height:46px; padding:0 16px; border:1px solid var(--border); border-radius:var(--radius-sm); background:var(--surface); color:var(--fg); font:inherit`。
- `input:focus`：`outline:none; box-shadow:var(--focus-ring); border-color:var(--accent)`（天空蓝焦点光晕，**不用变色实心描边**）。

### 布局
- `.page`：`min-height:100vh; background:linear-gradient(135deg, #f4f7fb 0%, #eef6ff 100%)`（页面是浅色渐变，不是纯色）。
- `.container`：`max-width:1280px; margin-inline:auto; padding-inline:36px`（tablet 24px @<1024，phone 16px @<640）。
- `section`：`padding-block:84px`（tablet 60px，phone 42px）。
- `.hero`：`grid; grid-template-columns:minmax(0,1.1fr) minmax(320px,0.9fr); gap:32px; align-items:center`。
- `.eyebrow`：`color:var(--meta); font-family:var(--font-mono); font-size:var(--text-xs); font-weight:700; letter-spacing:0.12em; text-transform:uppercase`。
- `.stack > * + *`：`margin-top:16px`。

## 五、动效（克制、快速、无叙事）

- **时长**：fast `120ms`（`--motion-fast`）/ base `200ms`（`--motion-base`，声明但交互主用 fast）。
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑，无过冲）。
- **只做微交互**：hover / focus 时过渡 `background-color`、`border-color`、`color`、`box-shadow`、微位移（≤1px，如 btn hover `translateY(-1px)`）。
- **交互态要显式全态**：hover / focus-visible / active / disabled / loading 都要有明确样式。
- **禁**：弹跳 / 弹性 / 过冲（spring）、长叙事、大幅移动、大范围 fade 扫场、炫技 keyframes。

## 六、Dashboard 自己的「别这样做」

- 别按 DESIGN.md 做成暗色——本系统落地是**浅色**（bg `#f4f7fb`），别用黑底白字。
- 别用纯白 `#ffffff` 当页面背景——页面用 bg `#f4f7fb`（浅色渐变），`#ffffff` 只做 card/surface 底。
- 别用纯黑 `#000000` 当正文——主文是 `#111827`（深蓝灰）；也别信 DESIGN.md 的 text `#FAFAFA`。
- 别用 DESIGN.md 的深蓝 Primary `#0C5CAB`——真实强调色是天空蓝 `#0ea5e9`。
- 别引入第二彩色强调——仅天空蓝 accent 一套；状态三色（success/warn/danger）只用于指示元素。
- 别全站同字号/同字重——靠 `400/700/760` 三档 + 字号档位明确分层。
- 别跳过焦点态——输入/按钮必须有 focus-ring（`0 0 0 4px rgba(14,165,233,0.22)`），别只变色。
- 别用实心浓阴影做主深度——面板用大而软的 elev-raised，卡片/按钮用 border-as-shadow（elev-ring）或 focus-ring。
- 别把正文塞进 16/20 号——scale 是 `11/13/15/17/22/30/42/56`，正文 15px。
- 别把眉题当普通文本——eyebrow/status 必须 mono 大写 + 天空蓝，否则丢签名感。
- 别忽略「状态优先」——关键数据用 status 圆点 + metric 大数字（30px），文字层级让步。

## 七、判断词

- ✅ 浅色冷调、天空蓝强调、玻璃面板（半透明 + 大软阴影）、mono 大写眉题、状态圆点、metric 大数字、分数圆角（8/12/18）、8pt 网格、紧凑卡片、数据密集型、状态优先。
- ❌ 暗色黑底、深蓝 `#0C5CAB` 强调、多强调色、实心浓阴影、纯黑正文、全站同字重、暖黄/暖橙交互、磨砂炫技动效、纯色大色块无渐变。

## 八、适用边界

**适用于**：浅色数据看板、分析后台、指标墙 / 实时监控面板、B2B SaaS 运营看板、内部工具。冷调、状态优先、信息密度高、需要「一屏扫读」的产品。

**不适用于**：暗色 SaaS 运营后台（用 `reference-linear.md`）、浅色营销落地页（用 `reference-stripe.md` / `reference-vercel.md`）、浅色可定制组件基线（用 `reference-shadcn.md`）、消费级暖色品牌（Airbnb / Spotify）、需要厚重拟物层次的产品。

**交叉引用**：暗色后台 → `reference-linear.md`；浅色可定制基线 → `reference-shadcn.md`；超密集数据 / 交易面板 → `reference-trading-terminal.md`、`reference-posthog.md`；浅色 SaaS 营销 → `reference-stripe.md`。
