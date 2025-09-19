local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>i", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope old files' })

local telescope = require('telescope')
local project_actions = require("telescope._extensions.project.actions")

telescope.setup {
	defaults = {
		file_ignore_patterns = {  ".git\\", ".git/" },
    initial_mode = "normal"
	},
	pickers = {
		find_files = {
      hidden = true
    },
    oldfiles = {
      cwd_only = true
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true
    }
  },
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browser = true },
    },
    project = {
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        vim.fn.execute("Telescope oldfiles")
      end,
    }
  }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"

