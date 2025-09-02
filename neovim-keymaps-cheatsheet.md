# Neovim 키맵 치트시트

## 📁 파일 탐색 및 관리

### NeoTree (파일 탐색기)

- `<leader>e` - NeoTree 토글
- `<leader>q` - NeoTree와 편집기 함께 닫기
- `A` - 모든 파일 git add
- `gu` - git unstage file
- `ga` - git add file
- `gr` - git revert file
- `gc` - git commit
- `gp` - git push
- `gg` - git commit and push

### Harpoon (파일 북마크)

- `<leader>a` - 현재 파일을 하푼 리스트에 추가
- `<C-e>` - 하푼 퀵 메뉴 토글
- `<leader>fl` - 하푼 목록(Telescope)
- `<C-p>` - 이전 파일로 이동
- `<C-n>` - 다음 파일로 이동

### Telescope (검색)

- `<leader>ff` - 파일 찾기
- `<leader>fg` - 라이브 검색 (내용 기반)
- `<leader>fb` - 버퍼 찾기 (개선된 버퍼 관리)
  - `<C-d>` (Insert/Normal 모드) - 선택한 버퍼 삭제
  - `dd` (Normal 모드) - 선택한 버퍼 삭제
  - `<M-d>` (기본) - 선택한 버퍼 삭제
- `<leader>fh` - 도움말 찾기

### Telescope Git

- `<leader>gl` - Git 커밋 로그 (프로젝트 전체)
- `<leader>gL` - Git 커밋 로그 (현재 파일)
- `<leader>gB` - Git 브랜치 목록
- `<leader>gs` - Git 상태
- `<leader>gS` - 최근 커밋 변경사항 보기 (플로팅 윈도우)
- `<leader>gH` - 특정 커밋 변경사항 보기 (플로팅 윈도우, 해시 입력)

### 버퍼 관리

- `<leader>ba` - 모든 버퍼 닫기 (현재 버퍼 제외, 저장된 것만)
- `<leader>bA` - 모든 버퍼 강제 닫기 (현재 버퍼 제외)
- `<leader>bo` - 다른 모든 버퍼 닫기 (현재 버퍼만 유지)

### 기타 파일 관련

- `<leader>cd` - 파일 탐색기 열기 (Ex)

## 🧭 패널 및 윈도우 네비게이션

### 패널 간 이동

- `<C-h>` - 왼쪽 패널으로 이동
- `<C-j>` - 아래쪽 패널으로 이동
- `<C-k>` - 위쪽 패널으로 이동
- `<C-l>` - 오른쪽 패널으로 이동

## ❓ 키맵 도움말 (which-key)

- `<leader>?` - 버퍼 로컬 키맵 보기 (which-key)

## 🔍 검색 및 편집

### 검색

- `<leader>h` - 검색 하이라이트 제거

### 들여쓰기 (Visual 모드)

- `<` - 선택 영역 들여쓰기 감소
- `>` - 선택 영역 들여쓰기 증가

## 🚀 LSP (Language Server Protocol)

### 코드 탐색

- `K` - 함수/변수 정보 보기 (hover)
- `gd` - 정의로 이동
- `gD` - 선언으로 이동
- `gi` - 구현으로 이동
- `go` - 타입 정의로 이동
- `gr` - 참조 찾기
- `gs` - 시그니처 도움말
- `gl` - 진단 정보 표시

### 코드 수정

- `<F2>` - 심볼 이름 변경
- `<F3>` - 코드 포맷팅
- `<leader>ca` - 코드 액션

## 🐞 디버깅 (DAP)

- `<F5>` - Continue
- `<F10>` - Step Over
- `<F11>` - Step Into
- `<F12>` - Step Out
- `<F9>` - 브레이크포인트 토글
- `<leader>dB` - 조건부 브레이크포인트 설정
- `<leader>du` - DAP UI 토글

## 🗄️ Database (dbee)

- `<leader>db` - DB UI 토글
- `<leader>de` (v) - 선택 영역 쿼리 실행
- `<leader>de` (n) - 버퍼 전체 쿼리 실행
- `]d` - 결과 다음 페이지
- `[d` - 결과 이전 페이지
- `g]d` - 결과 마지막 페이지
- `g[d` - 결과 첫 페이지

