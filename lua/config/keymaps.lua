local mapKey = require('utils.keyMapper').mapKey

-- 파일에서 Ex 안하고 편하게 뒤로 가기
mapKey("<leader>cd", vim.cmd.Ex)
mapKey("<C-Z>", "<C-O>u", "i", "Undo in insert mode")
mapKey("<C-Y>", "<C-O><C-R>", "i", "Redo in insert mode")

-- NeoTree 관련
mapKey('<leader>e', ':Neotree toggle<cr>', "n") -- 네오트리 토글
mapKey('<leader>q', function()
  -- 1) 네오트리 패널을 닫고
  vim.cmd('Neotree action=close')

  -- 2) 이후 활성 윈도우 (에디터 패널)을 닫습니다.
  vim.cmd('q')
end, 'n') -- 네오트리와 편집기함께 닫기

-- pane navigation
mapKey("<C-h>", "<C-w>h") -- 왼쪽 패널 이동
mapKey("<C-j>", "<C-w>j") -- 아래쪽 패널 이동
mapKey("<C-k>", "<C-w>k") -- 위쪽 패널 이동
mapKey("<C-l>", "<C-w>l") -- 오른쪽 패널 이동

-- clear search hl
mapKey("<leader>h", "<cmd>nohlsearch<cr>") -- 검색 하이라이트 제거

-- indent
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')
