local utils = require('commands.utils')

vim.api.nvim_create_user_command("TmuxTerminalWindowed", function(args)
  utils.create_float(0.8, 0.8, ":terminal tmux new -A -sterminal-tmux")
end, {})

vim.api.nvim_create_user_command("TmuxTerminal", function(args)
  vim.cmd(":terminal tmux new -A -sterminal-tmux")
end, {})


vim.keymap.set("n", "<leader>T", ":TmuxTerminalWindowed<CR>i")
vim.keymap.set("n", "<leader>t", ":TmuxTerminal<CR>i")
