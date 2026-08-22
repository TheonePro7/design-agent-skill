---
name: designer
description: "顶级设计 Agent 入口——自动加载 L1 设计知识库 + L0 素材库，按项目 DESIGN.md 工作，尊重反馈闭环。做任何 UI/前端/设计时先加载。跨机器可移植：知识随包带，通用库自动装。"
version: 1.0.0
author: Hermes Agent
platforms: [windows, linux, macos]
---
# 设计 Agent 入口

> 这是「世界级设计师数字员工」的入口 skill（Hermes 版）。
> 目标：让 Hermes 达到「可用且好看」的设计水平，跨项目复用，不重训。
> 知识库随本 skill 打包在 `references/` 目录，自包含。

## 〇、加载时必做

1. 读 `references/_INDEX.md`（54 系统分桶索引，判断场景）
2. 读 `references/assets-index.md`（素材库选型，现成的不手搓）
3. 读对应项目 `references/<project>.md`（有则用，无则按智能管理建）
4. 读 `references/corrections.md`（反馈闭环，避免重复踩坑）

## 一、动手前必查（选型）

| 需求 | 选 |
|:--|:--|
| 图标 | Lucide |
| 图表 | Recharts（已全局深色） |
| 动效 | react-bits 8个现成组件 |
| 弹窗/下拉/进度 | shadcn/ui + Radix |
| 表格 | TanStack OpsDataTable |
| 操作反馈 | sonner toast |
| 整页三态 | OpsState |
| 危险确认 | ConfirmModal |

## 二、核心设计哲学（先记这 5 条）

1. 参考优先：用户说"高级/好看"先问 Linear/Stripe/Vercel/Claude，不猜
2. 克制装饰：禁渐变、禁彩色glow、禁::before色条、禁emoji图标
3. 不要凑合：半成品（纯色卡、无图标输入框）会被骂"凑合"
4. 素材优先：assets-index 里有的用现成的，不手搓
5. 数据真实：图表禁 `Math.sin()` 假数据（最严重错误）

## 三、门禁 GATE 0-3（硬拦截）

- GATE 0：开工前必须确认参考系统，不瞎猜
- GATE 1：颜色只用语义 token；用现成库；禁假数据；禁过度装饰
- GATE 2：改完必须浏览器截图验证
- GATE 3：提交前 tsc/build 零错误

## 四、L2 智能管理

- 冷启动（无 token）→ 问用户 3 问（参考/明暗/品牌色）→ 生成 token
- 已有基础 → 自动扫描提取 token → 整理成规范，标注来源
- 跨项目复用 → 找参考系统相同的兄弟项目作起点

## 五、相关

- `references/` 目录：_INDEX.md（分桶）、assets-index.md（素材库）、reference-*.md（参考解剖）、principles-*.md（原理）、corrections.md（反馈闭环）
