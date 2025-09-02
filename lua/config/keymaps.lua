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

-- 버퍼 관리
mapKey('<leader>ba', function()
  -- 모든 버퍼 닫기 (현재 버퍼 제외)
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) and buf ~= current_buf then
      local buf_modified = vim.api.nvim_buf_get_option(buf, 'modified')
      if not buf_modified then
        vim.api.nvim_buf_delete(buf, { force = false })
      end
    end
  end

  vim.notify("모든 저장된 버퍼를 닫았습니다", vim.log.levels.INFO)
end, 'n', "모든 버퍼 닫기 (현재 버퍼 제외)")

mapKey('<leader>bA', function()
  -- 모든 버퍼 강제 닫기 (현재 버퍼 제외)
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) and buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.notify("모든 버퍼를 강제로 닫았습니다", vim.log.levels.WARN)
end, 'n', "모든 버퍼 강제 닫기 (현재 버퍼 제외)")

mapKey('<leader>bo', function()
  -- 다른 모든 버퍼 닫기 (현재 버퍼만 유지)
  vim.cmd('silent! %bd|e#|bd#')
  vim.notify("다른 모든 버퍼를 닫았습니다", vim.log.levels.INFO)
end, 'n', "다른 버퍼 모두 닫기")
