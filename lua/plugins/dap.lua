local mapKey = require('utils.keyMapper').mapKey

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'mxsdev/nvim-dap-vscode-js',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- DAP UI
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

      -- mason-nvim-dap: 최신 JS 디버거만 관리
      require('mason-nvim-dap').setup({
        ensure_installed = { 'js' }, -- node2(legacy) 제거
        automatic_installation = true,
      })

      -- nvim-dap-vscode-js: 경로 대신 래퍼 커맨드 사용
      require('dap-vscode-js').setup({
        debugger_cmd = { 'js-debug-adapter' }, -- mason이 제공하는 실행 파일
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      })

      -- 안정성을 위해 pwa-node 어댑터를 server 타입으로 명시 등록
      -- (${port}를 nvim-dap이 자동 할당 → 동일 포트를 어댑터 실행에 전달)
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = '127.0.0.1',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }

      -- JS/TS 공통 설정
      local languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
      for _, language in ipairs(languages) do
        dap.configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach (9229)',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
        }
      end

      -- 키맵
      mapKey('<F5>', dap.continue, 'n', 'DAP: Continue')
      mapKey('<F10>', dap.step_over, 'n', 'DAP: Step Over')
      mapKey('<F11>', dap.step_into, 'n', 'DAP: Step Into')
      mapKey('<F12>', dap.step_out, 'n', 'DAP: Step Out')
      mapKey('<F9>', dap.toggle_breakpoint, 'n', 'DAP: Toggle Breakpoint')
      mapKey('<leader>dB', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, 'n', 'DAP: Conditional BP')
      mapKey('<leader>du', dapui.toggle, 'n', 'DAP: Toggle UI')
    end,
  },
}
