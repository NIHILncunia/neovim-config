return {
  {
    'nanotee/sqls.nvim', -- SQL Language Server
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- SQL 파일에서 자동 포맷팅 활성화
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'sql',
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      })
    end,
  },
  {
    'b4winckler/vim-angry', -- SQL 포맷팅
    ft = 'sql',
  },
}
