---
name: branch
description: 현재 브랜치의 변경사항을 분석하여 더 적절한 브랜치 이름을 제안합니다
---

# 브랜치 이름 제안

현재 브랜치의 커밋 내용과 변경사항을 분석하여 더 적절한 브랜치 이름을 제안해주세요.

## 분석 단계

1. `git branch --show-current`로 현재 브랜치 이름 확인
2. `git log main..HEAD --oneline`으로 main 이후 모든 커밋 확인
3. `git log main..HEAD`로 커밋 메시지 상세 내용 확인
4. `git diff main...HEAD --stat`로 변경된 파일 통계 확인
5. 커밋 메시지의 type과 내용을 분석하여 패턴 파악

## 브랜치 네이밍 컨벤션

### 형식

```text
<type>/<description>
mkdir -p skills

cat > skills/branch.md <<'EOF'
---
name: branch
description: 현재 브랜치의 변경사항을 분석하여 더 적절한 브랜치 이름을 제안합니다
---

# 브랜치 이름 제안

현재 브랜치의 커밋 내용과 변경사항을 분석하여 더 적절한 브랜치 이름을 제안해주세요.

## 분석 단계

1. `git branch --show-current`로 현재 브랜치 이름 확인
2. `git log main..HEAD --oneline`으로 main 이후 모든 커밋 확인
3. `git log main..HEAD`로 커밋 메시지 상세 내용 확인
4. `git diff main...HEAD --stat`로 변경된 파일 통계 확인
5. 커밋 메시지의 type과 내용을 분석하여 패턴 파악

## 브랜치 네이밍 컨벤션

### 형식

<type>/<description>

### Type 종류

- `feature/`: 새로운 기능 추가
- `fix/`: 버그 수정
- `refactor/`: 코드 리팩토링
- `hotfix/`: 긴급 버그 수정 (프로덕션)
- `release/`: 릴리즈 준비
- `docs/`: 문서 작업
- `chore/`: 빌드, 설정 등 기타 작업
- `test/`: 테스트 추가/수정

### Description 작성 규칙

1. 간결하고 명확하게
   - 2-4 단어 정도
   - 케밥 케이스 사용 (소문자, 하이픈으로 구분)
   - 한글 또는 영어 사용 가능

2. 의미 있는 설명
   - 무엇을 하는 브랜치인지 명확히 드러나야 함
   - 지나치게 일반적이거나 모호한 이름 지양

3. 예시

   feature/bookmark-add  
   feature/북마크-추가  
   fix/grid-scroll-bug  
   fix/그리드-스크롤-버그  
   refactor/sidebar-naming  
   refactor/사이드바-네이밍  
   docs/claude-setup  
   chore/dependency-update  

## 브랜치 이름 제안 로직

1. 단일 Type 확인
   - 모든 커밋이 같은 type이면 해당 type 사용
   - 예: 모든 커밋이 feat: 로 시작 → feature/

2. 혼합 Type 처리
   - 대부분의 커밋이 특정 type이면 해당 type 사용
   - feat + refactor → feature/ (기능 추가가 주 목적)
   - fix + test → fix/ (버그 수정이 주 목적)

3. Description 추출
   - 커밋 메시지에서 공통 키워드 추출
   - 변경된 파일 경로에서 주요 모듈/기능 파악
   - 여러 커밋의 내용을 종합하여 핵심 작업 파악

## 출력 형식

분석 후 다음과 같이 출력해주세요:

1. 현재 브랜치 이름
2. 분석 결과
   - 커밋 수
   - 주요 Type
   - 변경된 파일 영역
   - 작업 내용 요약
3. 제안하는 브랜치 이름 (2-3개 옵션)
4. 추천 브랜치 이름 (가장 적합한 것 1개)
5. 브랜치 이름 변경 명령어 (사용자가 바로 실행할 수 있도록)

## 출력 예시

현재 브랜치 분석

현재 브랜치: feature/update-component

분석 결과:
- 커밋 수: 3개
- 주요 Type: feat (2개), refactor (1개)
- 변경된 영역: packages/second/src/routes/layouts/Sidebar/Nav/ErpBookmark
- 작업 내용: ERP 메뉴 북마크 기능 추가 및 UI 개선

제안하는 브랜치 이름

옵션 1 (추천):
feature/erp-bookmark-add

또는
feature/erp-북마크-추가

옵션 2:
feature/bookmark-function

옵션 3:
feature/sidebar-bookmark

브랜치 이름 변경 방법

# 로컬 브랜치 이름 변경
git branch -m feature/erp-bookmark-add

# 만약 이미 원격에 푸시했다면
git push origin :feature/update-component
git push -u origin feature/erp-bookmark-add

참고: 브랜치 이름은 팀의 컨벤션을 따르는 것이 중요합니다. 제안된 이름을 참고하되, 팀 규칙에 맞게 조정하세요.

## 분석 시 고려사항

- 주요 변경사항 우선: 단순 리팩토링보다 기능 추가가 있으면 feature로 분류
- 문맥 파악: 커밋 메시지와 변경된 파일을 함께 고려
- 일관성: 프로젝트의 기존 브랜치 이름 패턴 확인 (git branch -a로 다른 브랜치 참고)
- 간결성: 너무 길거나 복잡한 이름 지양
