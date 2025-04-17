return {
  dir = "~/repos/guttermode.nvim", -- ✅ Local path to your plugin repo
  name = "guttermode.nvim",
  event = "VeryLazy",
  opts = {
    symbol = "█", -- "▌", -- "▍", -- "▎" -- "▶", -- "│",
    unfocused_symbol = "│",
    debug = false,
  },
  config = function(_, opts)
    require("guttermode").setup(opts)
  end,
}
