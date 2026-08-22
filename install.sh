#!/usr/bin/env bash
# Design Agent Skill — 安装 + 自动更新
# 用法:
#   bash install.sh            # 从当前目录安装（装本地副本）
#   bash install.sh --update   # 从 GitHub 拉最新再安装（自动更新，推荐给分发的机器）
#   bash install.sh --repo URL # 指定仓库（默认 TheonePro7/design-agent-skill）
set -e

REPO="https://github.com/TheonePro7/design-agent-skill.git"
TMP_DIR=""
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══ Design Agent Skill 安装/更新 ═══"

# 处理 --update：拉最新到临时目录再装
if [ "$1" = "--update" ]; then
  echo "→ 从 GitHub 拉取最新版本..."
  TMP_DIR="$(mktemp -d)"
  git clone --quiet --depth 1 "$REPO" "$TMP_DIR/repo" 2>&1 | tail -1
  WORK_DIR="$TMP_DIR/repo"
  echo "  ✅ 最新代码已拉取"
fi

# 1. 安装自包含 skill 到 Claude Code 全局技能目录
CLAUDE_SKILLS="$HOME/.claude/skills"
mkdir -p "$CLAUDE_SKILLS"
echo "→ 安装 designer skill（自包含，含 resources/）到 $CLAUDE_SKILLS/"
rm -rf "$CLAUDE_SKILLS/designer"
cp -r "$WORK_DIR/skills/designer" "$CLAUDE_SKILLS/designer"
echo "  ✅ designer + resources 就位"

# 2. 同步知识库到 Hermes 根目录（兼容本地 Hermes 用法）
HERMES_KB="$HOME/.hermes/design-kb"
mkdir -p "$HERMES_KB"
echo "→ 同步知识库到 $HERMES_KB/"
rm -rf "$HERMES_KB/L1-principles" "$HERMES_KB/L2-projects" "$HERMES_KB/L3-lessons"
cp -r "$WORK_DIR/L1-principles" "$HERMES_KB/"
cp -r "$WORK_DIR/L2-projects" "$HERMES_KB/"
cp -r "$WORK_DIR/L3-lessons" "$HERMES_KB/"
cp "$WORK_DIR/manifest.json" "$HERMES_KB/"
echo "  ✅ 知识库就位"

# 3. 校验（核心文件 + resources 自包含检查）
echo ""
echo "═══ 校验 ═══"
MISSING=0
for f in \
  "$CLAUDE_SKILLS/designer/SKILL.md" \
  "$CLAUDE_SKILLS/designer/resources/_INDEX.md" \
  "$CLAUDE_SKILLS/designer/resources/reference-linear.md" \
  "$CLAUDE_SKILLS/designer/resources/principles-layout.md" \
  "$HERMES_KB/L1-principles/_INDEX.md" \
  "$HERMES_KB/L2-projects/_TEMPLATE.md" \
  "$HERMES_KB/L3-lessons/corrections.md"; do
  if [ -f "$f" ]; then
    echo "  ✅ $(basename $f)"
  else
    echo "  ❌ 缺失: $f"
    MISSING=1
  fi
done

# 清理临时目录
if [ -n "$TMP_DIR" ]; then
  rm -rf "$TMP_DIR"
fi

if [ "$MISSING" = "0" ]; then
  echo ""
  echo "✅ 安装/更新成功。designer skill 已就位（自包含，含知识库 resources/）。"
  echo "   用法：Claude Code 说"设计/改样式/UI"，或 /designer。"
  echo "   后续更新：bash install.sh --update"
else
  echo ""
  echo "❌ 有文件缺失，请检查。"
  exit 1
fi
