local M = {}

function M.termcode(code)
	return vim.api.nvim_replace_termcodes(code, true, false, true) 
end

function M.create_float(width_ratio, height_ratio, cmd)
	ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * width_ratio)
	local height = math.floor(ui.height * height_ratio)
  local buffer = 0

  if cmd == nil then
    buffer = vim.api.nvim_create_buf(false, true)
  end

  win = vim.api.nvim_open_win(buffer, true, {
	  relative = 'win',
	  col = (ui.width - width) / 2,
	  row = (ui.height - height) / 2,
	  height = height,
	  width = width,
	  border = 'rounded',
	  focusable= true
  })

  if cmd ~= nil then
	  vim.fn.win_execute(win, cmd)
    vim.api.nvim_buf_set_keymap(vim.api.nvim_win_get_buf(win), "n", "q", ":bd!<CR>", {})
  end

	return win
end

return M
