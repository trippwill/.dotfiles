return {
  {
    "zbirenbaum/copilot.lua",
    --tag = "d661d65b4cab20a5c164f6d9081d91ed324fe4d8",
    --pin = true,
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
        preset = "super-tab",
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
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     api_key_cmd = "pass api/openai",
  --   },
  --   keys = {
  --     { "<leader>ag", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
  --     { "<leader>aG", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT Act As" },
  --     -- { "<leader>aR", "<cmd>ChatGPTRun<cr>", desc = "ChatGPT Run" },
  --     { "<leader>ae", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "ChatGPT Edit" },
  --     { "<leader>art", "<cmd>ChatGPTRun add_tests<cr>", desc = "ChatGPT Add Tests" },
  --     { "<leader>aro", "<cmd>ChatGPTRun optimize_code<cr>", desc = "ChatGPT Optimize code" },
  --     { "<leader>arx", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "ChatGPT Fix Bugs" },
  --   },
  --   config = function(opts)
  --     require("chatgpt").setup(opts)
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim", -- optional
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
}
