# L1 参考解剖 · Linear（运营后台最佳参考）

> 来源：popular-web-designs/templates/linear.app.md + visual-design-rules/references/linear-design-system.md
> 用途：任何**暗色 SaaS 运营后台 / 管理面板**项目的设计基准。
> 状态：✅ 范例确认

---

## 一、核心原则（先记这5条）

1. **单一强调色**：薰衣草蓝紫 `#5e6ad2`，只用于 CTA / 焦点环 / 品牌标记
2. **平面表面梯级**：canvas → surface-1 → surface-2 → surface-3 → surface-4（用亮度而非阴影分层）
3. **发丝边框**：`#23252a` 实心暗色，**不是** white-alpha 半透明
4. **零阴影**：深度靠 surface 抬升 + 发丝边框，**禁止** box-shadow
5. **零渐变**：无渐变背景、无 spotlight 卡片、无大气特效

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| canvas | `#010102` | 页面背景（近纯黑，**不要用 #000000**） |
| surface-1 | `#0f1011` | 默认卡片 |
| surface-2 | `#141516` | 高亮卡 / hover |
| surface-3 | `#18191a` | 子导航 / 下拉 |
| surface-4 | `#191a1b` | 最深抬升面 |
| hairline | `#23252a` | 1px 卡片边框 |
| hairline-strong | `#34343a` | 强调边框 / 焦点环 |
| ink | `#f7f8f8` | 主文本 |
| ink-muted | `#d0d6e0` | 次级文本 |
| ink-subtle | `#8a8f98` | 三级文本 |
| ink-tertiary | `#62666d` | 禁用 / 脚注 |
| primary | `#5e6ad2` | CTA / 焦点 / 品牌标记**仅此** |
| primary-hover | `#828fff` | hover 的 CTA |
| success | `#27a644` | 状态徽章**仅此** |
| overlay | `#000000` | 弹窗蒙层 |

## 三、排版（Inter 回退）

| Token | 字号 | 字重 | 字距 | 用途 |
|:--|:--|:--|:--|:--|
| headline | 28px | 600 | -0.6px | 区块标题 |
| card-title | 22px | 500 | -0.4px | 卡片标题 |
| body | 16px | 400 | -0.05px | 默认 |
| body-sm | 14px | 400 | 0 | 卡片正文 |
| caption | 12px | 400 | 0 | 元数据 / 标签 |
| button | 14px | 500 | 0 | 按钮文字 |

**数字**：统计数字用等宽字体（JetBrains Mono/Cascadia Mono），`tabular-nums`。

## 四、卡片模式（所有运营后台卡片的模板）

```css
.card {
  background: #0f1011;        /* surface-1 — 平面，无渐变 */
  border: 1px solid #23252a;  /* hairline — 实心，非 white-alpha */
  border-radius: 12px;         /* rounded.lg */
  padding: 20px;
  /* 无 box-shadow，无 ::before/::after 装饰 */
}
.card:hover {
  border-color: #34343a;      /* hairline-strong */
  /* 无 translateY，无 glow */
}
```

## 五、按钮

- **Primary**：`#5e6ad2`，圆角 8px（rounded.md），padding 8px 14px，文字 14px 500
- **Secondary**：`surface-1` + `ink` + `hairline` 边框
- **Tertiary**：`canvas` + `ink`

## 六、Linear 自己的"别这样做"

- 别出浅色模式
- 别用薰衣草色做区块背景 / 卡片填充
- 别引入第二个彩色强调色（营销区禁橙/绿/粉）
- 别加大气渐变 / spotlight 卡片
- 别做药丸圆角 CTA
- 别用 `#000000` 纯黑当 canvas
- 别组合多个亮色强调

## 七、判断词

- ✅ 极简、精密、暗色原生、信息密度靠白色透明度梯度管理
- ❌ 彩色 glow、渐变、药丸按钮、多强调色、纯黑背景

## 八、适用边界

**适用于**：暗色 SaaS 后台、管理面板、运营中台、开发者工具、数据密集型界面。
**不适用于**：营销落地页（那用 Stripe/Vercel 参考——见参考#2）、暖色品牌、浅色产品。
