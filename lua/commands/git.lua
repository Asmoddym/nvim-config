vim.api.nvim_create_user_command("GitFloatingDiff", function(args)
	local path = nil

	if args['fargs'][1] == '-all' then
		path = "."
	else
		path = vim.fn.expand("%")
	end

	local win = create_float(0.7, 0.9)

	vim.fn.win_execute(win, ":Git ++curwin -p diff " .. path)
end, {nargs = "?" })


-- Mappings


vim.keymap.set("n", "<leader>gd", ":GitFloatingDiff<CR>")
vim.keymap.set("n", "<leader>gD", ":GitFloatingDiff -all<CR>")

