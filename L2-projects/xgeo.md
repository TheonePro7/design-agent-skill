# L2 项目规范 · XGEO

> 本项目特定的设计规范（token/字体/组件/布局）。L1 通用原理 + L0 素材库 + 这里 = 完整设计基准。
> 用途：XGEO 运营中台 + 营销官网的所有 UI 工作。

---

## 一、品牌色（铁律）

- **主色**：`#06b6d4`（青蓝）——CTA/激活态/链接
- **次色**：`#6366f1`（靛蓝）——渐变尾部、次强调
- **强调**：`#a855f7`（紫）——三色渐变终点

**禁止** `#0ea5e9`（sky blue，旧残留色，被否决过）、`#0088cc`。

## 二、双场景（先判断做哪个）

| 场景 | 参考 | 风格 |
|:--|:--|:--|
| **运营中台** | Linear | 暗色极简、平面、单强调色 #06b6d4、发丝边框 |
| **营销官网** | Stripe/Vercel | 可浅色、渐变、玻璃卡片、Spotlight |

## 三、颜色令牌（`T.color.*`）

| 令牌 | 值 | 用途 |
|:--|:--|:--|
| `T.color.accent` | #06b6d4 | 品牌主色 |
| `T.color.accentTint` | rgba(6,182,212,.08) | hover/选中背景 |
| `T.color.bg` | #080c1a | 页面背景 |
| `T.color.surface` | #10131c | 卡片背景 |
| `T.color.surface2` | #1a1d26 | 次级面板 |
| `T.color.border` | rgba(255,255,255,.05) | 边框 |
| `T.color.borderHover` | rgba(255,255,255,.1) | hover边框 |
| `T.color.textPrimary` | #e8edf5 | 主文字 |
| `T.color.textSecondary` | #b8c4dc | 次级文字 |
| `T.color.textDim` | #8896b8 | 辅助文字 |
| `T.color.textMute` | #5a6a8c | 弱化文字 |
| `T.color.ok` | #22c55e | 成功 |
| `T.color.warn` | #f59e0b | 警告 |
| `T.color.danger` | #ef4444 | 危险 |

## 四、排版

- 正文 14px，最小 **12px**（禁 10/11px）
- 标题 22-24px semibold
- 数字用 **JetBrains Mono** + `tabular-nums`
- 营销容器 **1440px**

## 五、组件规范（必须用现成的）

| 组件 | 导入 |
|:--|:--|
| 页面壳 | `OpsPageShell`（header 必须 prop 传入，非子元素） |
| 头部 | `OpsPageHeader`（kicker 英文大写+图标+中文title+subtitle） |
| 表格 | `OpsDataTable`（禁手写`<table>`） |
| 统计卡 | `OpsStat` |
| 按钮 | `OpsButton`（tone 不是 variant！） |
| 三态 | `OpsState` |
| 确认弹窗 | `ConfirmModal`（危险操作必用） |

## 六、头部速查（kicker 标准）

| 页面 | kicker | title |
|:--|:--|:--|
| Dashboard | DASHBOARD | Dashboard |
| 品牌中心 | BRAND | 品牌中心 |
| 语义对齐 | KEYWORDS | 关键词 |
| 引擎监测 | MONITORING | 引擎监测 |
| 竞品对标 | COMPETITIVE | AI 竞品分析 |
| 诊断报告 | DIAGNOSIS | 诊断详情 |
| 策略方案 | STRATEGY | 策略推荐 |
| AI 写作 | CONTENT | 新建内容 |

## 七、备案信息

```
ICP备案号
公安备案号
```
页面底部独立一行，11px，rgba(136,150,184,.35)。

## 八、铁律(本项目红线)

1. 颜色只用 `T.color.*`，禁裸 hex/`var(--color-*)`
2. Header 必须 prop 传入
3. 表格用 OpsDataTable，禁手搓
4. hover 用 accentTint，禁渐变/glow
5. 图表只引用真实数据，禁 Math.sin 假数据

## 九、相关

- 完整版 `DESIGN-SPEC.md`（front-xgeo 仓库）
- 组件 API：`visual-design-rules/references/ops-shared-components.md`
