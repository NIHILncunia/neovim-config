return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- 모든 환경에서 gcc를 사용하도록 명시적 설정
      require("nvim-treesitter.install").compilers = { "gcc" }

      -- Windows에서 MinGW를 사용하도록 설정 (MSVC의 stdbool.h 문제 해결)
      if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
        -- MinGW gcc 경로 찾기 (일반적인 설치 경로 확인)
        local mingw_paths = {
          'C:\\msys64\\mingw64\\bin\\gcc.exe',
          'C:\\mingw64\\bin\\gcc.exe',
          'C:\\msys64\\ucrt64\\bin\\gcc.exe',
          'C:\\Program Files\\mingw-w64\\x86_64-8.1.0-posix-seh-rt_v6-rev0\\mingw64\\bin\\gcc.exe',
        }

        local gcc_path = nil
        for _, path in ipairs(mingw_paths) do
          if vim.fn.executable(path) == 1 then
            gcc_path = path
            break
          end
        end

        -- PATH에서 gcc 찾기
        if not gcc_path then
          local gcc_cmd = vim.fn.exepath('gcc')
          if gcc_cmd ~= '' and gcc_cmd ~= vim.NIL then
            gcc_path = gcc_cmd
          end
        end

        -- MinGW gcc를 찾았으면 CC 환경 변수 설정
        if gcc_path then
          vim.env.CC = gcc_path
          vim.notify('nvim-treesitter: MinGW gcc를 사용합니다: ' .. gcc_path, vim.log.levels.INFO)
        else
          -- MinGW가 없으면 경고 메시지
          vim.notify(
            'nvim-treesitter: MinGW를 찾을 수 없습니다. ' ..
            'vue/json 파서 컴파일이 실패할 수 있습니다.\n' ..
            'MinGW 설치: https://www.mingw-w64.org/downloads/ 또는 scoop install mingw',
            vim.log.levels.WARN
          )
        end
      end

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
          "sql",    -- SQL 파서 추가
          "java",   -- Java 파서 추가
          "python", -- Python 파서 추가
        },
        -- 자동 설치 비활성화 (수동 관리)
        auto_install = false,
      })
    end,
  },
}
