#!/usr/bin/env bash
# Design Context Plugin — 设计标准自动注入插件的安装 + 启用
# 用法:
#   bash install-design-plugin.sh                  # 装当前 profile 并启用
#   bash install-design-plugin.sh --update         # 从 GitHub 拉最新再装
#   bash install-design-plugin.sh --profile NAME   # 装到指定 profile
set -e

REPO="https://github.com/TheonePro7/design-agent-skill.git"
TMP_DIR=""
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROFILE=""
UPDATE=0
while [ $# -gt 0 ]; do
  case "$1" in
    --profile) PROFILE="$2"; shift 2;;
    --update) UPDATE=1; shift;;
    *) shift;;
  esac
done

echo "═══ Design Context Plugin — 安装 ═══"

if [ "$UPDATE" = "1" ]; then
  echo "→ 从 GitHub 拉取最新: $REPO"
  TMP_DIR="$(mktemp -d)"
  TMP_DIR="$(cygpath -w "$TMP_DIR" 2>/dev/null || echo "$TMP_DIR")"
  mkdir -p "$TMP_DIR"
  ( cd "$TMP_DIR" && git clone --quiet --depth 1 "$REPO" repo 2>&1 | tail -1 )
  WORK_DIR="$TMP_DIR/repo"
  echo "  ✅ 已拉取"
fi

# Hermes 根（profile 感知）
if [ -n "$PROFILE" ]; then
  HERMES_ROOT="$HOME/.hermes/profiles/$PROFILE"
else
  HERMES_ROOT="$HOME/.hermes"
fi

# 1. 装插件目录
PLUGIN_DIR="$HERMES_ROOT/plugins/design_context"
mkdir -p "$PLUGIN_DIR"
echo "→ 安装 design_context 到 $PLUGIN_DIR/"
rm -rf "$PLUGIN_DIR"
cp -r "$WORK_DIR/design-plugin/plugins/design_context/." "$PLUGIN_DIR/"
rm -rf "$PLUGIN_DIR/__pycache__"
echo "  ✅ design_context 插件就位"

# 2. 启用（改 config.yaml plugins.enabled，profile 感知）
CONFIG="$HERMES_ROOT/config.yaml"
if [ -f "$CONFIG" ]; then
  echo "→ 启用 design_context 到 config.yaml"
  cp "$CONFIG" "$CONFIG.bak"
  # 若已含 design_context 则跳过；否则追加
  if ! grep -q "design_context" "$CONFIG"; then
    perl -0pi -e 's/(enabled:\n(?:    - \w+\n)+)/$1    - design_context\n/' "$CONFIG"
    echo "  ✅ 已加入 plugins.enabled"
  else
    echo "  ok 已在 enabled 列表"
  fi
fi

if [ -n "$TMP_DIR" ]; then
  rm -rf "$TMP_DIR"
fi

echo ""
echo "✅ Design Context 插件安装并启用完成。重启 Hermes 生效。"
echo "   后续更新：bash install-design-plugin.sh --update [--profile NAME]"
