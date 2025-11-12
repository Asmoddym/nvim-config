-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- File browsing / project management


  -- Telescope stuff
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-project.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
  }


  -- AI


  use { "CopilotC-Nvim/CopilotChat.nvim" }


  -- LSP (COC)


  use { 'neoclide/coc.nvim', branch = "release" }
  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }


  -- Git


  use { 'lewis6991/gitsigns.nvim' }
  use "sindrets/diffview.nvim"
  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
})

  -- UI


  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" }

  use { "folke/todo-comments.nvim", requires = { 'nvim-lua/plenary.nvim' } }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'itchyny/lightline.vim' }

  -- Tabs / Buffers
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Highlighting
  use { "RRethy/vim-illuminate" }

  -- Startup
  use { 'mhinz/vim-startify' }


  -- Utils


  use { 'nvim-lua/plenary.nvim' }
  use 'nvim-tree/nvim-web-devicons'
  use 'farmergreg/vim-lastplace'
  use "chrisgrieser/nvim-spider"

  use 'tpope/vim-abolish'
  use 'mg979/vim-visual-multi'

  use {
    "mikavilpas/yazi.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use { 'nvim-mini/mini.surround' }
  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  })


  -- old / not used


  -- use { 'aaronik/Treewalker.nvim' }
  -- use { 'preservim/nerdtree' }
  -- use 'vim-airline/vim-airline'

  -- use { 'folke/which-key.nvim', config = function()
  --   require("which-key").setup({
  --     triggers = { '<leader>', mode = {'n', 'v' }}})
  -- end }

  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'nvim-tree/nvim-web-devicons' },
  --   config = function ()
  --     local startify = require("alpha.themes.startify")
  --
  --     startify.file_icons.provider = "devicons"
  --     require("alpha").setup(
  --       startify.config
  --     )
  --   end
  -- }
  -- use { 'tpope/vim-rails' }
  -- use { 'tpope/vim-bundler' }

  -- Navigation
  -- use { 'ThePrimeagen/harpoon' }
  -- use({
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   }
  -- })
  --
  -- use {   "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git" }
  --
  --
  -- Rails
  --
  -- use({
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "olimorris/neotest-rspec"
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-rspec"),
  --       }
  --     })
  --   end
  -- })
  --

end)
