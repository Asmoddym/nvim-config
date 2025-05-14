local utils = require('commands.utils')

vim.api.nvim_create_user_command("Remember", function()
  local file = os.getenv("HOME") .. "/.nvim-remember.md"

  utils.create_float(0.7, 0.7, ":e " .. file)
end, {})