## 🧪 테스트 (Neotest)

- `<leader>tn` - 가장 가까운 테스트 실행
- `<leader>tf` - 현재 파일 테스트 실행
- `<leader>ts` - 테스트 요약 토글
- `<leader>to` - 테스트 출력 열기
- `<leader>tt` - 실행 중 테스트 중지

## 📦 태스크 실행 (Overseer)

- `<leader>or` - 템플릿 실행(예: npm run)
- `<leader>oo` - Overseer 패널 토글
- `<leader>ol` - 태스크 로드

## 🌿 Git (Gitsigns / Diffview)

- `]h` / `[h` - 다음/이전 헝크로 이동
- `<leader>hs` - 헝크 stage
- `<leader>hr` - 헝크 reset
- `<leader>hp` - 헝크 미리보기
- `<leader>hu` - stage 취소
- `<leader>gb` - 현재 라인 blame
- `<leader>gd` - Diffview 열기
- `<leader>gD` - Diffview 닫기
- `<leader>gh` - 현재 파일 히스토리

## 🌐 REST 클라이언트 (rest.nvim)

- `<leader>rr` - 현재 요청 실행
- `<leader>rl` - 마지막 요청 재실행
- `<leader>ro` - 결과 창 열기

## 🗂 프로젝트 (project.nvim + Telescope)

- `<leader>fp` - 프로젝트 목록(Telescope projects)

## 🧭 아웃라인 (Aerial)

- `<leader>so` - 문서 심볼 패널 토글

## 🖥 터미널 (toggleterm)

- `<leader>ot` - 터미널 토글
- `<C-\>` - 빠른 토글 (float)

## 🚨 진단 및 문제 해결 (Trouble)

- `<leader>xx` - Trouble 토글
- `<leader>xw` - 워크스페이스 진단
- `<leader>xd` - 문서 진단
- `<leader>xr` - LSP 참조

## ✨ 자동완성 (CMP)

### 기본 동작

- `<CR>` - 선택된 항목 확인
- `<Tab>` - 다음 항목 선택
- `<S-Tab>` - 이전 항목 선택

### 문서 스크롤

- `<C-f>` - 문서 아래로 스크롤
- `<C-u>` - 문서 위로 스크롤

### 메뉴 제어

- `<C-e>` - 자동완성 메뉴 토글

### 스니펫 네비게이션

- `<C-d>` - 다음 스니펫 플레이스홀더로 이동
- `<C-b>` - 이전 스니펫 플레이스홀더로 이동

## 🎨 기타 기능

### Treesitter

- 자동 구문 하이라이팅
- 자동 들여쓰기
- HTML/XML 태그 자동 완성

### 지원 언어

- HTML, CSS, JavaScript, TypeScript
- Vue, JSON, Lua, PHP, SQL, YAML

### 자동화 기능

- **자동 괄호 쌍**: `nvim-autopairs`
- **코드 폴딩**: `nvim-ufo`
- **들여쓰기 가이드**: `indent-blankline.nvim`
- **컬러 하이라이팅**: `nvim-highlight-colors`

## 📝 모드별 키맵

### Normal 모드 (n)

- 대부분의 키맵이 이 모드에서 작동

### Insert 모드 (i)

- 자동완성 관련 키맵
- 스니펫 네비게이션
- `<C-Z>` - Undo
- `<C-Y>` - Redo

### Visual 모드 (x)

- `<F3>` - 코드 포맷팅
- `<` / `>` - 들여쓰기 조정

## 🔧 설정 정보

- **Leader 키**: 기본값 (보통 `\` 또는 `,`)
- **LSP 자동 포맷팅**: Lua 파일에 대해 저장 시 자동 적용
- **ESLint 자동 수정**: 저장 시 `eslint.applyAllFixes` 자동 실행
- **NeoTree**: Neovim 시작 시 자동으로 열림 (디렉터리 인자로 시작할 때만)
- **Git 상태**: NeoTree에서 실시간 표시
- **테마**: Tokyo Night
- **상태바**: Lualine (진단 정보 포함)

---

> 💡 **팁**: 이 치트시트는 현재 Neovim 설정을 기반으로 작성되었습니다. 설정 변경 시 키맵도 달라질 수 있습니다.
