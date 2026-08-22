# Design Agent Skill — 顶级设计能力包

> 让 Claude Code / Hermes / Codex 达到「可用且好看」的设计水平，跨项目复用，不重训。
> 知识库 ≠ 文档堆——已蒸馏成 agent 可直接执行的规则，含 GATE 0-3 门禁。

---

## 这是什么

一个完整的**设计数字员工**能力包，包含：
- **设计原理**（Gestalt / 排版 / 色彩 / 交互 / 无障碍）——学科共识
- **参考解剖**（Linear / Stripe / Vercel / Claude）——4 大设计系统蒸馏
- **素材库**（图标 / 图表 / 动效 / 组件选型指南）——云仓不手搓
- **54 个设计系统分桶索引**（A-H 8 场景）
- **项目规范模板** + **反馈闭环**
- **GATE 0-3 门禁**（硬拦截防 AI 翻车）

---

## 文件位置（安装后）

```
~/.claude/skills/designer/SKILL.md        ← 入口 skill（Claude Code 自动加载）
~/.hermes/design-kb/manifest.json         ← 通用库自动安装清单
~/.hermes/design-kb/L1-principles/        ← 设计原理 + 参考解剖 + 素材库 + 分桶索引
~/.hermes/design-kb/L2-projects/          ← 项目规范（每项目一份 DESIGN.md）
~/.hermes/design-kb/L3-lessons/           ← 反馈闭环（纠正记录）
```

---

## 安装到 Claude Code

### 一键安装（推荐）

```bash
bash install.sh
```

脚本会：
1. 把 `skills/designer/` 复制到 `~/.claude/skills/designer/`
2. 把 `L1-principles/` 等知识库复制到 `~/.hermes/design-kb/`
3. 校验所有文件

### 手动安装

```bash
# 1. 拷贝 skill 入口到 Claude Code 全局技能目录
cp -r skills/designer ~/.claude/skills/designer

# 2. 拷贝知识库到 Hermes 根目录
mkdir -p ~/.hermes/design-kb
cp -r L1-principles ~/.hermes/design-kb/
cp -r L2-projects ~/.hermes/design-kb/
cp -r L3-lessons ~/.hermes/design-kb/
cp manifest.json ~/.hermes/design-kb/
```

---

## Claude Code 怎么用

### 自动加载
Clone 后 `skill_view(name='designer')`，或在对话中说"设计/UI/前端/改样式"，Claude Code 会自动加载。

### 手动调用
在 Claude Code 里：
```
/designer
```
或直接说：
```
加载 designer skill，优化这个页面
```

### 触发流程
Claude Code 加载 `designer` skill 后，会：
1. 读知识库（L1 原理 + 参考 + 素材库）
2. 读项目 DESIGN.md（L2，有则用）
3. 读反馈闭环（L3，避免重复踩坑）
4. 遵守 GATE 0-3 门禁
5. 查 manifest.json 自动装通用库

---

## 门禁 GATE 0-3（硬拦截，防 AI 翻车）

| GATE | 时机 | 规则 | 违反后果 |
|:--|:--|:--|:--|
| **GATE 0** | 开工前 | 必须确认参考系统（Linear/Stripe/Vercel/Claude），不瞎猜 | 停下问参考 |
| **GATE 1** | 实现中 | 颜色只用语义 token；用现成库不手搓；禁假数据；禁过度装饰 | 回退改标准做法 |
| **GATE 2** | 验收前 | 必须截图验证效果 | 先截屏确认 |
| **GATE 3** | 提交前 | 编译零错误 | 修到通过 |

---

## 目录结构

```
design-agent-skill/
├── README.md              # 本文件
├── install.sh             # 一键安装脚本
├── manifest.json          # 通用库自动安装清单
├── skills/designer/
│   └── SKILL.md           # 设计 Agent 入口（含 GATE 门禁）
├── L1-principles/         # 设计原理 + 参考解剖
│   ├── _INDEX.md          # 54系统分桶索引 A-H
│   ├── assets-index.md    # 素材库·不手搓
│   ├── principles-*.md    # 5学科原理
│   └── reference-*.md     # 4参考解剖
├── L2-projects/           # 项目规范
│   ├── xgeo.md            # XGEO 示例
│   └── _TEMPLATE.md       # 新项目模板
└── L3-lessons/
    └── corrections.md     # 反馈闭环
```

---

## 核心哲学

1. **参考优先**——用户说"高级/好看"先问参考，不猜
2. **克制装饰**——禁渐变/彩色glow/::before色条/emoji图标
3. **不要凑合**——半成品会被骂"凑合"
4. **素材优先**——现成库先用，不手搓
5. **数据真实**——图表禁 `Math.sin()` 假数据（最严重错误）
