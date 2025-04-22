local utils = require('commands.utils')

vim.api.nvim_create_user_command("GitFloatingDiff", function(args)
	local path = nil

	if args['fargs'][1] == '-all' then
		path = "."
	else
		path = vim.fn.expand("%")
	end

	utils.create_float(0.95, 0.95, ":Git ++curwin -p diff " .. path)
end, {nargs = "?" })


-- Mappings


vim.keymap.set("n", "<leader>gd", ":GitFloatingDiff<CR>")
vim.keymap.set("n", "<leader>gD", ":GitFloatingDiff -all<CR>")

