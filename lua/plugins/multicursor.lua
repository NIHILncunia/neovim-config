local mapKey = require('utils.keyMapper').mapKey

return {
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    config = function()
      -- lazy.nvim이 opts를 자동으로 setup에 전달하므로 별도로 setup 호출 불필요
      local multicursors = require("multicursors")

      -- 멀티 커서 시작 (현재 단어 선택)
      mapKey("<C-n>", function()
        multicursors.start()
      end, "n", "멀티 커서: 현재 단어 선택")

      -- Visual 모드에서 멀티 커서 시작
      mapKey("<C-n>", function()
        multicursors.start()
      end, "v", "멀티 커서: 선택 영역으로 시작")

      -- 같은 단어 모두 선택 (현재 단어 기준)
      mapKey("<leader>mn", function()
        multicursors.select_all_words()
      end, "n", "멀티 커서: 같은 단어 모두 선택")

      -- Visual 모드에서 선택한 텍스트와 같은 것 모두 선택
      mapKey("<leader>mn", function()
        multicursors.select_all_words()
      end, "v", "멀티 커서: 선택한 텍스트와 같은 것 모두 선택")

      -- 패턴으로 멀티 커서 시작
      mapKey("<leader>mp", function()
        vim.cmd("MCpattern")
      end, "n", "멀티 커서: 패턴으로 시작")

      -- Visual 모드에서 패턴으로 멀티 커서 시작
      mapKey("<leader>mp", function()
        vim.cmd("MCvisualPattern")
      end, "v", "멀티 커서: 선택 영역 패턴으로 시작")

      -- 커서 아래 단어로 멀티 커서 시작
      mapKey("<leader>mu", function()
        vim.cmd("MCunderCursor")
      end, "n", "멀티 커서: 커서 아래 단어로 시작")

      -- 멀티 커서 클리어
      mapKey("<leader>mc", function()
        multicursors.clear()
      end, "n", "멀티 커서: 클리어")
    end,
  },
}
