#!/usr/bin/env bash
# Design Agent Skill — Hermes 安装
# 用法:
#   bash install-hermes.sh            # 从当前目录安装到 Hermes skills
#   bash install-hermes.sh --update   # 从 GitHub 拉最新再装
set -e

REPO="https://github.com/TheonePro7/design-agent-skill.git"
TMP_DIR=""
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══ Design Agent Skill — Hermes 安装 ═══"

# 处理 --update
if [ "$1" = "--update" ]; then
  echo "→ 从 GitHub 拉取最新版本..."
  TMP_DIR="$(mktemp -d)"
  git clone --quiet --depth 1 "$REPO" "$TMP_DIR/repo" 2>&1 | tail -1
  WORK_DIR="$TMP_DIR/repo"
  echo "  ✅ 最新代码已拉取"
fi

# Hermes skill 目标目录（按分类放 creative）
HERMES_SKILLS="$HOME/.hermes/skills/creative/designer"
mkdir -p "$HERMES_SKILLS"
echo "→ 安装 designer skill 到 $HERMES_SKILLS/"
rm -rf "$HERMES_SKILLS"
cp -r "$WORK_DIR/hermes/designer" "$HERMES_SKILLS"
echo "  ✅ designer 就位"

# 清理
if [ -n "$TMP_DIR" ]; then
  rm -rf "$TMP_DIR"
fi

# 校验
echo ""
echo "═══ 校验 ═══"
MISSING=0
for f in \
  "$HERMES_SKILLS/SKILL.md" \
  "$HERMES_SKILLS/references/_INDEX.md" \
  "$HERMES_SKILLS/references/reference-linear.md" \
  "$HERMES_SKILLS/references/principles-layout.md" \
  "$HERMES_SKILLS/references/corrections.md"; do
  if [ -f "$f" ]; then
    echo "  ✅ $(basename $f)"
  else
    echo "  ❌ 缺失: $f"
    MISSING=1
  fi
done

if [ "$MISSING" = "0" ]; then
  echo ""
  echo "✅ Hermes 安装成功。说"设计/改样式/UI"即可加载 designer。"
  echo "   后续更新：bash install-hermes.sh --update"
else
  echo ""
  echo "❌ 有文件缺失，请检查。"
  exit 1
fi
