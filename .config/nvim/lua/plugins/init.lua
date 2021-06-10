require("packer").startup(function()
  use { "wbthomason/packer.nvim" }

  -- Better syntax highlighting.
  use {
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects"
		},
		config = function()
			require("plugins.treesitter.settings")
		end
	}

  -- Support for LSP.
  use {
		"neovim/nvim-lspconfig",
		requires = { "nvim-lua/lsp_extensions.nvim" },
		config = function()
			require("plugins.lsp.settings")
			require("plugins.lsp.mappings")

			require "plugins.lsp.servers.ccls"
			require "plugins.lsp.servers.pyright"
			require "plugins.lsp.servers.rust_analyzer"
			require "plugins.lsp.servers.sumneko_lua"
			require "plugins.lsp.servers.tsserver"
		end
	}
  use {
		"folke/lsp-trouble.nvim",
		config = function()
			require("plugins.lsp-trouble.settings")
			require("plugins.lsp-trouble.mappings")
		end
	}

	-- Support for autocompletion and snippets.
  use {
    "hrsh7th/nvim-compe",
		requires = {
			{ "hrsh7th/vim-vsnip" },
		},
		config = function()
			require("plugins.nvim-compe.settings")
			require("plugins.nvim-compe.mappings")
		end
  }

  -- FZF integration.
  use {
    "junegunn/fzf.vim",
		requires = { "junegunn/fzf" },
		config = function()
			require("plugins.fzf.settings")
		end
  }
  use {
    "ojroques/nvim-lspfuzzy",
		requires = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }
		},
		config = function()
			require("plugins.nvim-lspfuzzy.settings")
			require("plugins.nvim-lspfuzzy.mappings")
		end
  }

	-- "Gaze deeply into unknown regions using the power of the moon."
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		config = function()
			require("plugins.telescope.settings")
			require("plugins.telescope.mappings")
		end
	}

  -- QOL
  use { "mbbill/undotree" }
  use {
		"b3nj5m1n/kommentary",
		config = function()
			require("plugins.kommentary.settings")
		end
	}
  use { "tpope/vim-dispatch" }
  use { "tpope/vim-fugitive" }
  use { "editorconfig/editorconfig-vim" }
  use { "ii14/exrc.vim" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "rafcamlet/nvim-luapad" }
  use {
		"numtostr/FTerm.nvim",
		config = function()
			require("plugins.fterm.settings")
			require("plugins.fterm.mappings")
		end
	}
  use {
  	"lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.gitsigns.settings")
			require("plugins.gitsigns.mappings")
		end
  }
  use {
		"justinmk/vim-sneak",
		config = function()
			require("plugins.sneak.settings")
		end
	}
  use {
		"phaazon/hop.nvim",
		config = function()
			require("plugins.hop.settings")
			require("plugins.hop.mappings")
		end
	}
  use {
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.neoscroll.settings")
			require("plugins.neoscroll.mappings")
		end
	}
  use { "tversteeg/registers.nvim" }

  -- Tryout
  -- use { "kevinhwang91/nvim-bqf" }
	-- use { "blackCauldron7/surround.nvim" }
  use { "windwp/nvim-spectre" }
	use { "simrat39/symbols-outline.nvim" }
  use {
		"notomo/gesture.nvim",
		config = function()
			require("plugins.gesture.settings")
			require("plugins.gesture.mappings")
		end
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		branch = "lua",
		config = function()
			require("plugins.indent-blankline.settings")
		end
	}

	use {
		"mattn/emmet-vim",
		ft = { "html" },
		config = function ()
			
		end
	}

  -- Interface
  use {
    "kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.nvim-tree.settings")
			require("plugins.nvim-tree.mappings")
		end
  }
  use {
    "glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons" }
  }

  -- Color Schemes
  use { "sainnhe/gruvbox-material" }
	use {
		"folke/tokyonight.nvim",
		config = function()
			vim.g.tokyonight_style = "night"
			vim.g.tokyonight_dark_sidebar = true
		end
	}
	use {
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "deep ocean"
		end
	}
end)

require "plugins.netrw.settings"

vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false, -- experimental
	position = 'right',
	keymaps = {
		close = "<Esc>",
		goto_location = "<CR>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
}
