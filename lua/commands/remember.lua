local utils = require('commands.utils')

vim.api.nvim_create_user_command("Remember", function()
  local home = os.getenv("HOME")

  if home == nil then
    home = os.getenv("REMEMBER_HOME")
  end

  local file = home .. "/.nvim-remember.md"

  utils.create_float(0.7, 0.7, ":e " .. file)
end, {})

