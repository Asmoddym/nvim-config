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

vim.api.nvim_create_user_command("Gpull", function()
  local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")

  vim.cmd("G fetch -p")
  vim.cmd("G pull origin ".. branch)
end, {})


-- Mappings


vim.keymap.set("n", "<leader>gd", ":GitFloatingDiff<CR>")
vim.keymap.set("n", "<leader>gD", ":GitFloatingDiff -all<CR>")

