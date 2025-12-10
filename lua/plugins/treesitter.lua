return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        -- 구문 하이라이팅 활성화
        highlight = {
          enable = true,
          -- Vue 파일에서 더 정확한 구문 하이라이팅
          additional_vim_regex_highlighting = false,
        },
        -- 자동 들여쓰기 활성화
        indent = {
          enable = true,
        },
        -- HTML/XML 태그 자동 완성
        autotag = {
          enable = true,
          filetypes = { "html", "xml", "vue", "tsx", "jsx" },
        },
        -- 설치할 파서 목록
        ensure_installed = {
          "html",
          "css",
          "javascript",
          "typescript",
          "vue",
          "json",
          "lua",
          "sql", -- SQL 파서 추가
          "java", -- Java 파서 추가
          "python", -- Python 파서 추가
        },
        -- 자동 설치 비활성화 (수동 관리)
        auto_install = false,
      })
    end,
  },
}
