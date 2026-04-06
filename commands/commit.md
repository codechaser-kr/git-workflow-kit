---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*)
description: 변경사항을 분석해 Conventional Commits 형식의 커밋 메시지를 제안합니다
---

## Context

- Current git status: !`git status --short`
- Staged diff: !`git diff --cached`
- Unstaged diff: !`git diff`
- Recent commits: !`git log -5 --oneline`

## Your task

현재 git 변경사항을 분석해 Conventional Commits 형식의 커밋 메시지를 제안해주세요.

### 분석 규칙

1. 스테이징된 변경사항이 있으면 이를 우선으로 보고, 없으면 전체 변경사항을 기준으로 판단합니다.
2. 최근 커밋 스타일이 있으면 참고하되, 아래 규칙을 우선합니다.

### 커밋 메시지 형식

```text
<type>: <description>

[optional body]
```

Type 종류:

- `feat`: 새로운 기능 추가
- `fix`: 버그 수정
- `refactor`: 코드 리팩토링, 성능 개선
- `style`: 코드 스타일 변경
- `test`: 테스트 추가 또는 수정
- `docs`: 문서 변경
- `chore`: 빌드, 설정, 의존성 등 기타 변경

작성 규칙:

1. Description
   - 한글로 작성
   - 50자 이내
   - 명사형 또는 짧은 서술형
   - 마침표 없음
2. Body
   - 꼭 필요할 때만 추가
   - 변경 이유나 핵심 세부사항만 작성

### 출력 형식

다음 형식으로 답변해주세요:

1. 변경사항 요약
2. 제안하는 커밋 메시지 2-3개
3. 추천 메시지 1개

옵션을 제시하되 가장 적합한 메시지를 명확히 추천해주세요.
