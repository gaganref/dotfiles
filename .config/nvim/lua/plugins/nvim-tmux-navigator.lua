return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require('nvim-tmux-navigation').setup({})

    local wk = require("which-key")
    wk.add({
      {
        "<C-h>",
        mode = "n",
        "<Cmd>NvimTmuxNavigateLeft<CR>",
        desc = "nvim-tmux left",
      },
      {
        "<C-j>",
        mode = "n",
        "<Cmd>NvimTmuxNavigateDown<CR>",
        desc = "nvim-tmux down",
      },

      {
        "<C-k>",
        mode = "n",
        "<Cmd>NvimTmuxNavigateUp<CR>",
        desc = "nvim-tmux up",
      },

      {
        "<C-l>",
        mode = "n",
        "<Cmd>NvimTmuxNavigateRight<CR>",
        desc = "nvim-tmux Right",
      },

    })
    -- vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
    -- vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
    -- vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
    -- vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
  end,
}
