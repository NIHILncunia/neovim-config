local mapKey = require('utils.keyMapper').mapKey

return {
  {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function()
      require("dbee").install()
    end,
    config = function()
      -- 설정 시작
      require("dbee").setup({
        sources = {
          -- nvim 진입 후 UI에서 연결을 추가/편집하도록 허용
          require("dbee.sources").FileSource:new(
            vim.fn.stdpath("cache") .. "/dbee/persistence.json"
          ),
        },
      })

      -- UI 열기/닫기
      mapKey("<leader>db", function()
        require("dbee").toggle()
      end, "n", "DB: Toggle UI")

      -- 비주얼 선택 쿼리 실행
      mapKey("<leader>de", function()
        local _, ls, cs = table.unpack(vim.fn.getpos("'<"))
        local _, le, ce = table.unpack(vim.fn.getpos("'>"))
        local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)
        if #lines > 0 then
          lines[#lines] = string.sub(lines[#lines], 1, ce)
          lines[1] = string.sub(lines[1], cs)
          require("dbee").execute(table.concat(lines, "\n"))
        end
      end, "v", "DB: Execute selection")

      -- 버퍼 전체 쿼리 실행
      mapKey("<leader>de", function()
        local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
        require("dbee").execute(content)
      end, "n", "DB: Execute buffer")

      -- 결과 페이지 네비게이션
      mapKey("]d", function()
        require("dbee").api.ui.result_page_next()
      end, "n", "DB: Result next")
      mapKey("[d", function()
        require("dbee").api.ui.result_page_prev()
      end, "n", "DB: Result prev")
      mapKey("g]d", function()
        require("dbee").api.ui.result_page_last()
      end, "n", "DB: Result last")
      mapKey("g[d", function()
        require("dbee").api.ui.result_page_first()
      end, "n", "DB: Result first")
    end,
  },
}
