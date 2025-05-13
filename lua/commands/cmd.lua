local utils = require('commands.utils')

function is_new_cmd(line)
  local first_char = string.sub(line, 0, 1)
  local last_char = string.sub(line, string.len(line), string.len(line))

  return first_char == '[' and last_char == ']' 
end

function parse_file()
  local path = vim.fn.getcwd()
  local file = io.open(path .. "\\.custom-commands.txt", "r")

  if file == nil then
    return
  end

  local current_cmd = nil
  local cmds = {}

  for line in file:lines() do
    if is_new_cmd(line) then
      if current_cmd ~= nil then
        table.insert(cmds, current_cmd)
      end

      current_cmd = { name = string.sub(line, 2, string.len(line) - 1) }
    else
      if line ~= "" then
        local idx = string.find(line, ": ", 0)

        current_cmd[string.sub(line, 0, idx - 1)] = string.sub(line, idx + 2)
      end
    end
  end

  table.insert(cmds, current_cmd)

  return cmds
end

function run_cmd(cmd)
  if cmd["mode"] == "async" then
    vim.cmd(cmd["cmd"])
  elseif cmd["mode"] == "float" then
    utils.create_float(0.6, 0.6, cmd["cmd"]) 

    if cmd["after"] ~= nil then
      local after = cmd.after:gsub("<CR>", utils.termcode("<CR>"))

      vim.api.nvim_feedkeys(after, "m", false)
    end
  end
end

function run_custom_command(arg)
  local cmds = parse_file()

  for i, cmd in ipairs(cmds) do
    if cmd.name == arg then
      run_cmd(cmd)
    end
  end
end

vim.api.nvim_create_user_command("Cmd", function(args)
  run_custom_command(args['fargs'][1])
end, { nargs = "?" } )

