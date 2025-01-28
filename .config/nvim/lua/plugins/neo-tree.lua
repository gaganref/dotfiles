return {
	"nvim-neo-tree/neo-tree.nvim",
	version="*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
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
