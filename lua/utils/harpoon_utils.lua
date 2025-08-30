-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
  -- telescope 모듈을 함수 호출 시점에 require
  local conf = require('telescope.config').values
  local themes = require('telescope.themes')

  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  local opts = themes.get_ivy({
    prompt_title = "Working List"
  })

  require("telescope.pickers").new(opts, {
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end

return {
  toggle_telescope = toggle_telescope
}
