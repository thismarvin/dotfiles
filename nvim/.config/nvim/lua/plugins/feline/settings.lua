local theme = {
	white = "#ffffff",
	black = "#1a1b26",
	blue = "#00a3cc",
	green = "#a9b665",

	fg = "black",
	bg = "blue",
}

local components = {
	active = { {}, {} },
	-- inactive = { {} },
}

-- :h mode()
local mode_map = {
	n = "N",
	i = "I",
	c = "C",
	v = "V",
	V = "VL",
	[""] = "VB",
	["r?"] = "CONFIRM",
	rm = "MORE",
	R = "R",
	Rv = "Rv",
	s = "S",
	S = "SL",
	["r"] = "HIT-ENTER",
	[""] = "S",
	t = "T",
	["!"] = "SHELL",
}

local separator_right_arrow = {
	str = "",
	hl = {
		fg = "fg",
	},
}

local separator_line = {
	str = "|",
	hl = {
		fg = "fg",
		style = "bold",
	},
}

local function vi_mode()
	local mode = mode_map[vim.fn.mode()]

	return string.format(" %s ", mode)
end

local function git()
	local branch = vim.b.gitsigns_head or vim.g.gitsigns_head or nil

	if branch == nil then
		return ""
	end

	return string.format("  %s", branch)
end

local function get_git_diff(type)
	local gsd = vim.b.gitsigns_status_dict

	if gsd and gsd[type] then
		return gsd[type]
	end

	return nil
end

local function git_diff()
	local added = get_git_diff("added")
	local changed = get_git_diff("changed")
	local removed = get_git_diff("removed")

	if added == nil or changed == nil or removed == nil then
		return " "
	end

	return string.format(" +%s ~%s -%s ", added, changed, removed)
end

local function get_lsp_client_names()
	local clients = {}

	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end

	return table.concat(clients, " ")
end

local function lsp()
	local clients = get_lsp_client_names()

	if clients == "" then
		return ""
	end

	return string.format(" %s", clients)
end

local function get_diagnostics(severity)
	local count = vim.tbl_count(vim.diagnostic.get(0, { severity = severity }))

	return tostring(count)
end

local function lsp_diagnostics()
	local clients = get_lsp_client_names()

	if clients == "" then
		return ""
	end

	local errors = get_diagnostics(vim.diagnostic.severity.ERROR)
	local warnings = get_diagnostics(vim.diagnostic.severity.WARN)
	local hints = get_diagnostics(vim.diagnostic.severity.HINT)
	local info = get_diagnostics(vim.diagnostic.severity.INFO)

	return string.format(" E-%s W-%s H-%s I-%s ", errors, warnings, hints, info)
end

local function line_percentage()
	local curr_line = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_line_count(0)

	return string.format(" %d%%%% ", math.floor(curr_line / lines * 100))
end

local function position()
	return string.format(" %d:%d ", unpack(vim.api.nvim_win_get_cursor(0)))
end

-- Active Left
table.insert(components.active[1], {
	provider = vi_mode,
	hl = {
		style = "bold",
	},
	left_sep = "",
	right_sep = separator_line,
	icon = "",
})

table.insert(components.active[1], {
	provider = {
		name = "file_info",
		opts = {
			type = "relative",
			file_readonly_icon = "[RO] ",
			file_modified_icon = "+",
		},
	},
	hl = {
		style = "bold",
	},
	left_sep = " ",
	right_sep = {
		str = " ",
		hl = {
			fg = "black",
		},
	},
	icon = "",
})

table.insert(components.active[1], {
	provider = git,
	hl = {
		style = "bold",
	},
	left_sep = "",
	right_sep = "",
	icon = "",
})

table.insert(components.active[1], {
	provider = git_diff,
	hl = {},
	left_sep = "",
	right_sep = separator_right_arrow,
	icon = "",
})

table.insert(components.active[1], {
	provider = lsp,
	hl = {
		style = "bold",
	},
	left_sep = "",
	right_sep = "",
	icon = "",
})

table.insert(components.active[1], {
	provider = lsp_diagnostics,
	hl = {},
	left_sep = "",
	right_sep = separator_right_arrow,
	icon = "",
})

table.insert(components.active[1], {
	provider = " ",
	left_sep = "",
	right_sep = "",
	icon = "",
})

-- Active Right
table.insert(components.active[2], {
	provider = position,
	hl = {},
	left_sep = "",
	right_sep = "",
	icon = "",
})

table.insert(components.active[2], {
	provider = line_percentage,
	hl = {},
	left_sep = separator_line,
	right_sep = "",
	icon = "",
})

-- Inactive Left
-- table.insert(components.inactive[1], {
-- 	provider = " ",
-- 	hl = {
-- 		bg = "#242635",
-- 	},
-- 	left_sep = "",
-- 	right_sep = "",
-- 	icon = "",
-- })
--
-- table.insert(components.inactive[1], {
-- 	provider = {
-- 		name = "file_info",
-- 		opts = {
-- 			type = "relative",
-- 			file_readonly_icon = "[RO] ",
-- 			file_modified_icon = "+",
-- 		},
-- 	},
-- 	hl = {
-- 		fg = "#545c7e",
-- 		bg = "#242635",
-- 	},
-- 	left_sep = "",
-- 	right_sep = "",
-- 	icon = "",
-- })
--
-- table.insert(components.inactive[1], {
-- 	provider = " ",
-- 	-- hl = {
-- 	-- 	bg = "#242635",
-- 	-- },
-- 	left_sep = "",
-- 	right_sep = "",
-- 	icon = "",
-- })

require("feline").setup({
	theme = theme,
	components = components,
})
