return {
  dir = "~/repos/guttermode.nvim", -- ✅ Local path to your plugin repo
  name = "guttermode.nvim",
  event = "VeryLazy",
  opts = {
    follow_cursor = false,
    sign_char = "█", -- "▌", -- "▍", -- "▎" -- "▶", -- "│",
    sign_priority = 1000,
    debounce_ms = 75,
    debug = false,
  },
  config = function(_, opts)
    require("guttermode").setup(opts)
  end,
}
