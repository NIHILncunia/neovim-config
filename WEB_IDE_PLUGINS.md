### 웹 개발 IDE 플러그인 추천 목록 (React/Vue/JS/TS/HTML/CSS/SCSS/JSON)

- **LSP/언어 기능 확장**

  - neovim/nvim-lspconfig: LSP 클라이언트 설정
  - yioneko/nvim-vtsls: 고성능 TypeScript LSP(vtsls)
  - b0o/schemastore.nvim: JSON/YAML 스키마 자동 연동
  - prisma/prisma-language-tools (prismals): Prisma LSP (선택)

- **자동완성/스니펫**

  - hrsh7th/nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path, cmp-nvim-lua
  - L3MON4D3/LuaSnip, rafamadriz/friendly-snippets

- **Treesitter/문맥 기능**

  - nvim-treesitter/nvim-treesitter
  - windwp/nvim-ts-autotag: JSX/HTML 태그 자동 닫기/갱신
  - JoosepAlviste/nvim-ts-context-commentstring: TSX/JSX 문맥별 주석 처리

- **HTML/CSS/Emmet/Tailwind**

  - emmet-language-server 또는 mattn/emmet-vim: Emmet 확장
  - tailwindlabs/tailwindcss-intellisense (LSP 기반 사용 시: tailwindcss): Tailwind 클래스 인텔리센스
  - luckasRanarison/tailwind-tools.nvim 또는 themaxmarchuk/tailwindcss-colors.nvim: 버퍼 내 클래스 색상/미리보기 강화

- **검색/네비/파일트리**

  - nvim-telescope/telescope.nvim (+ telescope-ui-select)
  - nvim-neo-tree/neo-tree.nvim
  - ThePrimeagen/harpoon (v2)
  - folke/which-key.nvim

- **진단/상태/UX**

  - folke/trouble.nvim: LSP/diagnostics/refs UI 패널
  - j-hui/fidget.nvim: LSP 진행 표시
  - folke/noice.nvim (선택): 메시지/명령라인/팝업 UX 개선

- **Git**

  - lewis6991/gitsigns.nvim: 라인 단위 Git 표식/헝크 조작
  - sindrets/diffview.nvim: 브랜치/PR 스타일 diff 보기

- **작업 실행/테스트/디버깅**

  - stevearc/overseer.nvim: package.json 스크립트/작업 러너
  - nvim-neotest/neotest, neotest-jest, neotest-vitest: JS/TS 테스트 실행/리포트
  - mfussenegger/nvim-dap, rcarriga/nvim-dap-ui: 디버깅 UI
  - mxsdev/nvim-dap-vscode-js: Node/Chrome 디버거 어댑터
  - williamboman/mason-nvim-dap: DAP 설치 관리

- **REST/HTTP**

  - rest-nvim/rest.nvim: HTTP 요청 실행/리플레이

- **프로젝트/아웃라인/터미널**

  - ahmedkhalf/project.nvim: 루트/프로젝트 감지 + Telescope 연계
  - stevearc/aerial.nvim: 문서 아웃라인
  - SmiteshP/nvim-navic (+ barbecue.nvim 선택): 상단 브레드크럼
  - akinsho/toggleterm.nvim: 내장 터미널 관리

- **기타 생산성**
  - kevinhwang91/nvim-ufo: 접기(folding) UX 강화
  - numToStr/Comment.nvim: 주석 토글
  - windwp/nvim-autopairs: 괄호 자동완성
  - lukas-reineke/indent-blankline.nvim: 인덴트 가이드라인
  - nvim-tree/nvim-web-devicons, nvim-lualine/lualine.nvim, folke/tokyonight.nvim: UI/테마

참고:

- VSCode 유사 패널형 IDE 레이어: `ldelossa/nvim-ide` — [GitHub 문서](https://github.com/ldelossa/nvim-ide)
- NVChad 웹 개발 맞춤 참고 예시 — [예시 레포](https://github.com/jatinhemnani01/nvchad-web-dev)
