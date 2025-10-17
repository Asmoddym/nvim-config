local utils = require('commands.utils')

function is_new_cmd(line)
  local first_char = string.sub(line, 0, 1)
  local last_char = string.sub(line, string.len(line), string.len(line))

  return first_char == '[' and last_char == ']' 
end

function os_type()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "windows"
  else
    return "unix"
  end
end

function script_extension_keyword()
  if os_type() == "windows" then
    return ".bat"
  else
    return ".sh"
  end
end

function replace_keywords(str)
  str = str:gsub("%[%[script_extension%]%]", script_extension_keyword())

  return str
end

function custom_commands_path()
  if os_type() == "windows" then
    return "\\.custom-commands.txt"
  else
    return "/.custom-commands.txt"
  end
end

function parse_file()
  local path = vim.fn.getcwd()
  local file = io.open(path .. custom_commands_path(), "r")

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
        local key = string.sub(line, 0, idx - 1) 
        local value = replace_keywords(string.sub(line, idx + 2))

        current_cmd[key] = value
      end
    end
  end

  table.insert(cmds, current_cmd)

  return cmds
end

function run_cmd(cmd)
  local cmd_key = "cmd_" .. os_type()

  if cmd["mode"] == "async" then
    vim.cmd(cmd[cmd_key])
  elseif cmd["mode"] == "float" then
    utils.create_float(0.6, 0.6, cmd[cmd_key]) 

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

