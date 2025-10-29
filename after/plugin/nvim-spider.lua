vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "<BACKSPACE>", "<cmd>lua require('spider').motion('b')<CR>")

require("spider").setup {
	skipInsignificantPunctuation = false
}
