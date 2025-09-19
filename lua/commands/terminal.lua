local utils = require('commands.utils')

vim.api.nvim_create_user_command("TmuxTerminal", function(args)
  utils.create_float(0.8, 0.8, ":terminal tmux new -A -sterminal-tmux")
end, {})
