vim.api.nvim_create_user_command("SpecRunThisExample", function()
	local path = vim.fn.expand("%")
	local line = vim.fn.line(".")

	local command = "RAILS_ENV=test HEADLESS=false bundle exec rspec"
	vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
end, {desc = "Spec: run this particular example" })

function create_float(width_ratio, height_ratio)
	ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * width_ratio)
	local height = math.floor(ui.height * height_ratio)

	buffer = vim.api.nvim_create_buf(true, true)
	win = vim.api.nvim_open_win(buffer, true, {
		relative = 'win',
		col = (ui.width - width) / 2,
		row = (ui.height - height) / 2,
		height = height,
		width = width,
		border = 'rounded',
		focusable= true
	})

	return win
end

-- TODO: Add an arg and set gd as diff of current file and gD as global diff
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

vim.keymap.set("n", "<leader>gd", ":GitFloatingDiff<CR>")
vim.keymap.set("n", "<leader>gD", ":GitFloatingDiff -all<CR>")
