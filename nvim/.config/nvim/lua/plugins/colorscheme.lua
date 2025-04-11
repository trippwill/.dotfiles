return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      dim_inactive = true,
    },
  },

  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { light = "latte", dark = "macchiato" },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "italic" },
          keywords = { "bold" },
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
    "sainnhe/sonokai",
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_style = "atlantis" -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"
      vim.g.sonokai_dim_inactive_windows = 1
      vim.g.sonokai_better_performance = 1
      -- vim.cmd.colorscheme("sonokai")
    end,
  },

  -- add everforest
  {
    "sainnhe/everforest",
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_better_performance = true
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_dim_inactive_windows = 1
      -- vim.cmd.colorscheme("everforest")
    end,
  },

  -- add edge
  {
    "sainnhe/edge",
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
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
        dimInactive = true,
        terminalColors = true,
        theme = "kanagawa",
        background = {
          dark = "dragon",
          light = "wave",
        },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = { italic = true },
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        overrides = function(colors)
          local theme = colors.theme
          local _ = colors.palette
          return {
            LazyNormal = { bg = theme.ui.bg_visual, fg = theme.ui.fg },
            MasonNormal = { bg = theme.ui.bg_visual, fg = theme.ui.fg },
          }
        end,
      })
      vim.cmd.colorscheme("kanagawa")
    end,
    build = function()
      require("kanagawa").compile()
    end,
  },
}
