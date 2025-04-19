return {
  {
    "andythigpen/nvim-coverage",
    config = function()
      require("coverage").setup({
        auto_reload = true,
      })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = {
          "andythigpen/nvim-coverage", -- Added dependency
        },
      },
    },
    config = function()
      local neotest_golang_opts = { -- Specify configuration
        runner = "go",
        go_test_args = {
          "-v",
          "-race",
          "-count=1",
          "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        },
      }
      -- local dotnet_opts = {
      --   discovery_root = "solution",
      -- }
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(neotest_golang_opts),
          -- require("neotest-dotnet")(dotnet_opts),
        },
      })
    end,
  },
}
