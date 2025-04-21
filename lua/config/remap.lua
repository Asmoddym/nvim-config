vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>T", "<C-w>v<C-w>w:terminal<CR>i")
vim.keymap.set("n", "U", "<C-r>")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "}zz")
vim.keymap.set("n", "<C-u>", "{zz")
vim.keymap.set("v", "<C-d>", "}zz")
vim.keymap.set("v", "<C-u>", "{zz")

vim.keymap.set("n", "<leader>q", ":bd!<CR>")
