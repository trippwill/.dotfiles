return {
  -- add gruvbox
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    opts = {
      dim_inactive = true,
    },
  },

  -- add catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
      require('catppuccin').setup({
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        background = { light = 'latte', dark = 'macchiato' },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = { 'italic' },
          functions = { 'italic' },
          keywords = { 'bold' },
          strings = {},
          variables = {},
          numbers = {},
          types = {},
          operators = {},
        },
      })
    end,
  },

  -- add sonokai
  {
    'sainnhe/sonokai',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_style = 'atlantis' -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_diagnostic_virtual_text = 'colored'
      vim.g.sonokai_dim_inactive_windows = 1
      vim.g.sonokai_better_performance = 1
      -- vim.cmd.colorscheme("sonokai")
    end,
  },

  -- add everforest
  {
    'sainnhe/everforest',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_better_performance = true
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_dim_inactive_windows = 1
      -- vim.cmd.colorscheme("everforest")
    end,
  },

  -- add edge
  {
    'sainnhe/edge',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.edge_enable_italic = true
      -- vim.cmd.colorscheme("edge")
    end,
  },

  -- add kanagawa
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = true,
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        theme = 'kanagawa',
        background = {
          dark = 'dragon',
          light = 'wave',
        },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { italic = false },
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        overrides = function(colors)
          local theme = colors.theme
          local palette = colors.palette
          local blink_menu = { fg = palette.fujiGray, bg = palette.waveBlue1 }
          local blink_menu_border = { fg = palette.waveBlue2, bg = palette.waveBlue1 }
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            LazyNormal = { bg = theme.ui.bg_visual, fg = theme.ui.fg },
            MasonNormal = { bg = theme.ui.bg_visual, fg = theme.ui.fg },

            BlinkCmpSignatureHelp = blink_menu,
            BlinkCmpSignatureHelpBorder = blink_menu_border,
            BlinkCmpDoc = blink_menu,
            BlinkCmpDocBorder = blink_menu_border,
            BlinkCmpMenu = blink_menu,
            BlinkCmpSignatureHelpBorderr = blink_menu_border,
          }
        end,
      })
      vim.cmd.colorscheme('kanagawa')
    end,
    build = function()
      require('kanagawa').compile()
    end,
    init = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'kanagawa',
        callback = function()
          vim.api.nvim_set_hl(0, 'StatusLine', { link = 'lualine_c_normal' })
        end,
      })
    end,
  },
}
