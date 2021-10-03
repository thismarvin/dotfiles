local set = require("utils").set
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

set("completeopt=menu,menuone,noselect")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
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
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				feedkey("<C-n>")
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if vim.fn.pumvisible() == 1 then
				feedkey("<C-p>")
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "spell" },
	},
})
