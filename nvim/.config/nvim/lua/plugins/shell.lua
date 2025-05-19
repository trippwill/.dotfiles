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
    'folke/noice.nvim',
    opts = {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
      },
    },
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

      local bufferline_mappings = {}

      for i = 1, 9 do
        table.insert(bufferline_mappings, {
          '<leader>' .. i,
          function()
            return require('bufferline').go_to(i, true)
          end,
          desc = 'Go to buffer ' .. i,
        })
      end

      table.insert(bufferline_mappings, {
        '<leader>0',
        function()
          return require('bufferline').go_to(10, true)
        end,
        desc = 'Go to buffer 10',
      })

      table.insert(bufferline_mappings, {
        '<leader>$',
        function()
          return require('bufferline').go_to(-1, true)
        end,
        desc = 'Go to last buffer',
      })

      wk.add({ hidden = true, mode = 'n', bufferline_mappings })
    end,
  },
}
