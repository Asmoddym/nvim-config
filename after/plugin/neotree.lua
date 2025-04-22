require("neo-tree").setup({ filesystem = { hijack_netrw_behavior = "disabled" } })

vim.keymap.set("n", "<leader>ft", ":Neotree reveal toggle position=left<CR>")

