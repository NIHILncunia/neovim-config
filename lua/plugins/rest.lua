local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'rest-nvim/rest.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'http' },
    opts = {
      request = { jump_to_request = true },
      result = { split_horizontal = false, behavior = { show_info = true, show_headers = false } },
    },
    config = function(_, opts)
      require('rest-nvim').setup(opts)
      mapKey('<leader>rr', function() require('rest-nvim').run() end, 'n', { desc = 'REST: Run', buffer = 0 })
      mapKey('<leader>rl', function() require('rest-nvim').last() end, 'n', { desc = 'REST: Run last', buffer = 0 })
      mapKey('<leader>ro', function() require('rest-nvim').open() end, 'n', { desc = 'REST: Open result', buffer = 0 })
    end,
  },
}
