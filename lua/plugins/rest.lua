local mapKey = require('utils.keyMapper').mapKey

return {
  -- kulala.nvim 사용 (컴파일 불필요, Windows에서 안정적)
  -- rest.nvim v3의 Windows 컴파일 에러를 피하기 위해 kulala.nvim으로 전환
  {
    'mistweaverco/kulala.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'http', 'rest' },
    opts = {
      -- 기본 키매핑 비활성화 (커스텀 키매핑 사용)
      global_keymaps = false,
      global_keymaps_prefix = '<leader>R',
      kulala_keymaps_prefix = '',
    },
    config = function(_, opts)
      require('kulala').setup(opts)

      -- 기존 rest.nvim과 동일한 키매핑 유지
      -- kulala.nvim의 기본 동작을 키 입력 시뮬레이션으로 호출
      mapKey('<leader>rr', function()
        -- 현재 요청 실행 (kulala.nvim의 기본 키매핑 <leader>Rs 시뮬레이션)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<leader>Rs', true, false, true), 'n', false)
      end, 'n', { desc = 'REST: Run', buffer = 0 })

      mapKey('<leader>rl', function()
        -- 마지막 요청 재실행 (kulala.nvim은 기본적으로 마지막 요청을 지원)
        -- 동일하게 현재 요청 실행 (kulala.nvim은 자동으로 마지막 요청을 기억)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<leader>Rs', true, false, true), 'n', false)
      end, 'n', { desc = 'REST: Run last', buffer = 0 })

      mapKey('<leader>ro', function()
        -- 결과 창 열기 (kulala.nvim은 응답을 새 버퍼에 표시하므로 버퍼 탐색)
        -- kulala.nvim의 응답 버퍼를 찾아서 포커스
        local bufs = vim.api.nvim_list_bufs()
        for _, buf in ipairs(bufs) do
          local name = vim.api.nvim_buf_get_name(buf)
          if name:match('kulala') or name:match('response') then
            vim.api.nvim_set_current_buf(buf)
            return
          end
        end
        -- 응답 버퍼를 찾지 못한 경우 기본 동작
        vim.notify('응답 버퍼를 찾을 수 없습니다. 먼저 요청을 실행하세요.', vim.log.levels.WARN)
      end, 'n', { desc = 'REST: Open result', buffer = 0 })
    end,
  },
}
