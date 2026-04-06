#!/usr/bin/env bash
set -e

# ===== 설정 =====
REPO="codechaser-kr/git-workflow-kit"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

ISSUE_TEMPLATES=("feature_template" "fix_templatebug" "improvement_template")

TARGET_DIR="./.github/ISSUE_TEMPLATE"

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

# ===== 실행 =====

if [ ! -d ".git" ]; then
  echo "❌ Git 저장소가 아닙니다. 레포 루트에서 실행해주세요."
  exit 1
fi

echo "🚀 GitHub 템플릿 설치 시작"
echo "📁 대상 경로: ${TARGET_DIR}"
echo ""

mkdir -p "$TARGET_DIR"

for template in "${ISSUE_TEMPLATES[@]}"; do
  echo "→ installing ${template}.md → ${TARGET_DIR}"
  download "${BASE_URL}/.github/ISSUE_TEMPLATE/${template}.md" "${TARGET_DIR}/${template}.md"
done

echo ""
echo "✅ GitHub 템플릿 설치 완료!"
echo ""
echo "👉 설치된 이슈 템플릿:"
echo "   - 기능 개발 제안 (feature_template.md)"
echo "   - 기능 개선 제안 (improvement_template.md)"
echo "   - 결함 해결 (fix_templatebug.md)"
echo ""
echo "💡 변경사항을 커밋하고 푸시하면 GitHub Issues에서 사용할 수 있습니다."
