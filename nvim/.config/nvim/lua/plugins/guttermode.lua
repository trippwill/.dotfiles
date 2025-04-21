return {
  {
    dir = "~/repos/modechar.nvim/",
    name = "modechar.nvim",
    lazy = false,
    opts = {
      chars = {
        gutter = { "▌" },
        arrow = { "▶", inverted = true },
      },
      debug = false,
    },
    config = function(_, opts)
      require("modechar").setup(opts)
    end,
  },
}
