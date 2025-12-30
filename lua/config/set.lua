vim.o.splitright = true
vim.o.splitbelow = true

vim.o.nu = true
-- vim.o.relativenumber = true

-- vim.opt.guicursor = ""

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.magic = true

local path = os.getenv("HOME")

if path == nil or path == '' then
  path = os.getenv("HOMEPATH")
end
vim.o.undodir = path .. "/.vim-undodir"

vim.o.undofile = true

vim.o.scrolloff = 8

vim.o.updatetime = 50

-- vim.o.scroll = 15
vim.o.pumheight = 10

vim.g.lightline = {
  colorscheme = 'catppuccin',
  active = {
    left = { { "mode", "paste" }, { "cocstatus", "readonly", "absolutepath", "modified" } },
    right = { { "lineinfo" }, { "percent" }, { "gitbranch" } }
  },
  component_function = {
    cocstatus = 'coc#status',
    gitbranch = 'FugitiveHead'
  },
}

vim.g.neovide_scale_factor = 0.75

-- Taken from
--
-- https://www.reddit.com/r/neovim/comments/16qls9t/what_value_do_you_set_for_listchars/
-- https://www.reddit.com/r/neovim/comments/1430ts5/how_do_i_highlight_a_match_group_only_in_normal/

vim.cmd([[match TrailingWhitespace /\s\+$/]])

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.cmd.hi("clear TrailingWhitespace")
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd.hi("TrailingWhitespace ctermbg=Red guibg=Red")
  end
})

--Taken from https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/

vim.opt.foldmethod = "expr"
-- vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
