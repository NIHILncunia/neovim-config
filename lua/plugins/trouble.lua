-- return {
--   {
--     "folke/trouble.nvim",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     opts = {},
--     keys = {
--       { "<leader>xx", function() require("trouble").toggle() end,                      desc = "Trouble: Toggle" },
--       { "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, desc = "Trouble: Workspace" },
--       { "<leader>xd", function() require("trouble").open("document_diagnostics") end,  desc = "Trouble: Document" },
--       { "<leader>xr", function() require("trouble").open("lsp_references") end,        desc = "Trouble: References" },
--     },
--   }
-- }

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}, -- 기본 설정 사용
    keys = {
      -- 1. 워크스페이스(전체) 진단 결과 보기 (<leader>xw)
      -- v3에서는 그냥 "diagnostics"가 기본적으로 워크스페이스 전체를 보여줍니다.
      {
        "<leader>xw",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble: Workspace Diagnostics"
      },

      -- 2. 현재 파일(문서) 진단 결과 보기 (<leader>xd) ★ 여기가 문제였던 부분
      -- v3에서는 "diagnostics" 모드에 "filter.buf=0"(현재 버퍼) 조건을 걸어야 합니다.
      {
        "<leader>xd",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Trouble: Document Diagnostics"
      },

      -- 3. LSP 참조 보기 (<leader>xr)
      -- "lsp_references" 모드는 v3에서도 유효합니다.
      {
        "<leader>xr",
        "<cmd>Trouble lsp_references toggle<cr>",
        desc = "Trouble: LSP References"
      },

      -- 4. 기본 토글 (<leader>xx)
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble: Toggle"
      },
    },
  }
}
