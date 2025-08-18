vim.o.splitright = true
vim.o.splitbelow = true

vim.o.nu = true
-- vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.swapfile = false
vim.o.backup = false

if vim.g.neovide then
vim.o.undodir = os.getenv("HOMEPATH") .. "/.vim-undodir"
else
vim.o.undodir = os.getenv("HOME") .. "/.vim-undodir"
end
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

