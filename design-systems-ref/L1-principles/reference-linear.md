# L1 参考解剖 · Linear（暗色 SaaS 运营后台金标准）

> 来源：open-design/design-systems/linear-app（DESIGN.md + design-tokens.json + components.html）
> 用途：任何**暗色 SaaS 运营后台 / 管理面板 / 开发者工具 / 数据密集型界面**的设计基准。
> 状态：✅ 范例确认（数据基于 open-design 实测 token，勿凭旧印象调整）

---

## 一、核心原则（先记这 8 条）

1. **暗色为原生媒介，不是「浅色套了层黑」**：页面背景 `#08090a`（近黑带一点冷蓝调），内容像星光一样从黑暗中浮现——**不要用纯黑 `#000000`**，也不要出浅色模式
2. **唯一彩色：薰衣草蓝紫**：品牌 indigo `#5e6ad2`（CTA 底 / 品牌标记）+ 交互紫 `#7170ff`（链接 / 激活态）+ hover `#828fff` + active `#4752c4`。全系统仅此一套彩色，其余全是灰阶
3. **平面表面梯级（亮度分层）**：深度**不靠阴影深浅**，靠背景白透明度逐级抬升 `rgba(255,255,255,0.02 → 0.04 → 0.05)`；越靠近层级越亮、越远越暗
4. **发丝白边框是默认**：边框用半透明白 `rgba(255,255,255,0.05)`（微）到 `rgba(255,255,255,0.08)`（标准），**不是**实心暗色；在暗底上让结构「隐而不噪」
5. **签名字重 510**：Inter Variable 的 510（介于 400 与 500 之间）是 Linear 的招牌强调值——加一点点力度但**不狂**；上限 590，**禁用 700**
6. **大号标题走紧字距**：Display 尺寸一律负字距（72px→-1.584px、48px→-1.056px、32px→-0.704px），24px 以下放松回 normal
7. **OpenType 即身份**：所有 Inter 文字开 `font-feature-settings: "cv01", "ss03"`——没有它就不是 Linear 的 Inter，是通用 Inter
8. **卡片/按钮底从不实心**：一律半透明白 `rgba(255,255,255,0.02~0.05)`，阴影只作焦点/悬浮辅助，靠「白透明度梯级 + 发丝边框」分深度

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#08090a` | 页面 / canvas 背景（近黑，**勿用 `#000000`**） |
| bg-deep | `#010102` | 最深 hero / 底层画布 |
| panel | `#0f1011` | 侧栏 / 面板背景（bg 上一级） |
| surface | `#191a1b` | 卡片 / 下拉 / 抬升面（Level 3） |
| surface-2 | `#28282c` | hover / 再抬升面（最亮的暗面） |
| ink | `#f7f8f8` | 主文本（**不是纯白 `#ffffff`**，偏暖防刺眼） |
| ink-2 | `#d0d6e0` | 次级文本 / 正文（冷银灰） |
| ink-muted | `#8a8f98` | 三级文本 / 占位 / 元数据 |
| ink-meta | `#62666d` | 最弱文本 / 时间戳 / 禁用态 |
| primary | `#5e6ad2` | CTA 底 / 品牌标记 / 关键交互面**仅此** |
| accent | `#7170ff` | 链接 / 激活 / 选中项（更亮紫） |
| accent-hover | `#828fff` | accent 元素的 hover |
| accent-active | `#4752c4` | accent 按下态 |
| accent-on | `#ffffff` | accent 上的文字 |
| success | `#27a644` | 进行中 / 成功状态**仅此** |
| emerald | `#10b981` | 完成态 pill / 徽章 |
| warn | `#eab308` | 警告（token 存在） |
| danger | `#dc2626` | 危险 / 删除 |
| border | `rgba(255,255,255,0.08)` | 默认边框（卡片 / 输入 / 代码块） |
| border-soft | `rgba(255,255,255,0.05)` | 微边框（默认最弱分隔） |
| hairline | `#23252a` | 实心暗边框（药丸 / chip / 命令面板），仅特定次级用途 |
| hairline-strong | `#34343a` | 更亮的实心暗边框 |
| line | `#141516` | 近乎不可见的分隔线 |
| line-2 | `#18191a` | 稍可见分隔线 |
| overlay | `rgba(0,0,0,0.85)` | 弹窗 / modal 蒙层（极暗作焦点隔离） |

