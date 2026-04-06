#!/usr/bin/env bash
set -e

SKILLS=("branch" "commit" "pr")
COMMANDS=("branch" "commit" "pr")

CODEX_DIR="${HOME}/.codex/skills"
CLAUDE_COMMANDS_DIR="${HOME}/.claude/commands"

REMOVE_CODEX=1
REMOVE_CLAUDE=1

# ===== 옵션 처리 =====
for arg in "$@"; do
  case $arg in
    --codex-only)
      REMOVE_CLAUDE=0
      ;;
    --claude-only)
      REMOVE_CODEX=0
      ;;
    *)
      ;;
  esac
done

remove_markdown_files() {
  local target_dir="$1"
  shift

  if [ ! -d "$target_dir" ]; then
    echo "⚠️  ${target_dir} 존재하지 않음 (skip)"
    return
  fi

  for name in "$@"; do
    local file="${target_dir}/${name}.md"
    if [ -f "$file" ]; then
      echo "🗑 removing $file"
      rm -f "$file"
    else
      echo "⚠️  $file 없음 (skip)"
    fi
  done
}

echo "🧹 ai-dev-skills 제거 시작"

if [ "$REMOVE_CODEX" -eq 1 ]; then
  echo ""
  echo "📦 Codex 제거: ${CODEX_DIR}"
  remove_markdown_files "$CODEX_DIR" "${SKILLS[@]}"
fi

if [ "$REMOVE_CLAUDE" -eq 1 ]; then
  echo ""
  echo "📦 Claude commands 제거: ${CLAUDE_COMMANDS_DIR}"
  remove_markdown_files "$CLAUDE_COMMANDS_DIR" "${COMMANDS[@]}"
fi

echo ""
echo "✅ 제거 완료"
