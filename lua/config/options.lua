local opt = vim.opt

-- 탭/들여쓰기 설정
opt.tabstop = 2        -- 탭 너비
opt.shiftwidth = 2     -- 들여쓰기 너비
opt.softtabstop = 2    -- 탭 너비
opt.expandtab = true   -- 탭을 공백으로 변환
opt.smartindent = true -- 자동 들여쓰기
opt.wrap = false       -- 줄 바꿈 비활성화

-- UI 관련
opt.number = true          -- 행 번호 표시
opt.cursorline = true      -- 현재 행 강조
opt.relativenumber = false -- 상대 행 번호 비활성화
opt.signcolumn = 'yes'     -- 부가 정보 표시
opt.termguicolors = true   -- 터미널 색상 사용
opt.showtabline = 0        -- 탭 라인 비활성화

-- 검색
opt.incsearch = true  -- 검색어 입력 시 실시간 검색
opt.ignorecase = true -- 대소문자 구분 무시
opt.smartcase = true  -- 대소문자 구분 필요 시 무시

-- 그 외
opt.encoding = 'utf-8' -- 파일 인코딩
opt.cmdheight = 1      -- 명령 행 높이
opt.scrolloff = 10     -- 스크롤 오프셋
opt.mouse:append('a')  -- 마우스 사용 가능
opt.hidden = true      -- 저장하지 않아도 버퍼 전환 허용 (BufLeave 에러 방지)

-- 파일 끝 개행 문자 설정
opt.fixeol = true    -- 파일 끝에 개행 문자 유지
opt.endofline = true -- 파일 끝 개행 문자 보장
