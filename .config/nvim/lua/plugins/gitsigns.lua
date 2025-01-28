return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      local wk = require('which-key')
      wk.add({
        { 
          "<C-n>",
          ":Neotree filesystem reveal toggle right<CR>", 
          desc = "Neo Tree File System" 
        },
      })
    end,
  }
}
