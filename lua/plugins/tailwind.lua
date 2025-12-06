return {
  -- Tailwind 클래스 컬러 미리보기 (nvim-cmp colorizer)
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  -- Tailwind 유틸(클래스 하이라이트/정렬 등)
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" }, -- lsp.lua가 먼저 로드되도록 보장
    config = function()
      -- tailwindcss LSP 설정이 완료될 때까지 대기
      local function setup_tailwind_tools()
        local max_attempts = 20
        local attempt = 0
        
        local function try_setup()
          attempt = attempt + 1
          -- vim.lsp.config가 사용 가능한지 확인
          if vim.lsp and vim.lsp.config then
            local tailwind_tools = require('tailwind-tools')
            -- server.override를 false로 설정하여 deprecated lspconfig 사용 방지
            -- lsp.lua에서 이미 tailwindcss LSP를 설정했으므로 오버라이드 불필요
            tailwind_tools.setup({
              server = {
                override = false, -- LSP 설정 오버라이드 비활성화 (deprecated 경고 방지)
              },
            })
          elseif attempt < max_attempts then
            -- 아직 설정되지 않았으면 잠시 후 재시도
            vim.defer_fn(try_setup, 50)
          else
            -- 최대 시도 횟수 초과 시에도 시도
            local tailwind_tools = require('tailwind-tools')
            tailwind_tools.setup({
              server = {
                override = false, -- LSP 설정 오버라이드 비활성화 (deprecated 경고 방지)
              },
            })
          end
        end
        
        try_setup()
      end
      
      setup_tailwind_tools()
    end,
  },
}