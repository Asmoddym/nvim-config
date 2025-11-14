require("spectre").setup()

vim.keymap.set('n', '<leader>sS', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").open_file_search()<CR>', {
    desc = "(sp) Search on current file"
})

vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "(sp) Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "(sp) Search current word"
})

vim.keymap.set("n", "<leader>sl", ":s/<C-r><C-w>//gI<Left><Left><Left> <C-BS>", { desc = "replace word in line" })
vim.keymap.set("n", "<leader>sf", ":%s/<C-r><C-w>//gI<Left><Left><Left> <C-BS>", { desc = "replace word across file" })
vim.keymap.set("v", "<leader>sf", "y:%s/<C-r>\"//gI<left><left><Left> <C-BS>", { desc = "replace selection across file" })

