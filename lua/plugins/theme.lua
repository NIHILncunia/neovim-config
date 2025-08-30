return {
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "tokyonight",
      sections = {
        -- 왼쪽: 모드 ▸ 진단 ▸ 파일명 …
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            update_in_insert = true, -- 입력 모드에서도 갱신
            always_visible = false,  -- 0이면 숨김
          },
          { "filename", path = 1 },  -- 필요 시 파일명
        },
        -- 오른쪽은 취향대로
        lualine_x = { "encoding", "filetype" },
        lualine_y = {},
        lualine_z = { "location" },
      },
      options = {
        globalstatus = true,           -- 단일 statusline 사용(선호)
        refresh = { statusline = 50 }, -- 주기적 갱신(보조용)
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)

      -- 진단이 바뀌면 즉시 새로 그림(핵심)
      vim.api.nvim_create_autocmd("DiagnosticChanged", {
        callback = function()
          require("lualine").refresh({ place = { "statusline" } })
        end,
      })
    end,
  }
}
