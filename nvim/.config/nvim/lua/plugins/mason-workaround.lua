return {
  -- { 'Hoffs/omnisharp-extended-lsp.nvim', lazy = true },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'c_sharp' } },
  },
  {
    'mason-org/mason.nvim',
    opts = {
      ensure_installed = { 'netcoredbg' },
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    },
  },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- filewatching = 'roslyn',
    },
    config = function(_, opts)
      require('roslyn').setup(opts)
      -- Register the Roslyn server with Neovim's LSP client
      vim.lsp.config('roslyn', {
        -- Roslyn is pure LSP: no omnisharp_extended hacks needed
        keys = {
          { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
          { 'gr', vim.lsp.buf.references, desc = 'Goto References' },
          { 'gi', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
          { 'gD', vim.lsp.buf.type_definition, desc = 'Goto Type Definition' },
          { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename Symbol' },
          { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
        },

        on_attach = function(client, bufnr)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          -- Drop malformed Roslyn $/progress (nil token); stringify non-strings.
          local default = vim.lsp.handlers['$/progress']
          if type(default) == 'function' then
            client.handlers = client.handlers or {}
            client.handlers['$/progress'] = function(err, params, ctx, ...)
              if not params or params.token == nil then
                -- optional debug:
                -- vim.schedule(function() vim.notify("roslyn: dropped $/progress without token", vim.log.levels.TRACE) end)
                return
              end
              if type(params.token) ~= 'string' then
                params.token = tostring(params.token) -- mutate in place
              end
              return default(err, params, ctx, ...)
            end
          end
        end,

        -- Roslyn LSP server settings (these names come from Roslyn, not OmniSharp)
        settings = {
          ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_parameters = true,
            csharp_enable_inlay_hints_for_literal_parameters = true,
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_indexer_parameters = true,
            csharp_enable_inlay_hints_for_other_parameters = true,
            csharp_enable_inlay_hints_for_return_types = true,
            csharp_enable_inlay_hints_for_struct = false,
            csharp_enable_inlay_hints_for_types = false,
          },
          ['csharp|code_lens'] = {
            dotnet_enable_references_code_lens = false,
          },
          ['csharp|background_analysis'] = {
            dotnet_analyzer_diagnostics_scope = 'fullSolution',
            dotnet_compiler_diagnostics_scope = 'fullSolution',
          },
          ['csharp|completion'] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ['csharp|formatting'] = {
            dotnet_organize_imports_on_format = true,
          },
        },
      })
    end,
  },
  {
    --   'neovim/nvim-lspconfig',
    --   opts = {
    --     servers = {
    --       omnisharp = {
    --         handlers = {
    --           ['textDocument/definition'] = function(...)
    --             return require('omnisharp_extended').handler(...)
    --           end,
    --         },
    --         keys = {
    --           {
    --             'gd',
    --             function()
    --               require('omnisharp_extended').lsp_definitions()
    --             end,
    --             desc = 'Goto Definition',
    --           },
    --         },
    --         enable_roslyn_analyzers = true,
    --         organize_imports_on_format = true,
    --         enable_import_completion = true,
    --         -- Force the correct binary name from Mason
    --         cmd = {
    --           'OmniSharp',
    --           '-z',
    --           '--hostPID',
    --           tostring(vim.fn.getpid()),
    --           'DotNet:enablePackageRestore=false',
    --           '--encoding',
    --           'utf-8',
    --           '--languageserver',
    --         },
    --         settings = {
    --           FormattingOptions = {
    --             EnableEditorConfigSupport = true, -- respect .editorconfig
    --             OrganizeImports = true, -- auto-fix imports on format
    --           },
    --           RoslynExtensionsOptions = {
    --             EnableAnalyzersSupport = true, -- run analyzers (rulesets, StyleCop, etc.)
    --             EnableImportCompletion = true, -- completion for unimported types
    --             EnableDecompilationSupport = true, -- peek into external assemblies
    --             EnableInlayHintsForParameters = true,
    --             EnableInlayHintsForLiteralParameters = true,
    --             EnableInlayHintsForImplicitObjectCreation = true,
    --             EnableInlayHintsForIndexerParameters = true,
    --             EnableInlayHintsForOtherParameters = true,
    --             EnableInlayHintsForReturnTypes = true,
    --             EnableInlayHintsForStruct = false,
    --             EnableInlayHintsForTypes = false,
    --           },
    --           Sdk = {
    --             IncludePrereleases = true, -- use preview SDKs (useful with mise)
    --           },
    --           MsBuild = {
    --             LoadProjectsOnDemand = false, -- speed up large repos
    --           },
    --           -- ImplementTypeOptions = {
    --           --   InsertionBehavior = 'WithOtherMembersOfTheSameKind',
    --           -- },
    --           RenameOptions = {
    --             RenameInComments = true,
    --             RenameInStrings = true,
    --           },
    --         },
    --       },
    --     },
    --   },
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require('dap')
      if not dap.adapters['netcoredbg'] then
        require('dap').adapters['netcoredbg'] = {
          type = 'executable',
          command = vim.fn.exepath('netcoredbg'),
          args = { '--interpreter=vscode' },
          options = {
            detached = false,
          },
        }
      end
      for _, lang in ipairs({ 'cs', 'fsharp', 'vb' }) do
        if not dap.configurations[lang] then
          dap.configurations[lang] = {
            {
              type = 'netcoredbg',
              name = 'Launch file',
              request = 'launch',
              ---@diagnostic disable-next-line: redundant-parameter
              program = function()
                return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = '${workspaceFolder}',
            },
          }
        end
      end
    end,
  },
  { 'nsidorenco/neotest-vstest' },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nsidorenco/neotest-vstest',
    },
    opts = {
      adapters = {
        ['neotest-vstest'] = {
          dap_settings = {
            type = 'netcoredbg',
          },
        },
      },
    },
  },
}
