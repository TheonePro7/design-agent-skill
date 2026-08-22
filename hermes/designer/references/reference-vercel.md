# L1 参考解剖 · Vercel（极简开发者工具 / 纯白落地页最佳参考）

> 来源：popular-web-designs/templates/vercel.md
> 用途：任何**浅色极简 SaaS / 开发者工具落地页 / 大标题概念页**项目的设计基准。
> 状态：✅ 范例确认

---

## 一、核心原则（先记这5条）

1. **阴影即边框**：所有边框用 `box-shadow: 0 0 0 1px rgba(0,0,0,0.08)`，**不用** CSS `border`——阴影住在 shadow 层，圆角不会被裁剪、视觉更轻
2. **单色平台**：纯白 `#ffffff` 画布 + 近黑 `#171717` 文本，通体无色相；彩色只在**工作流语义上下文**里出现（Develop→Preview→Ship）
3. **三字重体系**：400（读）/ 500（交互）/ 600（标题），**禁止 700**；层级靠字号 + 字距，不靠字重
4. **极负字距**：display 级 `-2.4px` 起，随字号递减——文字像被压缩的代码
5. **分层阴影堆栈**：卡片 = 边框层 + 软抬升层 + 环境深度层 + 内发光层，多值堆在同一声明里，深度**全靠阴影分层**而非背景色差

## 二、颜色令牌（可直接照抄）

| Token | 值 | 用途 |
|:--|:--|:--|
| canvas | `#ffffff` | 页面背景（纯白） |
| ink | `#171717` | 主文本 / 标题 / 深色按钮（**不要用 #000000**，微暖是特性） |
| ink-secondary | `#4d4d4d` | 次级描述文本 |
| ink-tertiary | `#666666` | 三级文本 / 弱化链接 |
| ink-placeholder | `#808080` | 占位 / 禁用 |
| border-ring | `#ebebeb` | 浅灰 ring-边框（tab / 图片 / 次级按钮） |
| surface-tint | `#fafafa` | 微色差表面 / 卡片内圈高光 |
| primary-dark | `#171717` | 主 CTA 背景（近黑） |
| link | `#0072f5` | 链接（带下划线） |
| focus | `hsla(212,100%,48%,1)` | 键盘焦点环（唯二彩色之一，可达性用） |
| badge-bg | `#ebf5ff` | 药丸徽章背景（蓝 tint） |
| badge-text | `#0068d6` | 药丸徽章文字 |
| dev-blue | `#0a72ef` | 工作流语义色 · Develop（**仅此场景**） |
| preview-pink | `#de1d8d` | 工作流语义色 · Preview（**仅此场景**） |
| ship-red | `#ff5b4f` | 工作流语义色 · Ship（**仅此场景**） |

**工作流语义色规则**：红/粉/蓝只在标识 Develop→Preview→Ship 三个阶段时出现，绝不用于 UI chrome 装饰。

## 三、排版（Geist，回退 system-ui）

| Token | 字号 | 字重 | 字距 | 行高 | 用途 |
|:--|:--|:--|:--|:--|:--|
| hero | 48px | 600 | **-2.4px 至 -2.88px** | 1.00–1.17 | 大标题（最大压缩） |
| section-title | 40px | 600 | -2.4px | 1.20 | 区块标题 |
| sub-heading | 32px | 600 | -1.28px | 1.25 | 卡片 / 子区标题 |
| card-title | 24px | 600 | -0.96px | 1.33 | 特性卡片标题 |
| body-large | 20px | 400 | normal | 1.80 | 导语 / 特性描述 |
| body | 18px | 400 | normal | 1.56 | 标准正文 |
| body-sm | 16px | 400/500 | normal | 1.50 | 默认 UI 文本 |
| button | 14px | 500 | normal | 1.43 | 按钮 / 链接 / 字幕 |
| caption | 12px | 400–500 | normal | 1.33 | 元数据 / 标签 |
| mono | Geist Mono 16px | 400 | normal | 1.50 | 代码块 |
| mono-label | Geist Mono 13px | 500 | normal | 1.54 | 技术标签（`uppercase`） |

**字体栈**（CSS）：`font-family: 'Geist', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;`
**等宽栈**：`font-family: 'Geist Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;`
加载：`<link href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600&family=Geist+Mono:wght@400;500&display=swap" rel="stylesheet">`

**字距缩放规律**：48px→-2.4px，32px→-1.28px，24px→-0.96px，16px→-0.32px，14px→normal。**字距恒为负或零，绝不为正。** 全局开 `"liga"` 连字。

## 四、卡片模式（所有极简卡的模板）

```css
.card {
  background: #ffffff;                /* canvas — 平面，无渐变 */
  border-radius: 8px;                  /* 特性/图片卡用 12px */
  padding: 20px;
  /* 无 CSS border！用阴影堆栈 */
  box-shadow:
    rgba(0,0,0,0.08) 0px 0px 0px 1px,  /* ① 边框层 */
    rgba(0,0,0,0.04) 0px 2px 2px,      /* ② 软抬升 */
    rgba(0,0,0,0.04) 0px 8px 8px -8px, /* ③ 环境深度 */
    #fafafa 0px 0px 0px 1px;           /* ④ 内环高光——不可省，是系统的"发光" */
}
```
**图片卡**：顶部圆角 `12px 12px 0 0`，`1px solid #ebebeb` 边框，四周统一环。

## 五、按钮

- **Primary CTA**：bg `#171717`，text `#ffffff`，padding `8px 16px`，radius `6px`（近黑实心，唯一主 CTA）
- **Secondary**：bg `#ffffff`，text `#171717`，padding `0px 6px`，radius `6px`，阴影 `rgb(235,235,235) 0 0 0 1px`，hover→背景转深
- **药丸徽章**：bg `#ebf5ff`，text `#0068d6`，padding `0px 10px`，radius `9999px`，12px w500
- **焦点环**：所有可交互元素 `outline: 2px solid hsla(212,100%,48%,1)` + `ring` 阴影

## 六、Vercel 自己的"别这样做"

- 别用正字距（Geist 恒负或零）——越大越紧，越小越松
- 别用 700 字重做正文——600 是上限，仅标题
- 别用传统 CSS `border` 做卡片——一律 shadow-border
- 别把语义色（Ship 红 / Preview 粉 / Develop 蓝）当装饰用
- 别用重阴影（opacity > 0.1）——阴影是耳语级
- 别增大正文字距——Geist 设计就是紧的
- 别用 9999px 药丸做 CTA——药丸只给徽章/标签
- 别省略卡片阴影里的内环 `#fafafa`——它是整套系统发光的核心
- 别把暖色（橙/黄/绿）引入 UI chrome

## 七、判断词

- ✅ 极简、纯白、单色、阴影即边框、多层阴影堆栈、负字距、压缩式大字、克制到哲学
- ❌ 彩色渐变、实心边框、重阴影、多彩强调、正字距/宽字距、彩色区块背景、药丸 CTA、纯黑 `#000000`

## 八、适用边界

**适用于**：开发者工具落地页、浅色极简 SaaS 官网、大标题概念页、纯白极简产品、需要"gallery 式留白"的着陆页。
**不适用于**：暗色运营后台 / 管理面板（那用 Linear 参考——见参考#1）、暖色品牌（Claude 参考）、需要色彩丰富、想用强边框/彩色强调的消费级产品。
