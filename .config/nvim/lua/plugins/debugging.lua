return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "tpope/vim-fugitive",
    "folke/trouble.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()
    require("dap-go").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    local wk = require("which-key")
    wk.add({
      {
        "<Leader>dt",
        mode = "n",
        dap.toggle_breakpoint,
        desc = "Toggle Breakpoint",
      },
      {
        "<Leader>dc",
        mode = "n",
        dap.continue,
        desc = "Continue Execution",
      },
    })
  end,
}
