return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      ".__   __.  __   __    __   __   __      .__   __.   ______  __    __   __  .__   __.  __       ___",
      "|  \\ |  | |  | |  |  |  | |  | |  |     |  \\ |  |  /      ||  |  |  | |  | |  \\ |  | |  |     /   \\",
      "|   \\|  | |  | |  |__|  | |  | |  |     |   \\|  | |  ,----'|  |  |  | |  | |   \\|  | |  |    /  ^  \\",
      "|  . `  | |  | |   __   | |  | |  |     |  . `  | |  |     |  |  |  | |  | |  . `  | |  |   /  /_\\  \\",
      "|  |\\   | |  | |  |  |  | |  | |  `----.|  |\\   | |  `----.|  `--'  | |  | |  |\\   | |  |  /  _____  \\",
      "|__| \\__| |__| |__|  |__| |__| |_______||__| \\__|  \\______| \\______/  |__| |__| \\__| |__| /__/     \\__\\",
    }

    dashboard.section.buttons.val = {
      -- 실제 사용하는 키맵과 일치하도록 표시/동작 정렬
      dashboard.button('n', '  >  New File', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC e', '  >  File Explorer', ':Neotree toggle <CR>'), -- <leader>e
      dashboard.button('SPC f f', '  >  Find Files', ':Telescope find_files <CR>'), -- <leader>ff
      dashboard.button('SPC f g', '  >  Live Grep', ':Telescope live_grep <CR>'), -- <leader>fg
      dashboard.button('SPC f b', '  >  Buffers', ':Telescope buffers <CR>'), -- <leader>fb
      dashboard.button('SPC f h', '  >  Help', ':Telescope help_tags <CR>'), -- <leader>fh
      dashboard.button('SPC d b', '  >  DB Toggle', ':lua require("dbee").toggle()<CR>'), -- <leader>db
      dashboard.button('r', '  >  Recent', ':Telescope oldfiles <CR>'),
      dashboard.button('q', '  >  Quit', ':qa<CR>'),
    }

    alpha.setup(dashboard.opts)
  end
}
