#!/usr/bin/env bash
# Design Agent Skill — DSH (DeepSeek Harness) 安装 + 自动更新
# DSH 复用 Claude Code 的目录式 skill 格式（SKILL.md + resources/），
# 所以本脚本把自包含的 skills/designer 装进 DSH 的用户技能根。
# 用法:
#   bash install-dsh.sh              # 从当前目录安装到 DSH 用户技能根
#   bash install-dsh.sh --update     # 从 GitHub 拉最新再安装（自动更新，推荐给分发的机器）
#   bash install-dsh.sh --repo URL   # 指定仓库（默认 TheonePro7/design-agent-skill）
#   bash install-dsh.sh --target DIR # 覆盖安装目录（默认 ${DSH_AGENTS_HOME:-$HOME/.agents}/skills）
set -e

REPO="https://github.com/TheonePro7/design-agent-skill.git"
TMP_DIR=""
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# DSH 用户技能根：默认 ~/.agents/skills（DSH_AGENTS_HOME 优先），等价于 DSH 的 user-agents 层。
DSH_SKILLS_ROOT="${DSH_AGENTS_HOME:-$HOME/.agents}/skills"

# 解析参数
while [ $# -gt 0 ]; do
  case "$1" in
    --update) UPDATE=1 ;;
    --repo)   REPO="$2"; shift ;;
    --target) DSH_SKILLS_ROOT="$2"; shift ;;
    *) echo "未知参数: $1（支持 --update / --repo URL / --target DIR）"; exit 1 ;;
  esac
  shift
done

echo "═══ Design Agent Skill → DSH 安装/更新 ═══"

# 处理 --update：拉最新到临时目录再装
if [ "$UPDATE" = "1" ]; then
  echo "→ 从 GitHub 拉取最新版本..."
  TMP_DIR="$(mktemp -d)"
  git clone --quiet --depth 1 "$REPO" "$TMP_DIR/repo" 2>&1 | tail -1
  WORK_DIR="$TMP_DIR/repo"
  echo "  ✅ 最新代码已拉取"
fi

# 1. 安装自包含 skill 到 DSH 用户技能根
echo "→ 安装 designer skill（自包含，含 resources/）到 $DSH_SKILLS_ROOT/designer"
mkdir -p "$DSH_SKILLS_ROOT"
rm -rf "$DSH_SKILLS_ROOT/designer"
cp -r "$WORK_DIR/skills/designer" "$DSH_SKILLS_ROOT/designer"
echo "  ✅ designer + resources 就位"

# 2. 同步知识库到 Hermes 根目录（与 install.sh 一致，DSH 场景也复用该库）
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
  "$DSH_SKILLS_ROOT/designer/SKILL.md" \
  "$DSH_SKILLS_ROOT/designer/resources/_INDEX.md" \
  "$DSH_SKILLS_ROOT/designer/resources/reference-linear.md" \
  "$DSH_SKILLS_ROOT/designer/resources/principles-layout.md" \
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
  echo "   用法：在 DSH 里说"设计/改样式/UI"，或手动 /designer。"
  echo "   后续更新：bash install-dsh.sh --update"
else
  echo ""
  echo "❌ 有文件缺失，请检查。"
  exit 1
fi
