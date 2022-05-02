local conditions = require("heirline.conditions")

local colors = {
	black = "#000000",
	blue = "#00a3cc",
}

local Align = {
	provider = "%=",
	hl = {
		fg = colors.blue,
		bg = colors.blue,
	},
}

local SeparatorLine = {
	provider = "|",
	hl = {
		fg = colors.black,
		bg = colors.blue,
		bold = true,
	},
}
local SeparatorRightArrow = {
	provider = "",
	hl = {
		fg = colors.black,
		bg = colors.blue,
	},
}

local Mode = {
	static = {
		mode_map = {
			n = "N", -- Normal
			no = "N?", -- Operator-pending
			nov = "N?", -- Operator-pending (forced charwise o_v)
			noV = "N?", -- Operator-pending (forced linewise o_V)
			["no\22"] = "N?", -- Operator-pending (forced blockwise o_CTRL-V)
			niI = "N?", -- Normal using i_CTRL-O in Insert-mode
			niR = "N?", -- Normal using i_CTRL-O in Replace-mode
			niV = "N?", -- Normal using i_CTRL-O in Virtual-Replace-mode
			nt = "N?", -- Normal in terminal-emulator (insert goes to Terminal mode)
			v = "V", -- Visual by character
			vs = "V?", -- Visual by character using v_CTRL-O in Select mode
			V = "VL", -- Visual by line
			Vs = "VL", -- Visual by line using v_CTRL-O in Select mode
			["\22"] = "VB", -- Visual blockwise
			["\22s"] = "VB", -- Visual blockwise using v_CTRL-O in Select mode
			s = "S", -- Select by character
			S = "SL", -- Select by line
			["\19"] = "SB", -- Select blockwise
			i = "I", -- Insert
			ic = "I?", -- Insert mode completion compl-generic
			ix = "I?", -- Insert mode i_CTRL-X completion
			R = "R", -- Replace R
			Rc = "R?", -- Replace mode completion compl-generic
			Rx = "R?", -- Replace mode i_CTRL-X completion
			Rv = "R?", -- Virtual Replace gR
			Rvc = "R?", -- Virtual Replace mode completion compl-generic
			Rvx = "R?", -- Virtual Replace mode i_CTRL-X completion
			c = "C", -- Command-line editing
			cv = "C?", -- Vim Ex mode gQ
			r = "...", -- Hit-enter prompt
			rm = "M", -- The -- more -- prompt
			["r?"] = "?", -- A :confirm query of some sort
			["!"] = "!", -- Shell or external command is executing
			t = "T", -- Terminal mode: keys go to the job
		},
	},
	provider = function(self)
		local mode = vim.fn.mode(1)

		return string.format(" %s ", self.mode_map[mode])
	end,
	hl = {
		fg = colors.black,
		bg = colors.blue,
		bold = true,
	},
	SeparatorLine,
}

local FileName = {
	hl = {
		fg = colors.black,
		bg = colors.blue,
	},
	-- File name.
	{
		provider = function()
			local full_file_name = vim.api.nvim_buf_get_name(0)
			-- See :h filename-modifers
			local file_name = vim.fn.fnamemodify(full_file_name, ":.")

			if file_name == "" then
				return " [No Name] "
			end

			-- Now, if the filename would occupy more than 1/4th of the available space, we trim the file
			-- path to its initials.
			if not conditions.width_percent_below(#file_name, 0.25) then
				file_name = vim.fn.pathshorten(file_name)
			end

			return string.format(" %s ", file_name)
		end,
		hl = {
			bold = true,
		},
	},
	-- Modified flag.
	{
		provider = function()
			if vim.bo.modified then
				return "[+] "
			end
		end,
	},
	-- Readonly flag.
	{
		provider = function()
			if not vim.bo.modifiable or vim.bo.readonly then
				return "[RO] "
			end
		end,
	},
	-- This means that the statusline is cut here when there's not enough space.
	{ provider = "%<" },
	SeparatorRightArrow,
}

local Git = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.gsd = vim.b.gitsigns_status_dict
	end,
	hl = {
		fg = colors.black,
		bg = colors.blue,
	},
	-- Branch.
	{
		provider = function(self)
			return string.format("  %s", self.gsd.head)
		end,
		hl = {
			bold = true,
		},
	},
	-- Status.
	{
		provider = function(self)
			return string.format(" +%s ~%s -%s ", self.gsd.added, self.gsd.changed, self.gsd.removed)
		end,
	},
	SeparatorRightArrow,
}

local Lsp = {
	condition = conditions.lsp_attached,
	hl = {
		fg = colors.black,
		bg = colors.blue,
	},
	-- Client names.
	{
		provider = function()
			local clients = vim.lsp.buf_get_clients(0)

			local names = {}
			for _, server in pairs(clients) do
				table.insert(names, server.name)
			end

			return string.format(" %s", table.concat(names, " "))
		end,
		hl = {
			bold = true,
		},
	},
	-- Diagnostics.
	{
		provider = function()
			local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

			return string.format(" E-%s W-%s H-%s I-%s ", errors, warnings, hints, info)
		end,
	},
	SeparatorRightArrow,
}

local Navigation = {
	init = function(self)
		self.row, self.column = unpack(vim.api.nvim_win_get_cursor(0))
		self.line_count = vim.api.nvim_buf_line_count(0)
	end,
	hl = {
		fg = colors.black,
		bg = colors.blue,
	},
	-- Line position.
	{
		provider = function(self)
			return string.format(" %d:%d ", self.row, self.column)
		end,
	},
	SeparatorLine,
	-- Line percentage.
	{
		provider = function(self)
			local percentage = math.floor(self.row / self.line_count * 100)

			return string.format(" %d%%%% ", percentage)
		end,
	},
}

local statusline = {
	Mode,
	FileName,
	Git,
	Lsp,
	Align,
	Navigation,
}

require("heirline").setup(statusline)
