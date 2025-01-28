return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>t",
				mode = "n",
				":TestNearest<CR>",
				desc = "Run nearest test",
			},
			{
				"<leader>T",
				mode = "n",
				":TestFile<CR>",
				desc = "Run tests in current file",
			},
			{
				"<leader>a",
				mode = "n",
				":TestSuite<CR>",
				desc = "Run entire test suite",
			},
			{
				"<leader>l",
				mode = "n",
				":TestLast<CR>",
				desc = "Run last test",
			},
			{
				"<leader>g",
				mode = "n",
				":TestVisit<CR>",
				desc = "Visit last test file",
			},
		})

		vim.cmd("let test#strategy = 'vimux'")
	end,
}
