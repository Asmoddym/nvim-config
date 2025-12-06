local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>i", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope old files' })
vim.keymap.set('n', '<leader>fR', builtin.resume, { desc = 'Telescope reopen last picker' })

vim.keymap.set('n', '<leader>fc', builtin.git_bcommits, { desc = 'Telescope git buffer commits' })
vim.keymap.set('n', '<leader>fC', builtin.git_bcommits, { desc = 'Telescope git dir commits' })
vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Telescope git status files' })
vim.keymap.set('n', '<leader>fh', builtin.search_history, { desc = 'Telescope git status files' })

local telescope = require('telescope')
local project_actions = require("telescope._extensions.project.actions")

telescope.setup {
	defaults = {
		file_ignore_patterns = {  ".git\\", ".git/" },
    initial_mode = "normal",
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
      },
    }
	},
	pickers = {
		find_files = {
      hidden = true
    },
    oldfiles = {
      cwd_only = true
    },
    buffers = {
      -- sort_lastused = true,
      show_all_buffers = false,
      sort_mru = true
    }
  },
  extensions = {
    project = {
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        vim.fn.execute("Telescope oldfiles")
      end,
    }
  }
}

require("telescope").load_extension "project"

vim.api.nvim_create_user_command("TelscopeGrepIn", function(args)
  vim.cmd("Telescope find_files search_dirs={\"" .. args['fargs'][1] .. "\"}")
end, { nargs = "?"})

