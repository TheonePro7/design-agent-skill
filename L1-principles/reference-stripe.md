# L1 参考解剖 · Stripe（营销落地页金标准）

> 来源：popular-web-designs/templates/stripe.md
> 用途：任何**浅色 / 明亮营销落地页项目**的设计基准——官网、产品页、获客页、定价页、金融信任型 SaaS。
> 状态：✅ 范例确认

---

## 一、核心原则（先记这5条）

1. **浅色画布 + 深藏青标题**：白底 `#ffffff` 页面，标题用深藏青 `#061b31`（**不是**纯黑 `#000000`）——暖一点、贵一点的金融级
2. **签名紫 `#533afd` 是唯一交互色**：只用于 CTA / 链接 / 焦点环 / 选中态；ruby/magenta 仅作装饰渐变，**不用于按钮和链接**
3. **权重 300 极细标题是品牌签名**：标题一律 weight 300（56px→-1.4px、48px→-0.96px 渐进负字距），用"轻"传达权威，**反对加粗主打**
4. **多图层蓝调阴影**：`rgba(50,50,93,0.25)`（蓝调远层）+ `rgba(0,0,0,0.1)`（中性近层）双层——深度带品牌色相
5. **保守圆角 4px–8px + 全局 OpenType `ss01`**：杜绝药丸形 / 大圆角；字体 sohne-var，所有文字开 `"ss01"`，数字用 `"tnum"`

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| canvas | `#ffffff` | 页面背景 / 卡片面（纯白） |
| heading | `#061b31` | 标题 / 导航文 / 强标签（深藏青，**不是纯黑**） |
| primary | `#533afd` | CTA / 链接 / 焦点 / 选中态**仅此** |
| primary-hover | `#4434d4` | primary 的 hover |
| label | `#273951` | 表单标签 / 次级标题 |
| body | `#64748d` | 正文 / 描述 / 说明文（石板灰） |
| border | `#e5edf5` | 卡片 / 分隔 / 容器标准边框 |
| border-purple | `#b9b9f9` | 活跃/选中边框，ghost 按钮边框 |
| brand-dark | `#1c1e54` | 深色品牌区块 / 页脚背景 |
| dark-navy | `#0d253d` | 最深中性（近似黑带蓝调） |
| success | `#15be53` | 状态徽章（背景用 0.2–0.4 alpha） |
| ruby | `#ea2261` | 装饰图标 / 渐变**仅装饰** |
| magenta | `#f96bee` | 渐变 / 装饰高亮**仅装饰** |

**阴影色**：shadow-blue `rgba(50,50,93,0.25)`（签名）/ shadow-black `rgba(0,0,0,0.1)`（近层）/ shadow-deep `rgba(3,3,39,0.25)`（深层）/ shadow-ambient `rgba(23,23,23,0.08)`（微微抬升）。

## 三、排版（sohne-var，回退 Source Sans 3）

字体栈：`font-family: 'Source Sans 3', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;`（mono 用 `Source Code Pro` / `SourceCodePro`）。凡正文标题开 `font-feature-settings: "ss01"`，数据数字开 `"tnum"`。

| Token | 字号 | 字重 | 字距 | 行高 | 用途 |
|:--|:--|:--|:--|:--|:--|
| display-hero | 56px | 300 | -1.4px | 1.03 | 主 hero |
| display-lg | 48px | 300 | -0.96px | 1.15 | 副 hero |
| section | 32px | 300 | -0.64px | 1.10 | 区块标题 |
| sub-heading-lg | 26px | 300 | -0.26px | 1.12 | 卡片标题 |
| sub-heading | 22px | 300 | -0.22px | 1.10 | 次级区块头 |
| body-lg | 18px | 300 | 0 | 1.40 | 介绍文 |
| body | 16px | 300–400 | 0 | 1.40 | 正文 |
| button | 16px | 400 | 0 | 1.00 | 按钮文字 |
| link | 14px | 400 | 0 | 1.00 | 导航 / 链接 |
| caption | 13px | 400 | 0 | 1.00 | 元数据 / 标签 |
| code | SourceCodePro 12px | 500/700 | 0 | 2.00 | 代码块 |

**数字**：表格 / 图表 / 财务数字用 `"tnum"` 等宽数字（caption-tabular 12px、micro-tabular 10px）。

## 四、卡片模式（浅色落地页卡片模板）

```css
.card {
  background: #ffffff;         /* 纯白画布 */
  border: 1px solid #e5edf5;   /* 标准边框，非 white-alpha */
  border-radius: 6px;          /* 4px 紧 / 6px 标准 / 8px 重点 */
  padding: 24px;
  box-shadow:
    rgba(50,50,93,0.25) 0px 30px 45px -30px,  /* 远层·蓝调签名 */
    rgba(0,0,0,0.1)      0px 18px 36px -18px; /* 近层·中性 */
}
.card:hover { box-shadow: 加深蓝调层; }       /* hover 阴影加强，no translateY */
.card--dark { border: 1px solid rgba(255,255,255,0.1); background: #1c1e54; }
```

## 五、按钮

- **Primary**：`#533afd` 底 + `#ffffff` 字，圆角 4px，padding 8px 16px，16px/400；hover `#4434d4`
- **Ghost / Outlined**：透明底 + `#533afd` 字，圆角 4px，边框 `1px solid #b9b9f9`，8px 16px；hover 背景 `rgba(83,58,253,0.05)`
- **Transparent Info**：透明底 + `#2874ad` 字，边框 `1px solid rgba(43,145,223,0.2)`——三级信息动作
- **Neutral Ghost（禁用）**：透明底 + `rgba(16,16,16,0.3)` 字，描边 `1px solid #d4dee9`

**输入框**：边框 `1px solid #e5edf5`，圆角 4px，focus 聚焦环 `#533afd`，标签 `#273951 / 14px`，正文 `#061b31`，占位符 `#64748d`。

## 六、Stripe 自己的"别这样做"

- 别在标题用 600–700 粗体——weight 300 就是品牌声音
- 别用大圆角（12px+）或药丸形按钮 / 卡片——Stripe 保守在 4px–8px
- 别用中性灰阴影——永远带蓝调 `rgba(50,50,93,...)`
- 别跳过任何 sohne-var 文本上的 `ss01`——替代字形定义性格
- 别用纯黑 `#000000` 当标题——永远是深藏青 `#061b31`
- 别用暖色（橙 / 黄）做交互元素——紫色是唯一交互色
- 别在大字号加正字距——Stripe 标题走紧（负字距）
- 别把 ruby/magenta 用在按钮或链接——它们只做装饰 / 渐变
- 别把紫色 `#533afd` 铺满区块背景 / 卡片填充——只做交互点

## 七、判断词

- ✅ 白净、精密、金融级、蓝调阴影、极细大标题、技术又奢华
- ❌ 彩色 glow、药丸按钮、纯黑标题、粗体 hero、暖橙交互、大圆角卡片

## 八、适用边界

**适用于**：浅色营销落地页、官网首页、产品 / 定价 / 获客页、金融与信任型 SaaS、数据密度高但需要高级感的商业界面。

**不适用于**：暗色运营后台 / 管理面板（那用 Linear 参考——见 `reference-linear.md`）、暖色人文品牌（那用 Claude）、消费级电商（那用 Apple/Airbnb）。
