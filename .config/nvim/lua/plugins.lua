return require("packer").startup(function()
  use { "wbthomason/packer.nvim" }

  -- Better syntax highlighting.
  use { "nvim-treesitter/nvim-treesitter" }
  use { "sheerun/vim-polyglot" }

  -- LSP & Autocompletion support.
  use { "neovim/nvim-lspconfig" }
  use { "nvim-lua/lsp_extensions.nvim" }
  use {
    "hrsh7th/nvim-compe",
      requires = {
        { "hrsh7th/vim-vsnip" },
      }
  }

  -- FZF integration.
  use {
    "junegunn/fzf.vim",
      requires = { "junegunn/fzf" }
  }
  use {
    "ojroques/nvim-lspfuzzy",
      requires = {
        { "junegunn/fzf" },
        { "junegunn/fzf.vim" }
      }
  }

  -- QOL
  use { "mbbill/undotree" }
  use { "justinmk/vim-sneak" }
  use { "b3nj5m1n/kommentary" }
  use { "tpope/vim-dispatch" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-abolish" }
  use { "psliwka/vim-smoothie" }
  use { "airblade/vim-rooter" }
  use { "editorconfig/editorconfig-vim" }
  use { "terryma/vim-expand-region" }
  use { "AndrewRadev/splitjoin.vim" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "windwp/nvim-autopairs" }
  use { "ii14/exrc.vim" }
  use { "rafcamlet/nvim-luapad" }

  -- Interface
  use {
    "mhinz/vim-startify",
      requires = { "ryanoasis/vim-devicons", opt = true }
  }
  use {
    "glepnir/galaxyline.nvim",
      branch = "main",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use {
    "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Color Schemes
  use { "sainnhe/gruvbox-material" }
end)
