return {
  {
    dir = "~/repos/modechar.nvim",
    name = "modechar",
    module = "modechar",
    ---@type ModeCharOptions
    opts = {
      chars = {
        gutter = { "▌", highlight = "ModeCharGutter", clear_hl = true, buftype = { "", "nofile" } },
        arrow = { "▶", highlight = "Modahl" },
      },
      debug = false,
    },
    config = function(_, opts)
      require("modechar").setup(opts)
    end,
  },
  {
    dir = "~/repos/modechar.nvim/lua/modahl/",
    name = "modahl",
    module = "modahl",
    event = "VimEnter",
    dependencies = {
      { "nvim-lualine/lualine.nvim", optional = true },
    },
    ---@type ModahlOptions
    opts = {
      hl_groups = {
        {
          "ModeCharGutter",
          adapter = "lualine-invert", -- Add lualine as a dependency to use this adapter
        },
        {
          -- Use the default "Modahl" group
          adapter = "lualine", -- Add lualine as a dependency to use this adapter
          links = {
            "CursorColumn",
          },
        },
      },
      debug = false,
    },
    config = function(_, opts)
      require("modahl").setup(opts)
    end,
  },
}
