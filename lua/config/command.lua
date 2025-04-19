vim.api.nvim_create_user_command("SpecRunThisExample", function()
	local path = vim.fn.expand("%")
	local line = vim.fn.line(".")

	local command = "RAILS_ENV=test HEADLESS=false bundle exec rspec"
	vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
end, {desc = "Spec: run this particular example" })

vim.api.nvim_create_user_command("GitFloatingDiff", function()
	ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * 0.8)
	local height = math.floor(ui.height * 0.8)

	buffer = vim.api.nvim_create_buf(true, true)
	win = vim.api.nvim_open_win(buffer, true, {
		relative = 'win',
		col = (ui.width - width) / 2,
		row = (ui.height - height) / 2,
		height = height,
		width = width,
		border = 'rounded' ,
		focusable= true
	})
	vim.fn.win_execute(win, ":Git ++curwin -p diff")
end, {})


