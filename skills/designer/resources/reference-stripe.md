# L1 参考解剖 · Stripe（营销落地页金标准）

> 来源：open-design-source/design-systems/stripe/（DESIGN.md + design-tokens.json）
> 用途：任何**浅色 / 明亮营销落地页**项目的设计基准——官网首页、产品 / 定价 / 获客页、金融与信任型 SaaS、数据密度高但需高级感的商业界面。
> 状态：✅ 范例确认

---

## 一、核心原则（先记这5条）

1. **浅色画布 + 深藏青标题**：白底 `#ffffff` 页面，标题用深藏青 `#061b31`（**不是**纯黑 `#000000`）——暖一点、贵一点的金融级。
2. **签名紫 `#533afd` 是唯一交互色**：只用于 CTA / 链接 / 焦点环 / 选中态 / hover；ruby `#ea2261` 与 magenta `#f96bee` **只做装饰渐变，不上按钮和链接**。
3. **权重 300 极细标题是品牌签名**：标题一律 weight 300（56px→-1.4px、48px→-0.96px 渐进收紧负字距），用"轻"传达权威，反"加粗主打"。
4. **多图层蓝调阴影**：`rgba(50,50,93,0.25)`（蓝调远层）+ `rgba(0,0,0,0.1)`（中性近层）双层叠出视差纵深——阴影带品牌色相，从不落中性灰。
5. **保守圆角 + 全局 OpenType**：圆角锁死在 4px–8px（杜绝药丸/大圆角）；正文字体 sohne-var 全程开 `"ss01"`（替代字形即性格），数据数字开 `"tnum"` 等宽数字。

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| canvas / bg | `#ffffff` | 页面背景 / 卡片面（纯白） |
| surface-warm | `#f6f9fc` | 暖色次级面（中性 pill、细节面） |
| heading / fg | `#061b31` | 标题 / 导航文 / 强标签（深藏青，**不是纯黑**） |
| label / fg-2 | `#273951` | 表单标签 / 次级标题 |
| body / muted | `#64748d` | 正文 / 描述 / 说明文（石板灰） |
| primary / accent | `#533afd` | 唯一交互色：CTA / 链接 / 焦点 / 选中态 |
| accent-on | `#ffffff` | primary 上的文字 |
| primary-hover | `#4434d4` | primary 的 hover |
| primary-active | `#2e2b8c` | 图标 hover / 按下态 |
| purple-mid | `#665efd` | input 选择器区间 / 选区高亮 |
| border | `#e5edf5` | 卡片 / 分隔 / 容器标准边框 |
| border-purple | `#b9b9f9` | 活跃/选中边框、ghost 按钮边框、subdued hover 底 |
| border-dashed | `#362baa` | 紫色虚线：drop zone / 占位框 |
| success | `#15be53` | 状态徽章（背景用 0.2–0.4 alpha） |
| success-text | `#108c3d` | 徽章文字 |
| warn | `#9b6829` | 警告 / 高亮 |
| danger / ruby | `#ea2261` | 危险 / 装饰图标 / 渐变**仅装饰** |
| magenta | `#f96bee` | 渐变 / 装饰高亮**仅装饰** |
| magenta-light | `#ffd7ef` | magenta 主题卡 / 徽章底、虚线边框 |
| brand-dark | `#1c1e54` | 深色品牌区块 / 页脚背景 |
| dark-navy | `#0d253d` | 最深中性（近似黑带蓝调） |

**阴影色**：shadow-blue `rgba(50,50,93,0.25)`（签名·蓝调远层）/ shadow-black `rgba(0,0,0,0.1)`（中性近层）/ shadow-deep `rgba(3,3,39,0.25)`（modal·最深）/ shadow-ambient `rgba(23,23,23,0.08)`（环境微抬升）/ shadow-soft `rgba(23,23,23,0.06)`（极轻抬升）。所有阴影一律带蓝调，**从不落纯中性灰**。

## 三、排版（sohne-var，回退 SF Pro Display）

