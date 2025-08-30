return {
  { -- 클립보드 동기화
    "ojroques/vim-oscyank",
  },
  { -- git 명령어 확장
    'tpope/vim-fugitive',
  },
  { -- CSS 색상 하이라이팅
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  }
}
