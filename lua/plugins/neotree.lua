return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    opts = {
      source_selector = {
        winbar = true,      -- 상단에 탭 선택기 표시
        statusline = false, -- 상태바에는 표시하지 않음
        close_if_last_window = false,
        enable_git_status = true,
        show_scrolled_off_parent_node = false,
        sources = {
          { source = "filesystem", display_name = "Files" },
          { source = "buffers",    display_name = "Buffers" },
          { source = "git_status", display_name = "Git" },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,         -- 숨김 파일들을 기본적으로 표시
          hide_dotfiles = false,  -- .으로 시작하는 파일들 숨기지 않음
          hide_gitignored = true, -- gitignore된 파일들은 여전히 숨김
        },
        git_status = {
          symbols = {
            -- git 상태를 나타내는 심볼들
            added     = "✚",
            modified  = "✹",
            deleted   = "✖",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "!",
          },
        },
      },
      buffers = {
        show_unloaded = true,
        group_empty_dirs = true,
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"]  = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
    },
    init = function()
      -- Alpha 대시보드를 방해하지 않도록:
      -- 인자 없이 시작하면 neo-tree를 자동으로 열지 않음.
      -- 디렉터리 인자로 시작할 때만 자동 오픈.
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            return
          end

          local arg0 = vim.fn.argv(0)
          if arg0 ~= nil and vim.fn.isdirectory(arg0) == 1 then
            require("neo-tree.command").execute({ source = "filesystem", position = "left" })
          end
        end,
      })
    end,
  }
}
