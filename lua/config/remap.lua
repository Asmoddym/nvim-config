vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>T", "<C-w>v:terminal<CR>i")
vim.keymap.set("n", "U", "<C-r>")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "}zz")
-- vim.keymap.set("n", "<C-u>", "{zz")

-- vim.keymap.set("v", "<C-d>", "}zz")
-- vim.keymap.set("v", "<C-u>", "{zz")
-- vim.keymap.set("n", "<C-d>", "}zz")
-- vim.keymap.set("n", "<C-u>", "{zz")

vim.keymap.set({"n", "v"}, "<C-j>", "}")
vim.keymap.set({"n", "v"}, "<C-k>", "{")

vim.keymap.set("x", "<leader>p", "\"+p")
vim.keymap.set("x", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader><Left>", ":bprev<CR>")
vim.keymap.set("n", "<leader><Right>", ":bnext<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>d", "\"_d")

-- vim.keymap.set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left><C-r><C-w>")
-- vim.keymap.set("n", "<leader>s", ":s/\\<<C-r><C-w>\\>//gI<Left><Left><Left><C-r><C-w>")
-- vim.keymap.set("v", "<leader>s", "y:%s/<C-r>\"//gI<left><left><Left>\"")
vim.keymap.set("n", "<leader>S", ":%s/<C-r><C-w>//gI<Left><Left><Left> <C-BS>")
vim.keymap.set("n", "<leader>s", ":s/<C-r><C-w>//gI<Left><Left><Left> <C-BS>")
vim.keymap.set("v", "<leader>s", "y:%s/<C-r>\"//gI<left><left><Left> <C-BS>")

