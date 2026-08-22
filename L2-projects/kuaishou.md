# L2 项目规范 · 快手店铺经营分析

> 来源：路径B 自动提取（从 tailwind.config + index.css + ui/ 组件扫描）
> 项目：`/f/AI/kuaishou/frontend` · React + TS + Vite + Tailwind
> 用途：此项目的所有 UI 工作基准。

---

## 一、品牌色

- **主色**：`#22d3ee`（电光青）——CTA/激活态/强调（⚙ 从 tailwind.config 提取）
- **涨**：`#34d399`（绿，up）· **跌**：`#fb7185`（红，down）

## 二、参考系统

- **Linear**（暗色运营后台）——冷调深色，发丝边框，无渐变无阴影
- 对应 `_INDEX.md` 桶 A

## 三、颜色令牌（Tailwind 类，⚙ 提取）

| Token | 值 | 用途 |
|:--|:--|:--|
| `canvas` | #0b0d12 | 页面底层背景 |
| `surface` | #151821 | 卡片面 |
| `raised` | #1e242f | 浮层面 |
| `line` | rgba(255,255,255,.07) | 发丝边框 |
| `line-strong` | rgba(255,255,255,.13) | 强边框/hover |
| `ink` | #e8ebf2 | 主文字 |
| `ink-muted` | #98a0ae | 次文字 |
| `ink-faint` | #5f6876 | 弱文字 |
| `accent` | #22d3ee | 强调/主色 |
| `accent-soft` | rgba(34,211,238,.14) | accent 微染 |
| `up` | #34d399 | 正向/涨 |
| `down` | #fb7185 | 负向/跌 |

## 四、排版

- 字体：**MiSans**（自托管小米开源，免费商用），回退 PingFang SC / Microsoft YaHei
- 数字：`.num` 类 `tabular-nums`（等宽防抖）
- 字重映射：normal=330 / medium=380 / semibold=520（MiSans v4 变量字体）

## 五、组件规范

| 组件 | 文件 | 说明 |
|:--|:--|:--|
| MetricCard | ui/MetricCard | 指标卡，`tone`(default/accent/up/down) |
| Card | ui/Card | `hairline rounded-lg bg-surface`，`hoverable` |
| DataTable | ui/DataTable | tanstack 表格 |
| PageHeader | ui/PageHeader | kicker+title+subtitle 统一头部 |
| AnimatedNumber | ui/AnimatedNumber | 数字动画 |
| Stagger/motion | ui/motion | 入场动效（克制淡入上移） |
| LazyChart | charts/LazyChart | echarts 懒加载 |
| Spinner/ErrorState | ui/ | 三态 |

## 六、设计铁律（本项目红线）

1. 颜色只用 Tailwind 语义类（`text-ink/text-muted/bg-surface`），禁裸 hex（已有 392 token vs 2 裸色）
2. 无渐变、无 box-shadow、无彩色 glow（设计语言明确：冷调深色 + 发丝边框）
3. 数字用等宽 + tabular-nums
4. 动效克制（framer-motion 淡入上移，无回弹缩放）

## 七、适用说明

- 本项目 392 处用 token 类，仅 2 处裸色 → token 系统成熟，路径B 提取完成
- 新建页面优先复用 ui/ 组件，禁手搓
