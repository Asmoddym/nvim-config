-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs
-- Rails specs


vim.api.nvim_create_user_command("SpecRunThisExample", function()
	local path = vim.fn.expand("%")
	local line = vim.fn.line(".")

	local command = "RAILS_ENV=test HEADLESS=false bundle exec rspec"
	vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
end, {desc = "Spec: run this particular example" })

vim.api.nvim_create_user_command("GitFloatingDiff", function()
	buffer = vim.api.nvim_create_buf(true, true)
	win = vim.api.nvim_open_win(buffer, true, {relative = 'win', row = 10, col = 10, height = 50, width = 100, border = 'rounded' , focusable= true})
	-- vim.cmd(":Gedit :")
	-- vim.fn.win_execute(win, ":!git diff")
	vim.fn.win_execute(win, ":terminal git diff")
	vim.api.nvim_input("i")
end, {})
