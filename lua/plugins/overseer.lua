local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'stevearc/overseer.nvim',
    opts = {},
    config = function(_, opts)
      local overseer = require('overseer')
      overseer.setup(opts)

      -- package.json 스크립트 탐색기
      overseer.register_template({
        name = 'npm run (package.json)',
        builder = function()
          return {
            cmd = { 'npm' },
            args = { 'run' },
            components = { 'default' },
          }
        end,
      })

      mapKey('<leader>or', function() overseer.run_template() end, 'n', 'Overseer: Run template')
      mapKey('<leader>oo', function() overseer.toggle() end, 'n', 'Overseer: Toggle UI')
      mapKey('<leader>ol', function() overseer.load_tasks() end, 'n', 'Overseer: Load tasks')
    end,
  },
}
