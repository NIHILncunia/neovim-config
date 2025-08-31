return {
  -- Tailwind 클래스 컬러 미리보기 (nvim-cmp colorizer)
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  -- Tailwind 유틸(클래스 하이라이트/정렬 등)
  {
    "luckasRanarison/tailwind-tools.nvim",
    opts = {},
  },
}
