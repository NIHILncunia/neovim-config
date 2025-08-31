local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { open_mapping = [[<c-\>]], direction = 'float' },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      mapKey('<leader>ot', ':ToggleTerm<CR>', 'n', 'Terminal: Toggle')
    end,
  },
}
