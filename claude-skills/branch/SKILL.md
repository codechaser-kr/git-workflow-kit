---
allowed-tools: Bash(git branch:*), Bash(git log:*), Bash(git diff:*)
description: 현재 브랜치 변경사항을 분석해 브랜치 이름을 제안합니다
---

## Context

- Current branch: !`git branch --show-current`
- Commits since `main` (oneline): !`git log main..HEAD --oneline`
- Commits since `main` (detail): !`git log main..HEAD`
- Changed files since `main`: !`git diff main...HEAD --stat`
- Existing branches: !`git branch -a`

## Your task

위 컨텍스트를 바탕으로 더 적절한 브랜치 이름을 제안해주세요.

### 브랜치 네이밍 컨벤션

형식:

```text
<type>/<description>
```

Type 종류:

- `feature/`: 새로운 기능 추가
- `fix/`: 버그 수정
- `refactor/`: 코드 리팩토링
- `hotfix/`: 긴급 버그 수정 (프로덕션)
- `release/`: 릴리즈 준비
- `docs/`: 문서 작업
- `chore/`: 빌드, 설정 등 기타 작업
- `test/`: 테스트 추가/수정

Description 작성 규칙:

1. 간결하고 명확하게
   - 2-4 단어 정도
   - 케밥 케이스 사용 (소문자, 하이픈으로 구분)
   - 한글 또는 영어 사용 가능
2. 의미 있는 설명
   - 무엇을 하는 브랜치인지 명확히 드러나야 함
   - 지나치게 일반적이거나 모호한 이름은 피함

예시:

- `feature/bookmark-add`
- `feature/북마크-추가`
- `fix/grid-scroll-bug`
- `fix/그리드-스크롤-버그`
- `refactor/sidebar-naming`
- `docs/claude-setup`

### 제안 로직

1. 커밋 타입과 변경 영역을 보고 주된 작업 성격을 파악합니다.
2. 기능 추가가 주 목적이면 리팩토링이 일부 포함되어도 `feature/`를 우선합니다.
3. 커밋 메시지와 변경 파일 경로에서 공통 키워드를 추출해 description을 만듭니다.
4. 필요하면 기존 브랜치 패턴도 참고하되, 너무 길거나 모호한 이름은 피합니다.

### 출력 형식

다음 형식으로 답변해주세요:

1. 현재 브랜치 이름
2. 분석 결과
   - 커밋 수
   - 주요 Type
   - 변경된 파일 영역
   - 작업 내용 요약
3. 제안하는 브랜치 이름 2-3개
4. 추천 브랜치 이름 1개
5. 브랜치 이름 변경 명령어

브랜치 이름 변경 명령어는 아래 형태를 참고하세요:

```bash
git branch -m <new-branch-name>
git push origin --delete <old-branch-name>
git push -u origin <new-branch-name>
```
