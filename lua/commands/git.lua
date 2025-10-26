local utils = require('commands.utils')

vim.api.nvim_create_user_command("GitFloatingDiff", function(args)
	local path = nil

	if args['fargs'][1] == '-all' then
		path = " -- :^.forestadmin-schema.json"
	else
		path = vim.fn.expand("%")
	end

	utils.create_float(0.95, 0.92, ":Git ++curwin -p diff " .. path)
end, {nargs = "?" })

vim.api.nvim_create_user_command("Gpush", function()
  local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")

  vim.cmd("G push origin " .. branch)
end, {})

vim.api.nvim_create_user_command("Gpushf", function()
  local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")

  vim.cmd("G push origin " .. branch .. " --force")
end, {})

vim.api.nvim_create_user_command("Gpull", function()
  local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")

  vim.cmd("G fetch -p")
  vim.cmd("G pull origin ".. branch)
end, {})

vim.api.nvim_create_user_command("GOpenCommit", function()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))

  local url = "https://gitlab.com/elevo/elevo-rails/-/commit/" .. vim.fn.system("git rev-parse $(git blame " .. vim.fn.expand("%") .. " -L " .. r .. "," .. r .. " | cut -d' ' -f 1)"):gsub("%s+", "")

  vim.cmd("silent !open " .. url)
end, {})

