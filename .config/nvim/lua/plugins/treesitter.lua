return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    
    opts = function()
      return require("plugins.configs.treesitter")
    end,

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
