return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.diagnostics.erb_lint,
      },
    })

    local wk = require("which-key")
    wk.add({
      {
        "<leader>gf",
        mode = "n",
        vim.lsp.buf.format,
        desc = "Lsp Format",
      },
    })
  end,
}
