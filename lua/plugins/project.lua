local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup({
        patterns = { '.git', 'package.json', 'pyproject.toml', 'go.mod', 'composer.json' },
        -- lsp 탐지는 project.nvim 내부에서 vim.lsp.buf_get_clients()를 사용하여
        -- Nvim 0.12에서 제거 예정 경고가 발생합니다. 경고 억제를 위해 pattern만 사용합니다.
        detection_methods = { 'pattern' },
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'ahmedkhalf/project.nvim' },
    config = function()
      pcall(function() require('telescope').load_extension('projects') end)
      mapKey('<leader>fp', ':Telescope projects<CR>', 'n', 'Find: Projects')
    end,
  },
}
