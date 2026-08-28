# L1 参考解剖 · Duolingo（游戏化 / 教育暖色金标准）

> 来源：open-design/design-systems/duolingo（DESIGN.md + design-tokens.json + tokens.css）
> 用途：任何**游戏化教育 / 语言学习 / 打卡成就 / 消费级轻快友好 / 需要「鼓励与正反馈」**的界面设计基准。
> 状态：✅ 范例确认（颜色以 design-tokens.json 为准；与 DESIGN.md 不一致处已标 ⚠️）
> 一句话身份：**明亮的绿猫头鹰、厚底拟物、圆润友好、大而自信的游戏化快乐** —— 与 Linear（暗色克制）完全相反。

---

## 一、核心原则（先记这 8 条）

1. **明亮为原生媒介，漆黑是它反面**：页面 canvas 纯白 `#ffffff`（Snow），**永不上暖色调染色**，只给 chrome 上色——光学清晰是地基。**不要出暗色模式**
2. **品牌即绿色，绿即品牌**：Owl Green `#58cc02` 是主 CTA / 正确反馈 / 进度填充 / 品牌 chrome 的同一件事，占据 30%+ 表面。**没有第二套主彩色**
3. **厚底阴影「能按下去」**：每个可交互元素底部 `4px` **实心、无模糊**的偏移阴影（`--elev-raised` `0 4px 0 #d7d7d7`），读作「3D 按钮等你去按」。`:active` 时 `translateY(4px)` + 阴影归零 = 物理按压
4. **实心粗边框，永不用发丝线**：一律 **2–3px 实心** `#e5e5e5`（Swan），hover 提亮到 `#afafaf`（Hare）。发丝细线会破坏「果冻圆润」的签名
5. **800 才是正文级字重**：Feather Bold 在标题与按钮上跑 800；**700 在这个系统里显得弱**（仅 H3 一档例外，见 ⚠️）。Duolingo 从不小声
6. **大而自信的字体**：Display 起点 56px，比典型产品品牌**大 25–40%**；字号 = 身份，别做小而怯的正文
7. **圆润即语言，最小 12px**：输入/按钮 12px，卡片/课程瓦片 16px，featured 20px，chips/进度条/头像 9999px；**没有锐直角**。字形转角圆润，方正衬线打破友好契约
8. **吉祥物即角色（不是 logo）**：猫头鹰 Duo 出现在 onboarding / 错误 / streak，是「活跃插画角色」——会在进度里程碑跳跃、眨眼。与静态 logo 不同

---

## 二、颜色令牌（以 design-tokens.json 为准，可直接照抄）

### Surface（表面，三个真实层级 + 两个别名）
| Token | 值 | 用途 |
|:--|:--|:--|
| bg | `#ffffff` | Snow — 页面 canvas（**永不上色**，纯白） |
| surface | `#f7f7f7` | Eel — 区块分隔 / 次级面 / 课程行 |
| surface-warm | `var(--surface)` | 别名——调色板无第三档暖色面 |
| border | `#e5e5e5` | Swan — 标准 2px 边框 / 卡片边 |
| border-soft | `var(--border)` | 别名——只有一档边框（无内行分隔） |

### Foreground（三档文本，child-readable 对比）
| Token | 值 | 用途 |
|:--|:--|:--|
| fg | `#3c3c3c` | Eel Black — 主文本 / 标题 / 按钮标签 |
| fg-2 | `var(--fg)` | 别名——全系统单一主文重 |
| muted | `#777777` | Wolf — 次级文本 / 说明 / 分隔 |
| meta | `#afafaf` | Hare — 三级元数据 / 占位符 / 禁用 |

### Accent（品牌绿，仅此一套彩色）
| Token | 值 | 用途 |
|:--|:--|:--|
| accent | `#58cc02` | Owl Green — 品牌主色 / 主 CTA / 正确反馈 |
| accent-on | `#ffffff` | 绿上的文字 |
| accent-hover | `#89e219` | Owl Green Light — hover / 柔和填充 |
| accent-active | `#58a700` | Owl Green Deep — 按下态 / 厚底阴影色 |

### Semantic（成功就是绿）
| Token | 值 | 用途 |
|:--|:--|:--|
| success | `#58cc02` |（= accent）「答对」即品牌 |
| warn | `#ffc800` | Bee Yellow — Pro 徽章 / 成就发光 |
| danger | `#ff4b4b` | Cardinal Red — 答错 / 失去生命 |

### ⚠️ 仅存在于 DESIGN.md、未入 token 的颜色（用到即表意）
- **Streak Orange** `#ff9600` ⚠️ — streak 计数 / 火苗图标 / 高级能量；**Streak Orange Deep** `#cc7a00` ⚠️ 为按下色
- **Gem Pink** `#ce82ff` ⚠️ — 宝石货币 / Super Duolingo
- **Eel Blue** `#1cb0f6` ⚠️ — 提示按钮 / 信息链接；其 20% 透明版本用作 focus ring（`--focus-ring`）
- **Owl Green Pale** `#dbf8c5` ⚠️ — 柔和表面 / success banner
- ⚠️ **success banner 背景冲突**：DESIGN.md 用 `#dbf8c5`（Pale），而 token `--success` = `#58cc02`（=accent）。以 token 为准，绿即成功；Pale 仅作浅底时自行取用

