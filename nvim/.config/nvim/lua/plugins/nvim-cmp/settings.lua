local set = require("utils").set
local cmp = require("cmp")

set("completeopt=menu,menuone,noselect")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	documentation = {
		-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		-- border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		-- winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
	},
	mapping = {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "spell" },
	}
})
