local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = true,
    },
    config = function(_, opts)
      local gs = require('gitsigns')
      gs.setup(opts)

      -- 이동
      mapKey(']h', gs.next_hunk, 'n', 'Git: Next hunk')
      mapKey('[h', gs.prev_hunk, 'n', 'Git: Prev hunk')
      -- 조작
      mapKey('<leader>hs', gs.stage_hunk, 'n', 'Git: Stage hunk')
      mapKey('<leader>hr', gs.reset_hunk, 'n', 'Git: Reset hunk')
      mapKey('<leader>hp', gs.preview_hunk, 'n', 'Git: Preview hunk')
      mapKey('<leader>hu', gs.undo_stage_hunk, 'n', 'Git: Undo stage hunk')
      mapKey('<leader>gb', gs.blame_line, 'n', 'Git: Blame line')
    end,
  },
}
