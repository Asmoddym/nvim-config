local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require('harpoon.term')

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", ui.nav_prev)
vim.keymap.set("n", "<C-l>", ui.nav_next)

-- vim.keymap.set("n", "<C-t>", function() term.gotoTerminal(1) end)