字体栈：`font-family: "sohne-var", "Söhne", "Sohne", "SF Pro Display", -apple-system, BlinkMacSystemFont, system-ui, "Helvetica Neue", Arial, sans-serif;`
mono：`"SourceCodePro", "Source Code Pro", ui-monospace, "SF Mono", "JetBrains Mono", Menlo, Monaco, Consolas, monospace;`
凡正文/标题开 `font-feature-settings: "ss01"`；数据与财务数字开 `"tnum"`。

| Token | 字号 | 字重 | 字距 | 行高 | 特性/用途 |
|:--|:--|:--|:--|:--|:--|
| display-hero | 56px | 300 | -1.4px | 1.03 | ss01 · 主 hero（极轻权威） |
| display-lg | 48px | 300 | -0.96px | 1.15 | ss01 · 副 hero |
| section | 32px | 300 | -0.64px | 1.10 | ss01 · 区块标题 |
| sub-heading-lg | 26px | 300 | -0.26px | 1.12 | ss01 · 卡片标题 |
| sub-heading | 22px | 300 | -0.22px | 1.10 | ss01 · 次级区块头 |
| body-lg | 18px | 300 | 0 | 1.40 | ss01 · 介绍文 |
| body | 16px | 300 | 0 | 1.40 | ss01 · 正文（UI 可 400） |
| button | 16px | 400 | 0 | 1.00 | ss01 · 按钮文字 |
| link | 14px | 400 | 0 | 1.00 | ss01 · 导航 / 链接 |
| caption | 13px | 400 | 0 | 1.00 | ss01 · 元数据 / 标签 |
| caption-tabular | 12px | 300–400 | -0.36px | 1.33 | **tnum** · 财务数字 |
| micro | 10px | 300 | +0.1px | 1.15 | ss01 · 微型标签 / 轴标 |
| code | SourceCodePro 12px | 500 | 0 | 2.00 | 代码块 |
| code-bold | SourceCodePro 12px | 700 | 0 | 2.00 | 代码关键词 / 标签（可大写） |

**数字**：表格 / 图表 / 财务数据用 `"tnum"` 等宽数字（caption-tabular 12px / micro-tabular 10px），与正文的 ss01 **永不混用**。

## 四、组件

### 卡片模式（浅色落地页卡片模板）
```css
.card {
  background: #ffffff;         /* 纯白画布 */
  border: 1px solid #e5edf5;   /* 标准边框，非 white-alpha */
  border-radius: 6px;          /* 4px 紧 / 5px 舒适 / 6px 标准 / 8px 重点 */
  padding: 24px;
  box-shadow:
    rgba(50,50,93,0.25) 0px 30px 45px -30px,  /* 远层·蓝调签名 */
    rgba(0,0,0,0.1)      0px 18px 36px -18px; /* 近层·中性（负 spread 不横向溢出） */
}
.card:hover { box-shadow: 加深蓝调层; }       /* hover 加阴影，无 translateY 位移 */
.card--dark { background: #1c1e54; border: 1px solid rgba(255,255,255,0.1); }
```

### 按钮
- **Primary**：`#533afd` 底 + `#ffffff` 字，圆角 4px，padding 8px 16px，16px/400 ss01；hover `#4434d4`。用：主 CTA（Start now / Contact sales）。
- **Ghost / Outlined**：透明底 + `#533afd` 字，圆角 4px，边框 `1px solid #b9b9f9`，8px 16px；hover 背景 `rgba(83,58,253,0.05)`。用：次级动作。
- **Transparent Info**：透明底 + `#2874ad` 字，边框 `1px solid rgba(43,145,223,0.2)`——三级信息动作。
- **Neutral Ghost（禁用）**：透明底 + `rgba(16,16,16,0.3)` 字，描边 `1px solid #d4dee9`。

### 徽章 / 标签
- **Neutral Pill**：`#ffffff` 底 + `#000000` 字，padding 0 6px，圆角 4px，边框 `1px solid #f6f9fc`，11px/400。
- **Success Badge**：`rgba(21,190,83,0.2)` 底 + `#108c3d` 字，padding 1px 6px，圆角 4px，边框 `1px solid rgba(21,190,83,0.4)`，10px/300。

