-- The following is taken from: https://github.com/mjlbach/defaults.nvim/blob/eeb58ffd6852a062d98cd950e17e0009089a0d85/init.lua#L1
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Better syntax highlighting.
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter.settings")
		end,
	})

	-- Support for LSP.
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp.settings")
			require("plugins.lsp.servers")
		end,
	})

	-- Support for autocompletion and snippets.
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
		},
		config = function()
			require("plugins.nvim-cmp.settings")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("plugins.luasnip.mappings")
		end,
	})

	-- "Gaze deeply into unknown regions using the power of the moon."
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.telescope.settings")
			require("plugins.telescope.mappings")
		end,
	})

	-- Motion
	use({
		"ggandor/leap.nvim",
		config = function()
			require("plugins.leap.mappings")
		end,
	})

	-- QOL
	use({
		"numToStr/Comment.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins.comment.settings")
			require("plugins.comment.mappings")
		end,
	})
	use({ "tpope/vim-dispatch" })
	use({ "gpanders/editorconfig.nvim" })
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.neoscroll.settings")
		end,
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("plugins.sniprun.mappings")
		end,
	})
	use({
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	})

	-- Interface
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.neo-tree.settings")
			require("plugins.neo-tree.mappings")
		end,
	})
	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.gitsigns.settings")
			require("plugins.gitsigns.mappings")
		end,
	})
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("plugins.lsp-trouble.settings")
			require("plugins.lsp-trouble.mappings")
		end,
	})
	use({
		"rmagatti/goto-preview",
		config = function()
			require("plugins.goto-preview.settings")
			require("plugins.goto-preview.mappings")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "scss", "svelte" },
		cmd = "ColorizerToggle",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline.settings")
		end,
	})
	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("plugins.virt-column.settings")
		end,
	})
	use({
		"rafcamlet/nvim-luapad",
		cmd = "Luapad",
	})
	use({
		"kevinhwang91/nvim-bqf",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("treesitter-context").setup()
		end,
	})

	-- Statusline
	use({
		"rebelot/heirline.nvim",
	})

	-- Filetypes
	use({
		"mattn/emmet-vim",
		ft = { "html", "svelte" },
		config = function() end,
	})

	-- Color Schemes
	use({
		"sainnhe/gruvbox-material",
	})
	use({
		"folke/tokyonight.nvim",
	})
	use({
		"rebelot/kanagawa.nvim",
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Tryout
end)

require("plugins.netrw.settings")
