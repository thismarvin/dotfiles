require("packer").startup(function()
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
  use { "airblade/vim-rooter" }
  use { "editorconfig/editorconfig-vim" }
  use { "terryma/vim-expand-region" }
  use { "AndrewRadev/splitjoin.vim" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "ii14/exrc.vim" }
  use { "rafcamlet/nvim-luapad" }

  -- Tryout
  use { "phaazon/hop.nvim" }
  use { "karb94/neoscroll.nvim" }
  use { "kevinhwang91/nvim-bqf" }
  use { "windwp/nvim-spectre" }
  use { "tversteeg/registers.nvim" }

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

require "plugins.netrw.settings"
require "plugins.treesitter.settings"
require "plugins.lsp.settings"
require "plugins.lsp.servers.ccls"
require "plugins.lsp.servers.rust_analyzer"
require "plugins.nvim-compe.settings"
require "plugins.fzf.settings"
require "plugins.nvim-lspfuzzy.settings"
require "plugins.kommentary.settings"
require "plugins.neoscroll.settings"
require "plugins.rooter.settings"
require "plugins.sneak.settings"
require "plugins.startify.settings"
require "plugins.nvim-tree.settings"
require "plugins.hop.settings"

require "plugins.lsp.mappings"
require "plugins.nvim-compe.mappings"
require "plugins.fzf.mappings"
require "plugins.nvim-tree.mappings"
require "plugins.hop.mappings"
