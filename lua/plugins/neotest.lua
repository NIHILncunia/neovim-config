local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
    },
    config = function()
      local neotest = require('neotest')

      neotest.setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = 'npm test --',
            jestConfigFile = function()
              local cwd = vim.fn.getcwd()
              if vim.fn.filereadable(cwd .. '/jest.config.ts') == 1 then return 'jest.config.ts' end
              if vim.fn.filereadable(cwd .. '/jest.config.js') == 1 then return 'jest.config.js' end
              return nil
            end,
            env = { CI = true },
            cwd = function() return vim.fn.getcwd() end,
          }),
          require('neotest-vitest')({
            vitestCommand = 'npx vitest run --reporter=verbose',
          }),
        },
        discovery = { enabled = true },
        running = { concurrent = true },
        summary = { follow = true },
      })

      -- 키맵
      mapKey('<leader>tn', function() neotest.run.run() end, 'n', 'Test: Nearest')
      mapKey('<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, 'n', 'Test: File')
      mapKey('<leader>ts', function() neotest.summary.toggle() end, 'n', 'Test: Summary')
      mapKey('<leader>to', function() neotest.output.open({ enter = true }) end, 'n', 'Test: Output')
      mapKey('<leader>tt', function() neotest.run.stop() end, 'n', 'Test: Stop')
    end,
  },
}
