-- Neovim 키 매핑을 위한 유틸리티 함수
-- 키 바인딩을 설정할 때 반복되는 옵션 설정을 간소화해주는 헬퍼 함수
local keyMapper = function(from, to, mode, opts)
  -- 기본 옵션 설정
  -- noremap: 재귀적 매핑 방지 (기본값: true)
  -- silent: 매핑 실행 시 메시지 출력 방지 (기본값: true)
  local options = { noremap = true, silent = true }

  -- 모드 설정 (기본값: 일반 모드 "n")
  -- n: 일반 모드, i: 삽입 모드, v: 시각적 모드, t: 터미널 모드 등
  mode = mode or "n"

  -- 추가 옵션이 제공된 경우 기본 옵션과 병합
  -- vim.tbl_extend("force", ...)는 두 번째 테이블의 값으로 첫 번째 테이블을 덮어씀
  if opts then
    -- 사용자가 문자열 설명만 넘긴 경우 자동으로 desc 옵션으로 변환
    if type(opts) == "string" then
      opts = { desc = opts }
    end
    options = vim.tbl_extend("force", options, opts)
  end

  -- 실제 키 매핑 설정
  -- vim.keymap.set(모드, 키, 동작, 옵션)
  vim.keymap.set(mode, from, to, options)
end

return { mapKey = keyMapper }
