local utils = require('commands.utils')

function run_spec_through_tmux(path, line)
  local win = utils.create_float(0.8, 0.8, ":terminal tmux new -A -stest-console -d -- \"cd $ELEVO_ROOT_PATH && RUN_TEST_IN_CONSOLE=true bundle exec rails c -e test\"")

  local cmd = "i" .. utils.termcode("<CR>") .. "system('clear')" .. utils.termcode("<CR>") .. "run_spec \"" .. path .. "\", " .. line .. utils.termcode("<CR>") .. utils.termcode("<ESC>")
  vim.api.nvim_feedkeys(cmd, 'm', false)
end

vim.api.nvim_create_user_command("RailsSpecRunThisExample", function(args)
  path = vim.fn.expand("%")
	line = vim.fn.line(".")

	if args["fargs"][1] == "-tmux" then
    run_spec_through_tmux(path, line)
	else
		local command = "cd $ELEVO_ROOT_PATH && RAILS_ENV=test HEADLESS=false bundle exec rspec"

		vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
	end
end, {desc = "Spec: run this particular example", nargs = "?" })


-- Mappings


vim.keymap.set("n", "<leader>rs", ":RailsSpecRunThisExample -tmux<CR>")

