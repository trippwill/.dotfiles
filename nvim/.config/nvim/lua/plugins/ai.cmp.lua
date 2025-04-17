return {
  {
    "zbirenbaum/copilot.lua",
    --tag = "d661d65b4cab20a5c164f6d9081d91ed324fe4d8",
    --pin = true,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<Leader>ac",
        "<cmd>CodeCompanionActions<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "Code Actions",
      },
      {
        "<Leader>aa",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "Toggle Chat",
      },
      {
        "ga",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = "v",
        noremap = true,
        silent = true,
        desc = "Add to Chat",
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      keymap = {
        preset = "enter",
      },
      signature = {
        enabled = false,
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "saghen/blink.cmp",
  --   },
  --   opts = {
  --     suggestion = {
  --       enabled = true, -- enable inline suggestions (ghost text)
  --       auto_trigger = true, -- automatically show suggestions as you type
  --       hide_during_completion = true, -- hide ghost text if a completion menu opens
  --       keymap = {
  --         accept = nil, -- we'll map <Tab> ourselves
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --       },
  --     },
  --     panel = { enabled = false }, -- disable Copilot panel if not needed
  --   },
  --   config = function(_, opts)
  --     local copilot = require("copilot")
  --     local suggestion = require("copilot.suggestion")
  --     copilot.setup(opts)
  --
  --     -- 1) Map <Esc> to dismiss Copilot suggestions without leaving Insert mode
  --     vim.keymap.set("i", "<Esc>", function()
  --       if suggestion.is_visible() then
  --         suggestion.dismiss()
  --         return "" -- remain in insert mode
  --       end
  --       -- fallback to normal <Esc>
  --       return vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
  --     end, { expr = true, silent = true })
  --
  --     -- 2) Merge <Tab>/<S-Tab> logic
  --     -- First, if Copilot suggestion is visible, accept it.
  --     -- Otherwise, if your completion plugin (blink.cmp) is visible, jump to next/prev item.
  --     -- Else fallback to normal tab.
  --     local cmp = require("blink.cmp")
  --     vim.keymap.set("i", "<Tab>", function()
  --       if suggestion.is_visible() then
  --         return suggestion.accept()
  --       elseif cmp.is_visible() then
  --         cmp.select_next()
  --         return ""
  --       else
  --         return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
  --       end
  --     end, { expr = true, noremap = true, silent = true })
  --
  --     vim.keymap.set("i", "<S-Tab>", function()
  --       if cmp.is_visible() then
  --         cmp.select_prev()
  --         return ""
  --       else
  --         return vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true)
  --       end
  --     end, { expr = true, noremap = true, silent = true })
  --   end,
  -- },
}
