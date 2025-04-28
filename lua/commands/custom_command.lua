local utils = require('commands.utils')

vim.api.nvim_create_user_command("CustomCommand", function(args)
  local path = vim.fn.getcwd()
  local file = io.open(path .. "\\.custom-commands.txt", "r")

  if file == nil then
    return
  end

  for line in file:lines() do
    local idx = string.find(line, ": ", 0) - 1
    local mode = string.sub(line, 0, idx)
    line = string.sub(line, idx + 3)

    idx = string.find(line, ": ", 0) - 1
    local id = string.sub(line, 0, idx)

    if id == args['fargs'][1] then
      local cmd = string.sub(line, idx + 3)
      print("> " .. cmd)

      if mode == "async" then
        vim.cmd(cmd)
      elseif mode == "float" then
        utils.create_float(0.6, 0.6, cmd) 
        vim.api.nvim_feedkeys("i", "m", false)
      end
    end
  end
end, { nargs = "?" } )
