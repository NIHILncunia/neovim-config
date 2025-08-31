local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'stevearc/aerial.nvim',
    opts = { layout = { default_direction = 'prefer_right' } },
    config = function(_, opts)
      require('aerial').setup(opts)
      mapKey('<leader>so', ':AerialToggle!<CR>', 'n', 'Symbols: Aerial toggle')
    end,
  },
}
