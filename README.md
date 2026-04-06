# ai-dev-skills

Codex와 Claude에서 공통으로 사용할 수 있는 개발용 AI 스킬 모음입니다.

현재 포함된 스킬:

- branch: 현재 변경사항을 분석해 더 적절한 브랜치 이름 제안
- commit: 변경사항을 분석해 Conventional Commits 형식의 커밋 메시지 제안
- pr: 현재 브랜치 기준으로 PR 제목과 설명 제안

## 설치

이 레포는 별도 클론 없이 install.sh를 바로 실행하는 방식으로 설치할 수 있습니다.

### 기본 설치

Codex와 Claude에 모두 설치합니다.

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/ai-dev-skills/main/install.sh | bash

또는

wget -qO- https://raw.githubusercontent.com/codechaser-kr/ai-dev-skills/main/install.sh | bash

## 설치 옵션

### Codex만 설치

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/ai-dev-skills/main/install.sh | bash -s -- --codex-only

### Claude만 설치

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/ai-dev-skills/main/install.sh | bash -s -- --claude-only

### Claude commands 설치 제외

기본적으로 Claude는 다음 두 위치에 설치됩니다.

- ~/.claude/skills
- ~/.claude/commands

commands 설치를 제외하려면:

curl -fsSL https://raw.githubusercontent.com/codechaser-kr/ai-dev-skills/main/install.sh | bash -s -- --no-commands

## 설치 위치

### Codex

- ~/.codex/skills

### Claude

- ~/.claude/skills
- ~/.claude/commands

## 포함 스킬

### branch

현재 브랜치의 커밋과 변경사항을 분석하여 더 적절한 브랜치 이름을 제안합니다.

### commit

현재 변경사항을 분석하여 Conventional Commits 형식의 커밋 메시지를 제안합니다.

### pr

현재 브랜치 기준으로 GitHub Pull Request 제목과 description을 제안합니다.

## 사용 예시

### Claude

설치 후 다음과 같이 사용할 수 있습니다.

/branch
/commit
/pr

### Codex

설치 후 skills 목록에서 사용하거나, Codex 환경에서 해당 스킬을 불러 사용할 수 있습니다.

## 제거

추후 uninstall.sh를 제공할 예정입니다.

## 주의사항

- 일부 스킬은 현재 디렉토리가 git 저장소라고 가정합니다.
- main 브랜치를 기준으로 비교하도록 작성되어 있습니다.
- 프로젝트 기본 브랜치가 master 또는 다른 이름이라면 추후 개선이 필요할 수 있습니다.

## 라이선스

MIT
