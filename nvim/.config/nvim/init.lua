vim.g.clipboard = {
  name = "win-safe",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "win-wl-paste",
    ["*"] = "win-wl-paste",
  },
}

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
