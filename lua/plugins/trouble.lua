return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>xx", function() require("trouble").toggle() end,                        desc = "Trouble: Toggle" },
      { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Trouble: Workspace" },
      { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Trouble: Document" },
      { "<leader>xr", function() require("trouble").toggle("lsp_references") end,        desc = "Trouble: References" },
    },
  }
}
