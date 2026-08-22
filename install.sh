#!/usr/bin/env bash
# Design Agent Skill 一键安装
# 把 skill 装到 Claude Code + Hermes 知识库
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "═══ 安装 Design Agent Skill ═══"

# 1. 拷贝 skill 入口到 Claude Code 全局技能目录
CLAUDE_SKILLS="$HOME/.claude/skills"
mkdir -p "$CLAUDE_SKILLS"
echo "→ 拷贝 designer skill 到 $CLAUDE_SKILLS/"
cp -r "$SCRIPT_DIR/skills/designer" "$CLAUDE_SKILLS/designer" 2>/dev/null || true
echo "  ✅ designer skill 就位"

# 2. 拷贝知识库到 Hermes 根目录
HERMES_KB="$HOME/.hermes/design-kb"
mkdir -p "$HERMES_KB"
echo "→ 拷贝知识库到 $HERMES_KB/"
cp -r "$SCRIPT_DIR/L1-principles" "$HERMES_KB/"
cp -r "$SCRIPT_DIR/L2-projects" "$HERMES_KB/"
cp -r "$SCRIPT_DIR/L3-lessons" "$HERMES_KB/"
cp "$SCRIPT_DIR/manifest.json" "$HERMES_KB/"
echo "  ✅ 知识库就位"

# 3. 校验
echo ""
echo "═══ 校验 ═══"
MISSING=0
for f in \
  "$CLAUDE_SKILLS/designer/SKILL.md" \
  "$HERMES_KB/manifest.json" \
  "$HERMES_KB/L1-principles/_INDEX.md" \
  "$HERMES_KB/L1-principles/assets-index.md" \
  "$HERMES_KB/L1-principles/reference-linear.md" \
  "$HERMES_KB/L1-principles/principles-layout.md" \
  "$HERMES_KB/L2-projects/_TEMPLATE.md" \
  "$HERMES_KB/L3-lessons/corrections.md"; do
  if [ -f "$f" ]; then
    echo "  ✅ $(basename $f)"
  else
    echo "  ❌ 缺失: $f"
    MISSING=1
  fi
done

if [ "$MISSING" = "0" ]; then
  echo ""
  echo "✅ 安装成功。Claude Code 输入 /designer 或说"设计"即可加载。"
else
  echo ""
  echo "❌ 有文件缺失，请检查。"
  exit 1
fi
