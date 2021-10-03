local set = require("utils").set
local cmp = require("cmp")

set("completeopt=menu,menuone,noselect")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	documentation = {
		-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		-- border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		-- winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
	},

	formatting = {
		format = function(entry, vim_item)
			-- Explicitly show the source of an entry.
			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				luasnip = "(LuaSnip)",
				buffer = "(Buffer)",
				path = "(Path)",
				spell = "(Spell)",
			})[entry.source.name]

			return vim_item
		end,
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
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "spell" },
	}
})