**阴影色（辅助，非深度主体）**：elev-flat `none`；elev-ring `0 0 0 1px var(--border)`（border-as-shadow）；elev-raised `rgba(0,0,0,0.4) 0 2px 4px, 0 0 0 1px rgba(255,255,255,0.05)`；focus-ring `0 0 0 2px color-mix(in oklab, var(--accent), transparent 30%), 0 4px 12px rgba(0,0,0,0.1)`。

## 三、排版（Inter Variable + Berkeley Mono，OpenType cv01+ss03）

字体栈：`font-family: "Inter Variable", "Inter", "SF Pro Display", -apple-system, system-ui, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;`
Mono：`font-family: "Berkeley Mono", ui-monospace, "SF Mono", Menlo, Monaco, Consolas, monospace;`
**所有 Inter 文字** `font-feature-settings: "cv01", "ss03"`。三档字重：400 读书 / 510 强调扫码导航 / 590 宣告；300 仅限刻意弱化的正文。

| Token | 字号 | 字重 | 字距 | 行高 | 用途 |
|:--|:--|:--|:--|:--|:--|
| display-xl | 72px | 510 | -1.584px | 1.00 | 头部大标题 |
| display-lg | 64px | 510 | -1.408px | 1.00 | 副 hero |
| display | 48px | 510 | -1.056px | 1.00 | 区块标题 |
| heading-1 | 32px | 400 | -0.704px | 1.13 | 大标题 |
| heading-2 | 24px | 400 | -0.288px | 1.33 | 区块小标题 |
| heading-3 | 20px | 590 | -0.24px | 1.33 | 卡片 / 功能标题 |
| body-lg | 18px | 400 | -0.165px | 1.60 | 介绍文 |
| body | 16px | 400 | normal | 1.50 | 正文 |
| body-md | 16px | 510 | normal | 1.50 | 导航 / 标签 |
| body-semibold | 16px | 590 | normal | 1.50 | 强强调 |
| small | 15px | 400 | -0.165px | 1.60 | 次级正文 |
| small-semibold | 15px | 590 | -0.165px | 1.60 | 强小字 |
| caption | 13px | 400–510 | -0.13px | 1.50 | 元数据 / 时间戳 |
| label | 12px | 400–590 | normal | 1.40 | 按钮 / 小标签 |
| micro | 11px | 510 | normal | 1.40 | tiny 标签 |
| tiny | 10px | 400–510 | -0.15px | 1.50 | overline（可大写） |
| mono-body | Berkeley Mono 14px | 400 | normal | 1.50 | 代码块 |
| mono-label | Berkeley Mono 12px | 400 | normal | 1.40 | 代码元数据 |

**数字**：统计 / 数据用等宽字体（Berkeley Mono / ui-monospace），开 `tabular-nums` 等宽数字。

## 四、组件样式（按钮 / 卡片 / 表格 / 徽章 / 导航）

### 按钮
- **Ghost（默认）**：底 `rgba(255,255,255,0.02)`，字 `#e2e4e7`，圆角 6，边框 `1px solid rgb(36,40,44)`，焦点阴影 `rgba(0,0,0,0.1) 0 4px 12px`——标准操作 / 次级 CTA
- **Subtle**：底 `rgba(255,255,255,0.04)`，字 `#d0d6e0`，padding 0 6px，圆角 6——工具栏 / 情境按钮
- **Primary（品牌）**：底 `#5e6ad2`，字 `#ffffff`，padding 8px 16px，圆角 6，hover `#828fff`——主 CTA（Start building / Sign up）
- **Icon（圆形）**：底 `rgba(255,255,255,0.03~0.05)`，圆角 50%，边框 `1px solid rgba(255,255,255,0.08)`——关闭 / 菜单
- **Pill**：透明底 + `#d0d6e0` 字，padding 0 10px 0 5px，圆角 9999，边框 `1px solid #23252a`
- **Small Toolbar**：底 `rgba(255,255,255,0.05)`，字 `#62666d`，圆角 2，边框 `1px solid rgba(255,255,255,0.05)`，阴影 `rgba(0,0,0,0.03) 0 1.2px 0`，12px/510

### 卡片 / 容器
```css
.card {
  background: rgba(255,255,255,0.02);   /* 或 0.04 / 0.05 — 从不明色，永远半透明 */
  border: 1px solid rgba(255,255,255,0.08); /* 标准 white-alpha 边框 */
  border-radius: 8px;   /* 8 标准 / 12 featured / 22 大面板 */
  /* 无渐变、无 ::before 装饰 */
}
.card:hover { background: 提高一档白透明度; border-color: rgba(255,255,255,0.08); }
```