### 阴影 / 焦点（辅助，非深度主体）
elev-flat `none`；elev-ring `0 0 0 2px var(--border)`（2px 环对齐粗边框）；elev-raised `0 4px 0 #d7d7d7`（**实心硬边「按压」签名**）；focus-ring `0 0 0 3px rgba(28, 176, 246, 0.2)`（Eel Blue 20% 晕圈，对绿色品牌形成俏皮反差）。

---

## 三、排版（Feather Bold 圆润 display + Mona Sans 正文，默认 800）

字体栈：`--font-display: "Feather Bold", "DIN Round Pro", "Helvetica Neue", sans-serif`（⚠️ Feather Bold 为 Duolingo 专有、非公开 webfont，实际渲染常落到 DIN Round Pro / Helvetica）
正文：`--font-body: "Mona Sans", "Helvetica Neue", system-ui, sans-serif`
等宽（学校 / 管理后台稀有）：`--font-mono: "JetBrains Mono", ui-monospace, Menlo, Monaco, Consolas, monospace`

### Token 字号阶梯（以 design-tokens.json 为准）
| Token | 字号 | 用途 |
|:--|:--|:--|
| text-xs | 12px | tiny 工具 / 进度数字 |
| text-sm | 13px | Caption — XP 计数 / 元数据 |
| text-base | 15px | Body — 标准正文 |
| text-lg | 18px | H3 / 课程行标题 / featured body |
| text-xl | 24px | H2 — 区块标题 |
| text-2xl | 32px | H1 — 页标题 |
| text-3xl | 40px | Sub-display — hero 次级 / 营销 eyebrow |
| text-4xl | 56px | Display — onboarding hero，从不怯场 |

行高：`--leading-body` 1.5；`--leading-tight` 1.15（标题）；`--tracking-display` -0.01em（≈56px 时 -0.56px，自信而不挤压）。

### DESIGN.md 语义映射（含冲突）
| Role | Font | 字号 | 字重 | 行高 | 字距 | 备注 |
|:--|:--|:--|:--|:--|:--|:--|
| Display | Feather Bold | 56px | 800 | 1.05 | -0.01em | Onboarding hero |
| H1 | Feather Bold | 32px | 800 | 1.15 | -0.005em | 页标题 |
| H2 | Feather Bold | 24px | 800 | 1.2 | normal | 区块标题 |
| H3 | Feather Bold | 18px | **700** ⚠️ | 1.25 | normal | 卡片标题 / 课程行 —— ⚠️ 全系统唯一 700；DESIGN.md 自述「700 显弱、800 是默认」但此处偏 700（次级层级） |
| Body Large | Mona Sans | **17px** ⚠️ | 500 | 1.5 | normal | 课程提示 / 说明 —— ⚠️ 17 未入 token 档（15↔18 之间） |
| Body | Mona Sans | 15px | 400 | 1.5 | normal | 标准正文 |
| Caption | Mona Sans | 13px | 600 | 1.4 | 0.01em | XP 计数 / 元数据 |
| Button | Feather Bold | **16px** ⚠️ | 800 | 1.2 | 0.02em | 按钮标签 —— ⚠️ 16 未入 token 档 |
| Streak | Feather Bold | **14px** ⚠️ | 800 | 1.2 | normal | streak 数字（火苗上）—— ⚠️ 14 未入 token 档 |

**排版铁律**：整系统只用 400 / 500 / 600 / 700 / 800 五档（800 为标题按钮默认）；数字 X / 元数据等宽可用 JetBrains Mono；正文从不小于 15px。

---

## 四、组件样式（按钮 / 卡片 / 进度 / 输入）

### 按钮（全部带 4px 实心底阴影做「按压」）
- **Primary（Owl Green）**：底 `#58cc02`，字 `#ffffff`，padding `14px 24px`，圆角 16px，border-bottom `4px solid #58a700`；hover 底 `#89e219`；active `translateY(4px)` + border-bottom 0（「按下去」）。用于 Continue / Check / 主 CTA
- **Secondary（白 + 底阴影）**：底 `#ffffff`，字 `#777777`，边框 `2px solid #e5e5e5`，border-bottom `4px solid #e5e5e5`，圆角 16px，padding `14px 24px`；hover 字 `#3c3c3c` + 边框 `#afafaf`
- **Streak Orange** ⚠️：底 `#ff9600`，字 `#ffffff`，border-bottom `4px solid #cc7a00`——streak 目标 / 「Start streak」
- **Error（Cardinal Red）**：底 `#ff4b4b`，字 `#ffffff`，border-bottom `4px solid #cc3b3b`（⚠️ `#cc3b3b` 未入 token）——答错反馈

