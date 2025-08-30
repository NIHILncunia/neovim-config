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
- `<leader>fl` - 하푼 윈도우 열기
- `<C-p>` - 이전 파일로 이동
- `<C-n>` - 다음 파일로 이동

### Telescope (검색)

- `<leader>ff` - 파일 찾기
- `<leader>fg` - 라이브 검색 (내용 기반)
- `<leader>fb` - 버퍼 찾기
- `<leader>fh` - 도움말 찾기

### 기타 파일 관련

- `<leader>cd` - 파일 탐색기 열기 (Ex)

## 🧭 패널 및 윈도우 네비게이션

### 패널 간 이동

- `<C-h>` - 왼쪽 패널으로 이동
- `<C-j>` - 아래쪽 패널으로 이동
- `<C-k>` - 위쪽 패널으로 이동
- `<C-l>` - 오른쪽 패널으로 이동

## 🔍 검색 및 편집

### 검색

- `<leader>h` - 검색 하이라이트 제거

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
- `<F4>` - 코드 액션

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
- Vue, JSON, Lua, PHP

## 📝 모드별 키맵

### Normal 모드 (n)

- 대부분의 키맵이 이 모드에서 작동

### Insert 모드 (i)

- 자동완성 관련 키맵
- 스니펫 네비게이션

### Visual 모드 (x)

- `<F3>` - 코드 포맷팅

## 🔧 설정 정보

- **Leader 키**: 기본값 (보통 `\` 또는 `,`)
- **LSP 자동 포맷팅**: Lua 파일에 대해 저장 시 자동 적용
- **NeoTree**: Neovim 시작 시 자동으로 열림
- **Git 상태**: NeoTree에서 실시간 표시

---

> 💡 **팁**: 이 치트시트는 현재 Neovim 설정을 기반으로 작성되었습니다. 설정 변경 시 키맵도 달라질 수 있습니다.
