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
            dashboard.button('n', '  >  New File', ':ene <BAR> startinsert <CR>'),
            dashboard.button('f', '  >  Find File', ':Telescope find_files <CR>'),
            dashboard.button('w', '  >  Find Word', ':Telescope live_grep <CR>'),
            dashboard.button('r', '  >  Recent', ':Telescope oldfiles <CR>'),
            dashboard.button('q', '  >  Quit', ':qa<CR>'),
        }

        alpha.setup(dashboard.opts)
    end
}
