require("illuminate").configure({
  providers ={
    'lsp',
    -- 'treesitter',
    'regex'
  }
})

-- change the highlight style

-- default: #3E4257
local c = "#373A4D"

vim.api.nvim_set_hl(0, "IlluminatedWordText", {  bg = c })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", {  bg = c })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {  bg = c })
