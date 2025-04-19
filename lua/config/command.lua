-- Rails specs


vim.api.nvim_create_user_command("SpecRunThisExample", function()
	local path = vim.fn.expand("%")
	local line = vim.fn.line(".")

	local command = "RAILS_ENV=test HEADLESS=false bundle exec rspec"
	vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
end, {desc = "Spec: run this particular example" })
