-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File browsing / project management

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 
  use { "CopilotC-Nvim/CopilotChat.nvim" }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use {
    'nvim-telescope/telescope-project.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
  }

  use { 'ThePrimeagen/harpoon' }

  -- LSP (COC)

  use { 'neoclide/coc.nvim', branch = "release" }

  -- Rails
  
  -- use { 'tpope/vim-rails' }
  -- use { 'tpope/vim-bundler' }

  -- Themes

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }
  use { "folke/todo-comments.nvim", requires = { 'nvim-lua/plenary.nvim' } }

  -- Git

  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }

  -- UI

  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'itchyny/lightline.vim' }
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  })
  -- use { 'preservim/nerdtree' }
  -- use 'vim-airline/vim-airline'

  -- use { 'folke/which-key.nvim', config = function()
  --   require("which-key").setup({
  --     triggers = { '<leader>', mode = {'n', 'v' }}})
  -- end }

  -- Startup

  use { 'mhinz/vim-startify' }

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


  -- 
  -- Utils
  --

  use { 'nvim-lua/plenary.nvim' }

  use 'nvim-tree/nvim-web-devicons'

  use 'farmergreg/vim-lastplace'

  use "chrisgrieser/nvim-spider"

  use { 'aaronik/Treewalker.nvim' }

  use 'tpope/vim-abolish'

  use 'jake-stewart/multicursor.nvim'
end)

