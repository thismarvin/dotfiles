-- The following is taken from: https://github.com/mjlbach/defaults.nvim/blob/eeb58ffd6852a062d98cd950e17e0009089a0d85/init.lua#L1
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- Better syntax highlighting.
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins.treesitter.settings")
		end,
	})

	-- Support for LSP.
	use({
		"neovim/nvim-lspconfig",
		requires = { "nvim-lua/lsp_extensions.nvim" },
		config = function()
			require("plugins.lsp.settings")
			require("plugins.lsp.servers")
		end,
	})
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("plugins.lsp-trouble.settings")
			require("plugins.lsp-trouble.mappings")
		end,
	})

	-- Support for autocompletion and snippets.
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
		},
		config = function()
			require("plugins.nvim-cmp.settings")
		end,
	})

	-- FZF integration.
	use({
		"junegunn/fzf.vim",
		cmd = { "Colors", "FZF", "Files" },
		requires = { "junegunn/fzf" },
	})

	-- "Gaze deeply into unknown regions using the power of the moon."
	use({
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
		end,
	})

	-- QOL
	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment.settings")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline.settings")
		end,
	})
	use({ "tpope/vim-dispatch" })
	use({ "tpope/vim-fugitive" })
	use({ "editorconfig/editorconfig-vim" })
	use({ "ii14/exrc.vim" })
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "scss", "svelte" },
		cmd = "ColorizerToggle",
	})
	use({
		"rafcamlet/nvim-luapad",
		cmd = "Luapad",
	})
	use({
		"numtostr/FTerm.nvim",
		config = function()
			require("plugins.fterm.settings")
			require("plugins.fterm.mappings")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.gitsigns.settings")
			require("plugins.gitsigns.mappings")
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require("plugins.hop.settings")
			require("plugins.hop.mappings")
		end,
	})
	use({
		"ggandor/lightspeed.nvim",
	})
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.neoscroll.settings")
			require("plugins.neoscroll.mappings")
		end,
	})
	-- use { "tversteeg/registers.nvim" }
	use({
		"mattn/emmet-vim",
		ft = { "html", "svelte" },
		config = function() end,
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = "SnipRun",
		config = function()
			require("plugins.sniprun.mappings")
		end,
	})

	-- Tryout
	use({ "windwp/nvim-spectre" })
	use({
		"notomo/gesture.nvim",
		config = function()
			require("plugins.gesture.settings")
			require("plugins.gesture.mappings")
		end,
	})
	use({
		"rmagatti/goto-preview",
		config = function()
			require("plugins.goto-preview.settings")
			require("plugins.goto-preview.mappings")
		end,
	})

	-- Interface
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.nvim-tree.settings")
			require("plugins.nvim-tree.mappings")
		end,
	})
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Color Schemes
	use({ "sainnhe/gruvbox-material" })
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.g.tokyonight_style = "night"
			vim.g.tokyonight_dark_sidebar = true
		end,
	})
	use({
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "deep ocean"
		end,
	})
	use({
		"ishan9299/nvim-solarized-lua",
	})
end)

require("plugins.netrw.settings")
