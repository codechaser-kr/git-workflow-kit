#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="codechaser-kr/git-workflow-kit"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SKILLS=("branch" "commit" "pr")
COMMANDS=("branch" "commit" "pr")

CODEX_DIR="${HOME}/.codex/skills"
CLAUDE_COMMANDS_DIR="${HOME}/.claude/commands"

INSTALL_CODEX=1
INSTALL_CLAUDE=1

# ===== 옵션 처리 =====
for arg in "$@"; do
  case $arg in
    --codex-only)
      INSTALL_CLAUDE=0
      ;;
    --claude-only)
      INSTALL_CODEX=0
      ;;
    *)
      ;;
  esac
done

# ===== 유틸 =====
download() {
  local url="$1"
  local dest="$2"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$url" -O "$dest"
  else
    echo "❌ curl 또는 wget이 필요합니다."
    exit 1
  fi
}

install_file() {
  local source_dir="$1"
  local name="$2"
  local dest="$3"
  local local_file="${SCRIPT_DIR}/${source_dir}/${name}.md"

  if [ -f "$local_file" ]; then
    cp "$local_file" "$dest"
  else
    download "${BASE_URL}/${source_dir}/${name}.md" "$dest"
  fi
}

install_markdown_files() {
  local source_dir="$1"
  local target_dir="$2"
  shift 2

  mkdir -p "$target_dir"

  for name in "$@"; do
    echo "→ installing ${name} → ${target_dir}"
    install_file "$source_dir" "$name" "${target_dir}/${name}.md"
  done
}

# ===== 실행 =====

echo "🚀 git-workflow-kit 설치 시작"

if [ "$INSTALL_CODEX" -eq 1 ]; then
  echo ""
  echo "📦 Codex 설치: ${CODEX_DIR}"
  install_markdown_files "skills" "$CODEX_DIR" "${SKILLS[@]}"
fi

if [ "$INSTALL_CLAUDE" -eq 1 ]; then
  echo ""
  echo "📦 Claude commands 설치: ${CLAUDE_COMMANDS_DIR}"
  install_markdown_files "commands" "$CLAUDE_COMMANDS_DIR" "${COMMANDS[@]}"
fi

echo ""
echo "✅ 설치 완료!"
echo ""
echo "👉 Claude에서:"
echo "   /branch"
echo "   /commit"
echo "   /pr"
echo ""
echo "👉 Codex에서:"
echo "   skills 목록에서 사용 가능"
