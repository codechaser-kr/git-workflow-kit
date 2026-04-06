# git-workflow-kit

Codex와 Claude에서 공통으로 사용할 수 있는 Git 워크플로우용 로컬 툴킷입니다.

반복적으로 작성하는 브랜치명, 커밋 메시지, PR 설명 작성을 빠르게 돕기 위한 Codex skills, Claude commands와 GitHub 협업용 이슈 템플릿을 제공합니다.

## 포함 내용

### AI 스킬

- branch: 현재 변경사항을 분석해 더 적절한 브랜치 이름 제안
- commit: 변경사항을 분석해 Conventional Commits 형식의 커밋 메시지 제안
- pr: 현재 브랜치 기준으로 PR 제목과 설명 제안

### GitHub 이슈 템플릿

- 기능 개발 제안
- 기능 개선 제안
- 결함 해결

## 설치

두 가지 설치 스크립트를 제공합니다. 용도가 다르므로 각각 따로 실행합니다.

### AI 스킬 설치 (`install.sh`)

Codex와 Claude의 **글로벌 경로**에 각각 맞는 형식으로 설치합니다. 어느 레포에서든 사용할 수 있습니다.

레포를 직접 clone 한 뒤 `./install.sh`로 실행하면 현재 체크아웃된 로컬 파일을 기준으로 설치합니다. `curl` 또는 `wget` 예시는 GitHub `main` 브랜치 기준으로 설치합니다.

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash
```

또는

```bash
wget -qO- https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash
```

**설치 옵션:**

Codex만 설치:

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash -s -- --codex-only
```

Claude만 설치:

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/install.sh | bash -s -- --claude-only
```

**설치 위치:**

- Codex skills: `~/.codex/skills`
- Claude commands: `~/.claude/commands`

### GitHub 이슈 템플릿 설치 (`setup-github.sh`)

**레포별로** `.github/ISSUE_TEMPLATE/`에 이슈 템플릿을 추가합니다. 템플릿을 적용할 레포의 루트에서 실행합니다.

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/setup-github.sh | bash
```

설치 후 변경사항을 커밋하고 푸시하면 GitHub Issues에서 사용할 수 있습니다.

**설치되는 템플릿:**

- 기능 개발 제안 (`feature_template.md`)
- 기능 개선 제안 (`improvement_template.md`)
- 결함 해결 (`fix_templatebug.md`)

## 사용 방법

Claude에서는 commands 로 설치되며 다음처럼 사용할 수 있습니다:

```
/branch
/commit
/pr
```

Codex에서는 skills 목록에서 사용 가능합니다.

## 제거

전체 제거:

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash
```

Codex만 제거:

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash -s -- --codex-only
```

Claude만 제거:

```bash
curl -fsSL https://raw.githubusercontent.com/codechaser-kr/git-workflow-kit/main/uninstall.sh | bash -s -- --claude-only
```

## 주의사항

- 일부 스킬은 현재 디렉토리가 Git 저장소라고 가정합니다.
- 기본 비교 브랜치는 main 입니다.
- master 또는 다른 기본 브랜치를 사용하는 경우 결과가 다를 수 있습니다.

## 라이선스

MIT
