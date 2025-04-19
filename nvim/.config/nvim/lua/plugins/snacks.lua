local reused = false

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            jump = { close = true }, -- close the explorer when jumping to a file
          },
        },
      },
    },
    keys = {
      {
        "<c-_>",
        function()
          Snacks.terminal(nil, {
            auto_insert = false,
            start_insert = true,
            win = {
              style = "terminal",
              position = "float",
              border = "rounded",
              width = 0.8,
              height = 0.8,
              on_win = function()
                if reused then
                  vim.cmd("startinsert")
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>i", true, false, true), "n", true)
                end
                reused = true
              end,
            },
          })
        end,
        mode = { "n" },
        desc = "Snacks: Toggle Terminal",
      },
    },
  },
}
