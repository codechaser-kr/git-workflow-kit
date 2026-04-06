#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="codechaser-kr/git-workflow-kit"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

SKILLS=("branch" "commit" "pr")

CODEX_DIR="${HOME}/.codex/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
CLAUDE_COMMANDS_DIR="${HOME}/.claude/commands"

INSTALL_CODEX=1
INSTALL_CLAUDE=1
INSTALL_COMMANDS=1

# ===== 옵션 처리 =====
for arg in "$@"; do
  case $arg in
    --codex-only)
      INSTALL_CLAUDE=0
      INSTALL_COMMANDS=0
      ;;
    --claude-only)
      INSTALL_CODEX=0
      ;;
    --no-commands)
      INSTALL_COMMANDS=0
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

install_skills() {
  local target_dir="$1"
  mkdir -p "$target_dir"

  for skill in "${SKILLS[@]}"; do
    echo "→ installing ${skill} → ${target_dir}"
    download "${BASE_URL}/skills/${skill}.md" "${target_dir}/${skill}.md"
  done
}

# ===== 실행 =====

echo "🚀 git-workflow-kit 설치 시작"

if [ "$INSTALL_CODEX" -eq 1 ]; then
  echo ""
  echo "📦 Codex 설치: ${CODEX_DIR}"
  install_skills "$CODEX_DIR"
fi

if [ "$INSTALL_CLAUDE" -eq 1 ]; then
  echo ""
  echo "📦 Claude skills 설치: ${CLAUDE_SKILLS_DIR}"
  install_skills "$CLAUDE_SKILLS_DIR"
fi

if [ "$INSTALL_COMMANDS" -eq 1 ]; then
  echo ""
  echo "📦 Claude commands 설치: ${CLAUDE_COMMANDS_DIR}"
  install_skills "$CLAUDE_COMMANDS_DIR"
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
