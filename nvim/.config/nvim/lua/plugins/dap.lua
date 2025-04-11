return {
  -- Debug Adapter Protocol (DAP) core plugin
  {
    "mfussenegger/nvim-dap",
    -- Load this plugin when any of these keys are pressed
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Start/Continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debug: Step Into",
      },
      {
        "<M-F11>",
        function()
          require("dap").step_out()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
    },
    -- dependencies = {
    --   { -- Debug UI plugin dependency
    --     "rcarriga/nvim-dap-ui",
    --     keys = {
    --       {
    --         "<leader>du",
    --         function()
    --           require("dapui").toggle({})
    --         end,
    --         desc = "Debug: Toggle UI",
    --       },
    --     },
    --     config = function()
    --       require("dapui").setup() -- setup nvim-dap-ui with default settings
    --       local dap, dapui = require("dap"), require("dapui")
    --       -- Open the UI automatically when debugging starts, close when it ends
    --       dap.listeners.after.event_initialized["dapui_config"] = function()
    --         dapui.open({})
    --       end
    --       dap.listeners.before.event_terminated["dapui_config"] = function()
    --         dapui.close({})
    --       end
    --       dap.listeners.before.event_exited["dapui_config"] = function()
    --         dapui.close({})
    --       end
    --     end,
    --   },
    -- },
    -- config = function()
    --   -- (Optional) Additional dap configuration can go here, e.g., setup adapters or integrate with mason
    --   -- require("mason-nvim-dap").setup()  -- if using mason to install debuggers
    -- end,
  },
}
