#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="codechaser-kr/git-workflow-kit"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SKILLS=("branch" "commit" "pr")
CLAUDE_SKILLS=("branch" "commit" "pr")

CODEX_DIR="${HOME}/.codex/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"

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
  local source_path="$1"
  local dest="$2"
  local local_file="${SCRIPT_DIR}/${source_path}"

  if [ -f "$local_file" ]; then
    cp "$local_file" "$dest"
  else
    download "${BASE_URL}/${source_path}" "$dest"
  fi
}

install_codex_skills() {
  local target_dir="$1"
  shift

  mkdir -p "$target_dir"

  for name in "$@"; do
    echo "→ installing ${name} → ${target_dir}"
    install_file "skills/${name}.md" "${target_dir}/${name}.md"
  done
}

install_claude_skills() {
  local target_dir="$1"
  shift

  for name in "$@"; do
    local skill_dir="${target_dir}/${name}"
    mkdir -p "$skill_dir"
    echo "→ installing ${name} → ${skill_dir}/SKILL.md"
    install_file "claude-skills/${name}/SKILL.md" "${skill_dir}/SKILL.md"
  done
}

# ===== 실행 =====

echo "🚀 git-workflow-kit 설치 시작"

if [ "$INSTALL_CODEX" -eq 1 ]; then
  echo ""
  echo "📦 Codex 설치: ${CODEX_DIR}"
  install_codex_skills "$CODEX_DIR" "${SKILLS[@]}"
fi

if [ "$INSTALL_CLAUDE" -eq 1 ]; then
  echo ""
  echo "📦 Claude skills 설치: ${CLAUDE_SKILLS_DIR}"
  install_claude_skills "$CLAUDE_SKILLS_DIR" "${CLAUDE_SKILLS[@]}"
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