### 输入框 / 表单
边框 `1px solid #e5edf5`，圆角 4px；focus 聚焦环 `#533afd`；标签 `#273951 / 14px`；正文 `#061b31`；占位符 `#64748d`。Focus ring：`0 0 0 2px var(--accent), 0 0 0 5px color-mix(in oklab, var(--accent), transparent 75%)`——双层紫环，不破坏布局。

### 导航
白色 sticky 头部 + `backdrop-filter: blur(12px)`；链接 sohne-var 14px/400 `#061b31` 开 `ss01`；导航容器圆角 6px；右侧紫色 CTA（Sign in / Start now）；移动端汉堡 6px 圆角。

### 装饰元素
- **虚线边框**：`1px dashed #362baa`（紫）drop zone / 占位；`1px dashed #ffd7ef`（magenta）装饰性边框。
- **渐变**：ruby→magenta（`#ea2261`→`#f96bee`）用于 hero 装饰；深色区块 `#1c1e54` 底 + 白字。

## 五、动效

| Token | 值 | 用途 |
|:--|:--|:--|
| motion-fast | 150ms | 微交互 / hover 过渡 |
| motion-base | 200ms | 常规过渡 |
| ease-standard | `cubic-bezier(0.2, 0, 0, 1)` | 默认缓动（快出缓停，克制） |

- **过渡只指向阴影**：hover / 抬升靠"加深蓝调阴影层"，**不做 translateY 位移、不做 glow 辉光**。
- **聚焦环双紫层**：2px 实心 `#533afd` + 5px 半透明紫（color-mix 75% 透明）——可访问性 ring，见上。
- **动效哲学**：转场快、出效果克制，同 Linear 一样反对炫技 / 大气动画——深度表达靠阴影，不靠运动。

## 六、布局与留白

- **间距基准 8px**；小端密集（每 2px 一级：4/6/8/10/12/14），体现金融数据的精密取向。
- **容器**：max-width 1080px；gutter 32px（桌面）/ 24px（平板）/ 16px（手机）。
- **区块纵向**：96px（桌面）/ 64px（平板）/ 40px（手机）。
- **圆角刻度**：1px 微 / 4px 标准 / 5px 舒适 / 6px 放松 / 8px 大 / 复合 `0 0 6px 6px`（底圆角容器）。
- **断点**：<640 单列；640–1024 双列；1024–1280 三列；>1280 居中加大距。
- **留白哲学**：精准留白（非极简真空）；"数据密集 + chrome 宽松"——表格/图表紧凑，外围界面舒适；白块与深色 `#1c1e54` 区块交替形成明暗节奏。

## 七、Stripe 自己的"别这样做"

- 别在标题用 600–700 粗体——weight 300 就是品牌声音
- 别用大圆角（12px+）或药丸形按钮 / 卡片——保守在 4px–8px
- 别用中性灰阴影——永远带蓝调 `rgba(50,50,93,...)`
- 别跳过任何 sohne-var 文本上的 `ss01`——替代字形定义性格
- 别用纯黑 `#000000` 当标题——永远是深藏青 `#061b31`
- 别用暖色（橙 / 黄）做交互元素——紫色是唯一交互色
- 别在大字号加正字距——标题走紧（负字距）
- 别把 ruby/magenta 用到按钮或链接——它们只做装饰 / 渐变
- 别把紫色 `#533afd` 铺满区块背景 / 卡片填充——只做交互点
- 别在 hover 用位移 / 辉光——深度靠阴影层表达

## 八、判断词

- ✅ 白净、精密、金融级、蓝调阴影、极细大标题、技术又奢华
- ❌ 彩色 glow、药丸按钮、纯黑标题、粗体 hero、暖橙交互、大圆角卡片、位移 hover

## 九、适用边界

**适用于**：浅色营销落地页、官网首页、产品 / 定价 / 获客页、金融与信任型 SaaS、数据密度高但需要高级感的商业界面。

**不适用于**：暗色运营后台 / 管理面板（那用 Linear 参考——见 `reference-linear.md`）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple/Airbnb）。
