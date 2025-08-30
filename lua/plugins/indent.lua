return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      priority = 1, -- 낮은 우선순위(커서가 위로 오게)
      highlight = { "IblIndent" }
    },
    scope = { enabled = true, show_start = false, show_end = false },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    -- 커서/비주얼과 색상 합성 금지 → 커서가 안 사라짐
    vim.api.nvim_set_hl(0, "IblIndent", { nocombine = true })
    vim.api.nvim_set_hl(0, "IblWhitespace", { nocombine = true })
    -- 혹시 테마 때문에 투명 커서면 다음도 도움이 됩니다.
    -- vim.api.nvim_set_hl(0, "Cursor", { blend = 0 })
  end,
}
