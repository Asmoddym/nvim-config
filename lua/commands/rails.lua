local utils = require('commands.utils')

function run_spec_through_tmux(path, line)
  local win = utils.create_float(0.8, 0.8, ":terminal tmux new -A -stest-console -d -- \"cd $ELEVO_ROOT_PATH && RUN_TEST_IN_CONSOLE=true bundle exec rails c -e test\"")

  local cmd = "i" .. utils.termcode("<CR>") .. "system('clear')" .. utils.termcode("<CR>") .. "run_spec \"" .. path .. "\""

  if line ~= "" then
    cmd = cmd .. ", " .. line
  end

  cmd = cmd .. utils.termcode("<CR>") .. utils.termcode("<ESC>")

  vim.api.nvim_feedkeys(cmd, 'm', false)
end

vim.api.nvim_create_user_command("RailsSpecRunThisExample", function(args)
  path = vim.fn.expand("%")
	line = vim.fn.line(".")

	if args["fargs"][1] == "-tmux" then
    run_spec_through_tmux(path, "")
	else
		local command = "cd $ELEVO_ROOT_PATH && RAILS_ENV=test HEADLESS=false bundle exec rspec"

		vim.cmd("vertical terminal " .. command .. " " .. path .. ":" .. line)
    vim.api.nvim_feedkeys("i", "m", false)
	end
end, {desc = "Spec: run this particular example", nargs = "?" })

vim.api.nvim_create_user_command("RailsFormat", function()
  local path = vim.fn.expand("%")

  vim.cmd(":! cd $ELEVO_ROOT_PATH && bundle exec stree write --print-width=100 --plugins=plugin/trailing_comma " .. path)
  vim.api.nvim_feedkeys(utils.termcode("<CR>") .. ":e" .. utils.termcode("<CR>") .. ":w" .. utils.termcode("<CR>"), 'm', false)
end, {})

vim.keymap.set("n", "<leader>rs", ":RailsSpecRunThisExample -tmux<CR>", { desc = "Run spec in tmux" })
