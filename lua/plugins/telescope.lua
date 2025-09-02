local mapKey = require('utils.keyMapper').mapKey

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')

      mapKey("<leader>ff", builtin.find_files, "n", "Telescope: 파일 찾기")
      mapKey("<leader>fg", builtin.live_grep, "n", "Telescope: 라이브 검색")

      -- 버퍼 관리 기능 개선
      mapKey("<leader>fb", function()
        builtin.buffers({
          attach_mappings = function(prompt_bufnr, map)
            local actions = require('telescope.actions')

            -- 개별 버퍼 삭제 (기본 <M-d> 외에 <C-d>도 추가)
            map('i', '<C-d>', actions.delete_buffer)
            map('n', '<C-d>', actions.delete_buffer)
            map('n', 'dd', actions.delete_buffer)

            return true -- 기본 매핑 유지
          end
        })
      end, "n", "Telescope: 버퍼 목록 (삭제 기능 포함)")

      mapKey("<leader>fh", builtin.help_tags, "n", "Telescope: 도움말 찾기")

      -- Git 관련 키맵 추가
      mapKey("<leader>gl", builtin.git_commits, "n", "Git: 커밋 로그")
      mapKey("<leader>gL", builtin.git_bcommits, "n", "Git: 버퍼 커밋 로그")
      mapKey("<leader>gB", builtin.git_branches, "n", "Git: 브랜치 목록")
      mapKey("<leader>gs", builtin.git_status, "n", "Git: 상태")

      -- 빠른 커밋 확인 키맵 (플로팅 윈도우)
      mapKey("<leader>gS", function()
        -- Git show 결과를 가져오기
        local result = vim.fn.systemlist("git show HEAD")
        if vim.v.shell_error ~= 0 then
          vim.notify("Git 명령어 실행 실패", vim.log.levels.ERROR)
          return
        end

        -- 플로팅 윈도우 생성
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
        vim.api.nvim_buf_set_option(buf, 'filetype', 'git')
        vim.api.nvim_buf_set_option(buf, 'modifiable', false)

        -- 윈도우 크기 계산 (정중앙 배치)
        local width = math.floor(vim.o.columns * 0.9)
        local height = math.floor(vim.o.lines * 0.8)
        local row = math.floor((vim.o.lines - height) / 2) - 1 -- 상태바 고려하여 조정
        local col = math.floor((vim.o.columns - width) / 2)

        -- 플로팅 윈도우 열기
        local win = vim.api.nvim_open_win(buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          row = row,
          col = col,
          style = 'minimal',
          border = 'rounded',
          title = ' Git Show HEAD ',
          title_pos = 'center',
        })

        -- 키맵 설정 (q로 닫기)
        vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', { noremap = true, silent = true })
      end, "n", "Git: 최근 커밋 변경사항 (플로팅)")

      mapKey("<leader>gH", function()
        local commit = vim.fn.input("커밋 해시: ")
        if commit == "" then return end

        -- Git show 결과를 가져오기
        local result = vim.fn.systemlist("git show " .. commit)
        if vim.v.shell_error ~= 0 then
          vim.notify("유효하지 않은 커밋 해시: " .. commit, vim.log.levels.ERROR)
          return
        end

        -- 플로팅 윈도우 생성
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
        vim.api.nvim_buf_set_option(buf, 'filetype', 'git')
        vim.api.nvim_buf_set_option(buf, 'modifiable', false)

        -- 윈도우 크기 계산 (정중앙 배치)
        local width = math.floor(vim.o.columns * 0.9)
        local height = math.floor(vim.o.lines * 0.8)
        local row = math.floor((vim.o.lines - height) / 2) - 1 -- 상태바 고려하여 조정
        local col = math.floor((vim.o.columns - width) / 2)

        -- 플로팅 윈도우 열기
        local win = vim.api.nvim_open_win(buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          row = row,
          col = col,
          style = 'minimal',
          border = 'rounded',
          title = ' Git Show ' .. commit:sub(1, 8) .. ' ',
          title_pos = 'center',
        })

        -- 키맵 설정 (q로 닫기)
        vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', { noremap = true, silent = true })
      end, "n", "Git: 특정 커밋 변경사항 (플로팅)")
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
