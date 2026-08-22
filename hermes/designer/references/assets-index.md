# L0 素材库 · 云仓不手搓

> 用途：设计 agent 动手前**必查**。这里有现成的图标/图表/动效/组件/表格/表单，能用的绝不手搓。
> 核心原则：**巧妇难为无米之炊——优先用现成库，手搓是最后手段。**

---

## 一、图标库

### Lucide（首选）
- **导入**：`import { IconName } from 'lucide-react'`
- **尺寸统一**：12/16/20/24px，图标 `<Icon size={16} />`
- **颜色**：`<Icon size={16} style={{ color: T.color.accent }} />`
- **常用**：Activity, BarChart3, Hash, Target, Stethoscope, Zap, PenLine, ListChecks, CheckCircle2, AlertTriangle, Search, Plus, X, Check, ChevronDown, Pencil, Trash2, ExternalLink, Sparkles, Loader2

**规则**：
- ✅ 一律用 Lucide，**禁止** SVG 手绘/emoji 当图标
- ✅ 操作按钮图标 + 文字（如 `<Edit2 size={12} />编辑`）
- ✅ 状态用图标+文字+颜色三重区分（不只是图标）

---

## 二、图表库

### Recharts（已全局配置深色主题）
- **导入**：`import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, PieChart, Pie, Cell, LineChart, Line } from 'recharts'`
- **Tooltip 已全局深色**（index.css），页面**无需**再传 `contentStyle`
- **容器**：`<ResponsiveContainer width="100%" height={260}>`
- **禁止假数据**：`Math.sin()`/随机数 = 最严重错误

**选型**：
| 数据 | 用 |
|:--|:--|
| 随时间变化 | LineChart |
| 分类对比 | BarChart（横向用 `layout="vertical"`） |
| 占比 | PieChart（`innerRadius` 做环形） |
| 引擎覆盖 | BarChart + Cell fill 引擎色 |

---

## 三、动效库（React-bits / Magic 已装）

### 现成的 8 个动效组件
| 组件 | 用途 |
|:--|:--|
| `AnimatedContent` | 数字/内容切换动画 |
| `ClickSpark` | 点击粒子火花 |
| `ElectricBorder` | 电光边框 |
| `FadeContent` | 淡入淡出 |
| `GlareHover` | 光标反光 |
| `Grainient` | 渐变噪点 |
| `Magnet` | 磁性吸附 |
| `SpotlightCard` | 聚光灯卡片 |

**动效时长基准**：
- 微交互：**150-300ms**（默认 200ms）
- 页面切换：**200-400ms**（默认 300ms）
- 缓动：进场 `ease-out`，对称 `ease-in-out`
- ✅ 尊重 `prefers-reduced-motion`

**规则**：动效全部接入后 → 看效果 → 删留。一个页面动效 ≤2 种，多了像游乐场。

---

## 四、组件库（shadcn/ui + Radix，已装）

### 表单/交互组件（`components/ui/`）
| 组件 | 用途 |
|:--|:--|
| `button` | 按钮（cva 变体） |
| `input` | 输入框 |
| `label` | 表单标签 |
| `select` | 下拉（radix） |
| `tabs` | Tab 导航 |
| `dialog` / `modal` | 弹窗 |
| `dropdown-menu` | 下拉菜单 |
| `progress` | 进度条 |
| `alert` | 提示 |
| `badge` | 徽章 |
| `card` | 卡片 |
| `spinner` | 加载 |

**规则**：
- ✅ 用现成组件，禁止手搓基础交互（弹窗/下拉/进度条）
- ✅ 表单字段：label + input + 校验（placeholder 不能替代 label）
- ✅ 删除等危险操作：用 `ConfirmModal`（文字确认，防误删）

---

## 五、表格库

### TanStack Table（已封装 OpsDataTable）
- **导入**：`import { OpsDataTable } from '@/components/shared/OpsDataTable'`
- **列定义**：`createColumnHelper<T>()` + `col.accessor`
- **特性**：列排序、列宽拖拽、hover、表头居中、`leftAlignColumns`

**规则**：
- ✅ 数据表格一律用 `OpsDataTable`，**禁止**手写 `<table>`
- ✅ 操作列用图标按钮（Lucide），不用中文"编/删"

---

## 六、反馈/提示组件

| 组件 | 用途 |
|:--|:--|
| `sonner` 的 `toast` | 轻量操作反馈（成功/失败） |
| `OpsState` | 整页三态（loading/empty/error） |
| `ConfirmModal` | 危险操作确认 |

---

## 七、选择决策表（动手前先查这表）

| 需求 | 选 |
|:--|:--|
| 图标 | Lucide |
| 折线/柱状/饼图 | Recharts |
| 数据表格 | TanStack Table（OpsDataTable） |
| 动效 | react-bits 8 个现成组件 |
| 弹窗/下拉/进度 | shadcn/ui + Radix |
| 操作反馈 | sonner toast |
| 整页三态 | OpsState |
| 危险确认 | ConfirmModal |

**铁律：这表里有的，先用现成的。手搓 = 低效 + 可能出错 + 不统一。**
