# git-workflow-kit

Codex와 Claude에서 공통으로 사용할 수 있는 Git 워크플로우용 로컬 툴킷입니다.

반복적으로 작성하는 브랜치명, 커밋 메시지, PR 설명 작성을 빠르게 돕기 위한 스킬과 설치 스크립트를 제공합니다.

## 포함 스킬

- branch: 현재 변경사항을 분석해 더 적절한 브랜치 이름 제안
- commit: 변경사항을 분석해 Conventional Commits 형식의 커밋 메시지 제안
- pr: 현재 브랜치 기준으로 PR 제목과 설명 제안

## 설치

이 레포는 클론 없이 install.sh를 바로 실행하는 방식으로 설치합니다.

기본 설치:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash

또는

wget -qO- https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash

## 설치 옵션

Codex만 설치:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash -s -- --codex-only

Claude만 설치:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash -s -- --claude-only

Claude commands 제외:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash -s -- --no-commands

## 설치 위치

Codex:
- ~/.codex/skills

Claude:
- ~/.claude/skills
- ~/.claude/commands

설치 시 branch.md, commit.md, pr.md 파일이 복사됩니다.

## 사용 방법

Claude에서:

/branch
/commit
/pr

Codex에서는 skills 목록에서 사용 가능합니다.

## 설치 확인 방법

설치 후 아래 경로에 파일이 생성되었는지 확인하세요.

- ~/.codex/skills
- ~/.claude/skills
- ~/.claude/commands

주의: 일부 스킬은 현재 디렉토리가 Git 저장소라고 가정합니다.

## 제거

전체 제거:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash

Codex만 제거:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash -s -- --codex-only

Claude만 제거:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash -s -- --claude-only

## GitHub 협업 템플릿

이 레포는 다음 템플릿을 제공합니다:

- 기능 개발 제안
- 기능 개선 제안
- 결함 해결
- Pull Request 템플릿

## 주의사항

- 일부 스킬은 현재 디렉토리가 Git 저장소라고 가정합니다.
- 기본 비교 브랜치는 main 입니다.
- master 또는 다른 기본 브랜치를 사용하는 경우 결과가 다를 수 있습니다.

## 향후 계획

- 기본 브랜치 자동 감지
- 추가 스킬 지원
- update.sh 제공
- 커스텀 스킬 확장 지원

## 라이선스

MIT
