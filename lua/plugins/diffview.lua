local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      mapKey('<leader>gd', ':DiffviewOpen<CR>', 'n', 'Git: Diffview open')
      mapKey('<leader>gD', ':DiffviewClose<CR>', 'n', 'Git: Diffview close')
      mapKey('<leader>gh', ':DiffviewFileHistory %<CR>', 'n', 'Git: File history')
    end,
  },
}
