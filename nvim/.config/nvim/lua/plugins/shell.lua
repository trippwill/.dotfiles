return {
  {
    'trippwill/rws.nvim',
    dev = true,
    ---@module 'rws'
    ---@type RwsOptions
    opts = {
      debug = false,
      allow_current_win = false,
    },
  },
  {
    'trippwill/swapdiff.nvim',
    dev = true,
    ---@module 'swapdiff'
    ---@type SwapDiffConfig
    opts = {
      prompt_config = {
        style = 'Interactive', -- 'Interactive' or 'Notify' or 'None'
        once = true,
      },
      log_level = vim.log.levels.TRACE,
    },
  },
  {
    'folke/noice.nvim',
    -- keep your existing options
    opts = function(_, opts)
      opts = opts or {}
      opts.lsp = opts.lsp or {}
      opts.lsp.signature = { auto_open = { enabled = false } }

      opts.presets = vim.tbl_deep_extend('force', opts.presets or {}, {
        command_palette = true,
        long_message_to_split = true,
        bottom_search = true,
        inc_rename = false,
        lsp_doc_border = true,
      })

      return opts
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    opts = {
      options = {
        themable = true,
        numbers = 'ordinal',
        indicator = {
          style = 'underline',
        },
        separator_style = 'slope',
        groups = {
          items = {
            require('bufferline.groups').builtin.pinned:with({ icon = '󰐃 ' }),
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)

      local wk = require('which-key')
      local go_to = require('swapdiff.bufferline').go_to
      local bufferline_mappings = {}

      for i = 1, 9 do
        table.insert(bufferline_mappings, {
          '<leader>' .. i,
          function()
            go_to(i, true)
          end,
          desc = 'Go to buffer ' .. i,
        })
      end

      table.insert(bufferline_mappings, {
        '<leader>0',
        function()
          go_to(10, true)
        end,
        desc = 'Go to buffer 10',
      })

      table.insert(bufferline_mappings, {
        '<leader>$',
        function()
          go_to(-1, true)
        end,
        desc = 'Go to last buffer',
      })

      wk.add({ hidden = true, mode = 'n', bufferline_mappings })
    end,
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end,
  },
  {
    'nvim-mini/mini.align',
    opts = {
      mappings = {
        start = 'gt',
        start_with_preview = 'gT',
      },
    },
  },
  {
    'Kicamon/markdown-table-mode.nvim',
    config = function()
      require('markdown-table-mode').setup({
        filetype = {
          '*.md',
        },
        options = {
          insert = true, -- when typing "|"
          insert_leave = true, -- when leaving insert
          pad_separator_line = true, -- add space in separator line
          alig_style = 'default', -- default, left, center, right
        },
      })
    end,
  },
}
