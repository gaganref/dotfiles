return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local colorpalletes = require("plugins.configs.colorpalletes")
      require("catppuccin").setup {
        color_overrides = {
          mocha = colorpalletes.oxocarbon_dark
        },
        integrations = {
          which_key = true,
          neotree = false
        },
      }

      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
