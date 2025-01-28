return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = "Telescope",
    init = function()
      local builtin = require('telescope.builtin')

      local wk = require('which-key')
      wk.add({
        { "<leader>ff", builtin.find_files, desc = "Find File" },
        { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
        { "<leader>fg", builtin.live_grep, desc = "Find with Grep" },
        { "<leader>fh", builtin.help_tags, desc = "Find Help" },
        { "<leader>fn", ":Telescope file_browser<CR>", desc = "File Browser" },
        --[[
        { 
          "<leader>fn", 
          ":Telescope file_browser path=%:p:h select_buffer=true<CR>", 
          desc = "File Browser Local" 
        },
        --]]
      })
    end,

    opts = function()
      local previewers = require "telescope.previewers"

      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          casepreviewer = true,

          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
        },
        extensions = {
         ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            -- even more opts
            }
          }
        },
        extensions_list = {
          "ui-select",
          "file_browser",
        },
      }
    end,

    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
}
