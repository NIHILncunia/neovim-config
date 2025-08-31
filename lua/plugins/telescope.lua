local mapKey = require('utils.keyMapper').mapKey

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')

      mapKey("<leader>ff", builtin.find_files, "n", "Telescope: 파일 찾기")
      mapKey("<leader>fg", builtin.live_grep, "n", "Telescope: 라이브 검색")
      mapKey("<leader>fb", builtin.buffers, "n", "Telescope: 버퍼 목록")
      mapKey("<leader>fh", builtin.help_tags, "n", "Telescope: 도움말 찾기")
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
