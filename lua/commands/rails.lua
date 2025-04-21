utils = require('commands.utils')

vim.api.nvim_create_user_command("RailsSpecRunThisExample", function(args)
	path = vim.fn.expand("%")
	line = vim.fn.line(".")

	if args["fargs"][1] == "-tmux" then
		local win = utils.create_float(0.8, 0.8)

		vim.fn.win_execute(win, ":terminal tmux attach -t tests")

		local cmd = "i" .. utils.termcode("<CR>") .. "run_spec \"" .. path .. "\", " .. line .. utils.termcode("<CR>") .. utils.termcode("<ESC>")
		vim.api.nvim_feedkeys(cmd, 'm', false)
	else
		local command = "RAILS_ENV=test HEADLESS=false bundle exec rspec"

		vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
	end
end, {desc = "Spec: run this particular example", nargs = "?" })


-- Mappings


vim.keymap.set("n", "<leader>rs", ":RailsSpecRunThisExample -tmux<CR>")

