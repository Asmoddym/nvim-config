vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>T", "<C-w>v<C-w>w:terminal<CR>i")
vim.keymap.set("n", "U", "<C-r>")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.api.nvim_create_user_command("SpecRunThisExample", function()
	local path = vim.fn.expand("%") .. " " .. vim.fn.line(".")
	vim.cmd("vertical terminal run-spec " .. path)
end, {desc = "Run spec" })
