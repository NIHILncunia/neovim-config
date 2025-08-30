return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    },
    config = function()
      -- 코드 폴딩 관련 옵션 설정
      -- foldcolumn: 폴딩 표시 열(1로 설정하여 항상 표시)
      vim.o.foldcolumn = '0'
      -- foldlevel: 기본 폴딩 레벨(99로 설정하여 기본적으로 모두 펼침)
      vim.o.foldlevel = 99
      -- foldlevelstart: Neovim 시작 시 폴딩 레벨(99로 설정하여 모두 펼침)
      vim.o.foldlevelstart = 99
      -- foldenable: 폴딩 활성화 여부(true로 설정하여 폴딩 기능 사용)
      vim.o.foldenable = true

      -- Neovim은 foldingRange를 기본 capabilities에 포함하지 않으므로 수동 추가 필요
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
      local language_servers = vim.lsp.get_clients()
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
          capabilities = capabilities
        })
      end
      require('ufo').setup()
    end
  }
}
