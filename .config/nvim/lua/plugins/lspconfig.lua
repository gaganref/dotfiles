return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    -- cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    config = function(_, opts)
      require('mason').setup(opts)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      -- ensure_installed = {
      --   "lua_ls",
      -- },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
      })
      local wk = require('which-key')
      wk.add({
        {
          "K", mode = "n",
          vim.lsp.buf.hover,
          desc = "Function Documentation"
        },
        {
          "<leader>gd", mode = "n",
          vim.lsp.buf.definations,
          desc = "Go to Definations"
        },
        {
          "<leader>gr", mode = "n",
          vim.lsp.buf.references,
          desc = "Go to References"
        },
        {
          "<leader>ca", mode = "n",
          vim.lsp.buf.code_action,
          desc = "Code Action"
        },
        {
          "<leader>cf", mode = "n",
          vim.lsp.buf.format,
          desc = "Code Format"
        },
        {
          "<leader>rn", mode = "n",
          vim.lsp.buf.rename,
          desc = "Rename"
        },
      })
    end,
  }
}