### 卡片 / 课程瓦片
```css
.card {
  background: #ffffff;
  border: 2px solid #e5e5e5;
  border-bottom: 4px solid #e5e5e5;   /* 厚底 = 卡片也「按得下去」 */
  border-radius: 16px;
  padding: 16px;
}
.card:hover { transform: translateY(2px); box-shadow: 0 4px 0 #d7d7d7; }
```

### 技能树节点（课程气泡）
80×72px；背景 = skill-color 浅染（绿色=进行中，灰=锁定）；border-bottom `6px solid` 更暗变体；圆角 50%（圆形）；active 每 1.6s 脉冲 1.0 → 1.05。

### 输入 / 表单
底 `#ffffff`，边框 `2px solid #e5e5e5`，圆角 12px，padding `12px 16px`；focus 边框 `#1cb0f6` ⚠️ + 焦点环 `0 0 0 3px rgba(28, 176, 246, 0.2)`（= `--focus-ring`，Eel Blue 20% 晕圈）。

### 进度条
轨道 `#e5e5e5`；填充 `#58cc02`（streak 时 `#ff9600` ⚠️）；圆角 9999px；高 16px；增量动画 320ms ease-out。

---

## 五、间距与布局

- **基准单位 4px**。Token 阶梯：4 / 8 / 12 / 16 / **20** / 24 / 32 / 48（`--space-1..12`）。⚠️ DESIGN.md 声明序列含 64，token 封顶 48，且多了 20（`--space-5`）；以 token 为准
- **容器最大宽 1080px**，gutter 桌面 24 / 平板 20 / 手机 16（`--container-max` / `--container-gutter-*`）。比 SaaS 面板窄，因 Duolingo 内容竖向读作聚焦的课程树
- **区块纵向节奏**：桌面 80px / 平板 56px / 手机 40px（`--section-y-*`）
- **课程树列宽 320px**，桌面居中

---

## 六、动效（游戏化，但克制地庆祝）

- **时长**：fast `180ms`（= `--motion-fast`，按钮按压）/ base `320ms`（= `--motion-base`，技能节点解锁 / 进度增量）
- **曲线**：`cubic-bezier(0.34, 1.56, 0.64, 1)`（= `--ease-standard`，**back-out 带轻微过冲**）——游戏化的「弹一下」快乐
- **节流打法**：活跃节点脉冲 1.6s；吉祥物 Duo 每 4–6s 眨眼、streak 里程碑跳跃（480ms ease-out spring ⚠️ 未入 token）——只在进度 / 解锁 / 里程碑处弹跳，**不在每个控件上做通用弹跳**
- 按钮按压用 `transform: translateY(4px)`（配厚底阴影），是纯位移微交互

---

## 七、Duolingo 自己的「别这样做」

- 别出暗色模式——**明亮白底 `#ffffff` 是身份**；它和 Linear / Stripe 是完全相反的哲学
- 别用发丝细边框——一律 **2–3px 实心** `#e5e5e5` / hover `#afafaf`；发丝线毁了「果冻圆润」
- 别把厚度当柔和 blur 投影——底阴影是 **4px 实心硬边** `0 4px 0 #d7d7d7`，深度来自「物理按压」而非模糊
- 别做「扁平绿按钮」而无底阴影——那就不像 Duolingo（flat 绿键 alone 不是这个系统）
- 别用锐直角 / 高对比角——圆角最小 12px，卡片 16px，chip / 进度 9999px
- 别用 700 做主强调——默认 **800**；700 仅 H3 一档（且 DESIGN.md 自述「700 显弱」）
- 别用通用 Inter / SF 当显示字——显示用圆润转角的 Feather Bold / DIN Round Pro；方正衬线打破友好契约
- 别引入第二个主彩色——主彩色只有绿一套；橙 / 粉 / 蓝 / 红 / 黄只作指示 / 状态元素
- 别用小而怯的正文——正文 15px 起，Display 56px，整体比典型品牌大 25–40%
- 别在每个控件上弹跳——弹跳只在进度 / 解锁 / 里程碑；其余交互克制

---

## 八、判断词

- ✅ 明亮、绿、圆润、厚底拟物按压、大而自信、吉祥物、多色编码、游戏化快乐、正反馈氛围
- ❌ 暗色、发丝细化、扁平无阴影、锐角、700 主体、小字号、冷灰、克制极简、工程感、渐变模糊投影

---

## 九、适用边界

**适用于**：游戏化教育产品、语言学习、打卡 / 成就 / 进度系统、消费级轻快友好 app、课程 / 练习流、需要「鼓励与正反馈」的儿童 / 泛用户界面。

**判词**：如果目标是「让用户愿意学、愿意坚持、愿意被夸奖」，Duolingo 是金标准。

**不适用于**：暗色 SaaS 运营后台 / 管理面板（用 Linear——见 `reference-linear.md`）、专业冷静 B2B、数据密集型面板、严肃金融 / 医疗、需要冷灰克制审美、以及任何「暗色原生」「极简工程感」的定位。
