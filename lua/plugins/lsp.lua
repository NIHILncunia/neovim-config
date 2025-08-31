local mapKey = require('utils.keyMapper').mapKey

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local autoformat_filetypes = { "lua" }

    -- 저장 시 LSP 포맷(예: Lua만)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if vim.tbl_contains(autoformat_filetypes, vim.bo.filetype) then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({
                formatting_options = { tabSize = 4, insertSpaces = true },
                bufnr = args.buf,
                id = client.id
              })
            end
          })
        end
      end
    })

    -- 진단 UI
    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = { spacing = 2, source = "if_many" },
      underline = true,
      severity_sort = true,
      float = { style = 'minimal', border = 'rounded', header = '', prefix = '' },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✘',
          [vim.diagnostic.severity.WARN]  = '▲',
          [vim.diagnostic.severity.HINT]  = '⚑',
          [vim.diagnostic.severity.INFO]  = '»',
        },
      },
    })

    -- LSP 기본 capability
    local lspconfig = require('lspconfig')
    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- LSP 키매핑(버퍼 로컬)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local opts = { buffer = event.buf }
        -- K: 함수/변수에 대한 문서 정보 표시 (hover)
        mapKey("K", vim.lsp.buf.hover, "n", vim.tbl_extend('force', { desc = 'LSP: Hover' }, opts))
        -- gd: 정의로 이동 (go to definition)
        mapKey("gd", vim.lsp.buf.definition, "n", vim.tbl_extend('force', { desc = 'LSP: Go to definition' }, opts))
        -- gD: 선언으로 이동 (go to declaration)
        mapKey("gD", vim.lsp.buf.declaration, "n", vim.tbl_extend('force', { desc = 'LSP: Go to declaration' }, opts))
        -- gi: 구현으로 이동 (go to implementation)
        mapKey("gi", vim.lsp.buf.implementation, "n",
          vim.tbl_extend('force', { desc = 'LSP: Go to implementation' }, opts))
        -- go: 타입 정의로 이동 (go to type definition)
        mapKey("go", vim.lsp.buf.type_definition, "n", vim.tbl_extend('force', { desc = 'LSP: Go to type' }, opts))
        -- gr: 참조 찾기 (find references)
        mapKey("gr", vim.lsp.buf.references, "n", vim.tbl_extend('force', { desc = 'LSP: References' }, opts))
        -- gs: 함수 시그니처 도움말 표시 (signature help)
        mapKey("gs", vim.lsp.buf.signature_help, "n", vim.tbl_extend('force', { desc = 'LSP: Signature help' }, opts))
        -- gl: 진단 정보를 플로팅 창으로 표시 (diagnostic float)
        mapKey("gl", vim.diagnostic.open_float, "n", vim.tbl_extend('force', { desc = 'LSP: Show diagnostics' }, opts))
        -- F2: 심볼 이름 변경 (rename symbol)
        mapKey("<F2>", vim.lsp.buf.rename, "n", vim.tbl_extend('force', { desc = 'LSP: Rename symbol' }, opts))
        -- F3: 코드 포맷팅 (format code)
        mapKey("<F3>", function() vim.lsp.buf.format({ async = true }) end, "n",
          vim.tbl_extend('force', { desc = 'LSP: Format' }, opts))
        -- <leader>ca: 코드 액션 실행 (code actions)
        mapKey("<leader>ca", vim.lsp.buf.code_action, "n", vim.tbl_extend('force', { desc = 'LSP: Code action' }, opts))
      end,
    })

    -- Mason / mason-lspconfig (v2)
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        "tailwindcss",
        "lua_ls",
        "intelephense",
        "ts_ls", -- TypeScript LSP
        "eslint",
        "html",
        "cssls",
        "vue_ls", -- Volar가 lspconfig에서 vue_ls로 리네임됨
        "jsonls",
        "sqlls",  -- SQL Language Server
        "yamlls",
        "emmet_ls",
      },
      -- v2에서는 handlers 제거됨 (직접 lspconfig.*.setup 사용)
    })

    -- ===== Mason v2: @vue/typescript-plugin 경로 계산 (get_install_path 제거 대응) =====
    -- 우선 $MASON를 사용하고, 없으면 stdpath('data')/mason으로 폴백
    local function vue_language_server_path()
      local mason_root = vim.fn.expand('$MASON')
      if mason_root == '' then
        mason_root = vim.fn.stdpath('data') .. '/mason'
      end
      return mason_root .. '/packages/vue-language-server/node_modules/@vue/language-server'
    end
    -- Vue 위키 권장: plugin location은 '@vue/language-server' 경로 자체를 전달
    -- (Mason v2 경로 사용법 안내) :contentReference[oaicite:3]{index=3}
    local vue_ts_plugin_loc = vue_language_server_path()

    -- ===== 개별 서버 설정 =====

    -- CSS/SCSS
    lspconfig.cssls.setup({
      settings = {
        css  = { validate = true },
        scss = { validate = true },
        less = { validate = true },
        -- Tailwind @apply 경고 억제 시:
        -- lint = { unknownAtRules = 'ignore' },
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
          workspace = { library = { vim.env.VIMRUNTIME } },
        },
      },
    })

    -- Emmet LS (HTML/CSS/React)
    lspconfig.emmet_ls.setup({
      filetypes = { 'html', 'css', 'scss', 'sass', 'javascriptreact', 'typescriptreact' },
    })

    -- TailwindCSS (유틸 클래스 인식 강화)
    lspconfig.tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            -- Lua 이스케이프를 피하기 위해 장문자열 사용
            classRegex = {
              { [[tw`([^`]*)`]],  [[tw\("([^"]*)"\)]] },
              { [[cn\(([^)]*)\)]] },
            },
          },
        },
      },
    })

    -- JSON/YAML SchemaStore 연동
    local has_s, schemastore = pcall(require, 'schemastore')
    if has_s then
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
          },
        },
      })
      if lspconfig.yamlls then
        lspconfig.yamlls.setup({
          settings = { yaml = { schemas = schemastore.yaml.schemas() } },
        })
      end
    end

    -- ESLint: 저장 시 Fix (공식 LSP executeCommand 사용)
    -- 참고: eslint.applyAllFixes via workspace/executeCommand
    -- lspconfig 최신 설정과 VSCode ESLint의 codeActionsOnSave(source.fixAll.eslint)에 해당
    -- refs: nvim-lspconfig eslint config, VSCode ESLint docs
    lspconfig.eslint.setup({
      settings = { workingDirectory = { mode = "auto" } },
      flags = { debounce_text_changes = 150 },
      on_attach = function(client, bufnr)
        local aug = vim.api.nvim_create_augroup("EslintFixOnSave", { clear = false })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = aug,
          buffer = bufnr,
          callback = function()
            local version = nil
            if vim.lsp and vim.lsp.util and vim.lsp.util.buf_versions then
              version = vim.lsp.util.buf_versions[bufnr]
            end
            client.request(
              'workspace/executeCommand',
              {
                command = 'eslint.applyAllFixes',
                arguments = {
                  {
                    uri = vim.uri_from_bufnr(bufnr),
                    version = version,
                  },
                },
              },
              function() end,
              bufnr
            )
          end,
        })
      end,
    })

    -- Vue 하이브리드: vue_ls + ts_ls(+ @vue/typescript-plugin)
    lspconfig.vue_ls.setup({}) -- 템플릿/스타일 등 SFC 전반

    lspconfig.ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_ts_plugin_loc, -- Mason v2 경로
            languages = { 'vue' },
            -- configNamespace = 'typescript', -- 필요 시 활성화
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
    })
    -- (원하시면 vtsls로 교체 가능합니다)

    -- nvim-cmp
    local cmp = require('cmp')
    cmp.setup.filetype({ 'css', 'scss', 'less' }, {
      sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'buffer' } }),
    })

    require('luasnip.loaders.from_vscode').lazy_load()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

    cmp.setup({
      preselect = 'item',
      completion = { completeopt = 'menu,menuone,noinsert' },
      window = { documentation = cmp.config.window.bordered() },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
          local n = entry.source.name
          item.menu = (n == 'nvim_lsp') and '[LSP]' or string.format('[%s]', n)
          return item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>']    = cmp.mapping.confirm({ select = false }),
        ['<C-f>']   = cmp.mapping.scroll_docs(5),
        ['<C-u>']   = cmp.mapping.scroll_docs(-5),
        ['<C-e>']   = cmp.mapping(function() if cmp.visible() then cmp.abort() else cmp.complete() end end),
        ['<Tab>']   = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1
          if cmp.visible() then
            cmp.select_next_item({ behavior = 'select' })
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<C-d>']   = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
        end, { 'i', 's' }),
        ['<C-b>']   = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
        end, { 'i', 's' }),
      }),
    })
  end
}
