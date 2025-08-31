local mapKey = require('utils.keyMapper').mapKey
local harpoon_utils = require('utils.harpoon_utils')

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require('harpoon')

    -- 하푼 리스트에 파일 추가
    mapKey("<leader>a", function() harpoon:list():add() end, "n", "Harpoon: 현재 파일 추가")

    -- 하푼 퀵 메뉴 토글
    mapKey("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "n", "Harpoon: 퀵 메뉴 토글")

    -- 하푼 윈도우 열기
    mapKey("<leader>fl", function() harpoon_utils.toggle_telescope(harpoon:list()) end, "n", "Harpoon: 목록(Telescope)")

    -- 이전 파일로 이동
    mapKey("<C-p>", function() harpoon:list():prev() end, "n", "Harpoon: 이전 파일")

    -- 다음 파일로 이동
    mapKey("<C-n>", function() harpoon:list():next() end, "n", "Harpoon: 다음 파일")
  end
}
