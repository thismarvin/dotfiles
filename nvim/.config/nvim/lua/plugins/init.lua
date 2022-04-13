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

	-- Support for autocompletion and snippets.
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
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
			require("plugins.luasnip.mappings")
		end,
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
		config = function()
			require("plugins.comment.settings")
		end,
	})
	use({ "tpope/vim-dispatch" })
	use({ "gpanders/editorconfig.nvim" })
	use({ "ii14/exrc.vim" })
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.neoscroll.settings")
			require("plugins.neoscroll.mappings")
		end,
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("plugins.sniprun.settings")
			require("plugins.sniprun.mappings")
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
		"mbbill/undotree",
		cmd = "UndotreeToggle",
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
		"folke/lsp-trouble.nvim",
		config = function()
			require("plugins.lsp-trouble.settings")
			require("plugins.lsp-trouble.mappings")
		end,
	})
	use({
		"numtostr/FTerm.nvim",
		config = function()
			require("plugins.fterm.settings")
			require("plugins.fterm.mappings")
		end,
	})
	use({
		"rmagatti/goto-preview",
		config = function()
			require("plugins.goto-preview.settings")
			require("plugins.goto-preview.mappings")
		end,
	})
	-- use({"tversteeg/registers.nvim"})
	-- use({ "tpope/vim-fugitive" })
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

	-- Statusline
	use({
		"feline-nvim/feline.nvim",
	})

	-- Bufferline
	use({
		"nanozuki/tabby.nvim",
		config = function()
			require("plugins.tabby.settings")
		end,
	})

	-- Filetypes
	use({
		"mattn/emmet-vim",
		ft = { "html", "svelte" },
		config = function() end,
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
	use({ "rebelot/kanagawa.nvim" })

	-- Tryout
	use({ "windwp/nvim-spectre" })
	-- use({
	-- 	"luukvbaal/stabilize.nvim",
	-- 	config = function()
	-- 		require("stabilize").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"chentau/marks.nvim",
	-- 	config = function()
	-- 		require("plugins.marks.settings")
	-- 	end,
	-- })
	-- use({
	-- 	"code-biscuits/nvim-biscuits",
	-- 	config = function()
	-- 		require("plugins.nvim-biscuits.settings")
	-- 		require("plugins.nvim-biscuits.mappings")
	-- 	end,
	-- })
end)

require("plugins.netrw.settings")