### 表格（源未显式给出，按系统规律推断——**Linear 式紧凑密集行**）
- 无斑马纹、无竖向分隔线，行间用发丝白线 `rgba(255,255,255,0.05)` 分隔
- 表头 12–13px / 510 / `#d0d6e0`（小写标签感）；单元格 14px / 400 / `#f7f8f8`（次级 `#d0d6e0`）
- hover 行背景 `rgba(255,255,255,0.02~0.04)`，不加 glow / translateY
- 状态 / 徽章用 tiny 10px/510；数字用等宽 + `tabular-nums`

### 徽章 / Pill
- **Success Pill**：底 `#10b981`，字 `#f7f8f8`，圆角 50%，10px/510（状态点 / 完成指示）
- **Neutral Pill**：透明 + `#d0d6e0`，padding 0 10px 0 5px，圆角 9999，边框 `1px solid #23252a`，12px/510（tags / chips）
- **Subtle Badge**：底 `rgba(255,255,255,0.05)`，字 `#f7f8f8`，圆角 2，边框 `1px solid rgba(255,255,255,0.05)`，10px/510（inline 标签 / 版本号）

### 输入 / 表单
- TextArea：底 `rgba(255,255,255,0.02)`，字 `#d0d6e0`，边框 `1px solid rgba(255,255,255,0.08)`，padding 12px 14px，圆角 6
- Search：透明底 + `#f7f8f8` 字，icon 感知 padding 1px 32px；focus 用 focus-ring（`0 0 0 2px color-mix(accent, transparent 30%)` + `0 4px 12px rgba(0,0,0,0.1)`），不用变色实心描边

### 导航
- 暗色 sticky header 于 `#0f1011`；链接 13–14px / 510 / `#d0d6e0`，hover / active 提亮到 `#f7f8f8`
- 底边框 `1px solid rgba(255,255,255,0.05)`；搜索 = 命令面板触发（`Cmd+K` / `/`）

## 五、动效（克制、快速、无叙事）

- **时长**：fast `150ms` / base `200ms`（`--motion-fast` / `--motion-base`）
- **曲线**：`cubic-bezier(0.2, 0, 0, 1)`（`--ease-standard`，减速出场、尾段顺滑，无过冲）
- **只做微交互**：hover / focus 时过渡 `background-color`、`border-color`、`opacity`、微位移（≤2px）
- **禁**：弹跳/弹性/过冲（spring）、大幅移动、长叙事动画、大范围 fade 扫场、炫技 keyframes
- 命令面板 / 弹层用 opacity + scale 微开（~0.98→1，150ms），不做 fly-in

## 六、Linear 自己的「别这样做」

- 别出浅色模式，「暗色即原生媒介」是身份
- 别用纯黑 `#000000` 当 canvas / 主文本——底色 `#08090a`、主文 `#f7f8f8`（偏暖防刺眼）
- 别用黑色 `#ffffff` 当主文本（会刺眼），以及句上一条——主文永远 `#f7f8f8`
- 别用实心暗色边框做主分隔——默认发丝白 `rgba(255,255,255,0.05~0.08)`，实心 `#23252a` 只给 chip / pill
- 别把阴影当深度主语言——靠白透明度梯级 + 发丝边框分层
- 别用 700 粗体——上限 590，签名是 510
- 别在大字号加正字距——Display 一律负字距，24px 以下才放松
- 别跳过 `"cv01", "ss03"`——没有它就不是 Linear 的 Inter
- 别引入第二个彩色强调色——仅 indigo 紫一套；状态色（成功率 / 警告 / 危险）只用于指示元素
- 别用渐变背景 / spotlight 卡片 / 彩色 glow / emoji 图标 / 药丸 CTA
- 别用暖橙 / 暖黄做交互——调色板是冷灰 + 蓝紫

## 七、判断词

- ✅ 极简、精密、暗色原生、信息密度靠白色透明度梯度管理、发丝边框、负字距大标、工程感
- ❌ 彩色 glow、渐变、药丸 / 大圆角 CTA、多强调色、纯黑背景、700 粗体、正字距大标、实心暗边框做主分隔、炫技动效

## 八、适用边界

**适用于**：暗色 SaaS 运营后台、管理面板、运营中台、开发者工具、数据密集型界面、issue 追踪 / 工作流类产品。

**不适用于**：浅色 / 明亮营销落地页（那用 Stripe 参考——见 `reference-stripe.md`）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple/Airbnb）、需要「轻快友好」的浅色产品界面。
