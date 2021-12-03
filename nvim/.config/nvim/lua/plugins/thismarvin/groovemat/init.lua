local M = {}

local function highlight(group, colors)
	if colors.fg == nil then
		colors.fg = "NONE"
	end
	if colors.bg == nil then
		colors.bg = "NONE"
	end
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s", group, colors.fg, colors.bg))
end

function M.colorscheme()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "groovemat"

	local palette = {
		none = "NONE",
		white = "#d4be99",
		black = "#1a1b26",
		light_black = "#1d2021",
		dark_gray = "#282828",
		yeet = "#373336",
		gray = "#504945",
		light_gray = "#928374",
		red = "#ea6962",
		green = "#a9b665",
		yellow = "#d8a657",
		blue = "#7daea3",
		cyan = "#89b482",
		purple = "#d3869b",
		orange = "#e78a4e",
	}

	local builtin_highlight_groups = {
		ColorColumn = { fg = palette.none, bg = palette.dark_gray }, -- used for the columns set with 'colorcolumn'
		Conceal = {}, -- placeholder characters substituted for concealed
		CursorColumn = { fg = palette.white, bg = palette.dark_gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Cursor = { fg = palette.black, bg = palette.white }, -- character under the cursor
		CursorIM = {}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorLine = { fg = palette.none, bg = palette.dark_gray }, -- Screen-line at the cursor, when 'cursorline' is set.
		CursorLineNr = { fg = palette.light_gray, bg = palette.none }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		DiffAdd = { fg = palette.black, bg = palette.green }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = palette.black, bg = palette.blue }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = palette.black, bg = palette.red }, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = palette.black, bg = palette.white }, -- diff mode: Changed text within a changed line |diff.txt|
		Directory = { fg = palette.purple, bg = palette.none }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = palette.light_black, bg = palette.none }, -- filler lines (~) after the end of the buffer.
		ErrorMsg = { fg = palette.red, bg = palette.none }, -- error messages on the command line
		FoldColumn = { fg = palette.gray, bg = palette.none }, -- 'foldcolumn'
		Folded = { fg = palette.gray, bg = palette.dark_gray }, -- line used for closed folds
		IncSearch = { fg = palette.black, bg = palette.red }, -- 'incsearch' highlighting; also used for the text replaced with "s///c"
		lCursor = {}, -- the character under the cursor when |language-mapping| is used.
		LineNr = { fg = palette.gray, bg = palette.none }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		MatchParen = { fg = palette.white, bg = palette.yeet }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
		ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT --")
		MoreMsg = { fg = palette.yellow, bg = palette.none }, -- |more-prompt|
		MsgArea = { fg = palette.white, bg = palette.none }, -- Area for messages and cmdline
		MsgSeparator = { fg = palette.white, bg = palette.none }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		NonText = { fg = palette.gray, bg = palette.none }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text.
		Normal = { fg = palette.white, bg = palette.none }, -- normal text
		NormalFloat = { fg = palette.white, bg = palette.none }, -- Normal text in floating windows.
		NormalNC = { fg = palette.white, bg = palette.none }, -- normal text in non-current windows.
		Pmenu = { fg = palette.white, bg = palette.gray }, -- Popup menu: normal item.
		PmenuSbar = { fg = palette.white, bg = palette.gray }, -- Popup menu: scrollbar.
		PmenuSel = { fg = palette.gray, bg = palette.white }, -- Popup menu: selected item.
		PmenuThumb = { fg = palette.white, bg = palette.white }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = palette.purple, bg = palette.none }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with CursorLine when the cursor is there.
		Search = { fg = palette.black, bg = palette.green }, -- Last search pattern highlighting (see 'hlsearch').
		SignColumn = { fg = palette.none, bg = palette.none }, -- column where |signs| are displayed
		SpecialKey = { fg = palette.gray, bg = palette.none }, -- Unprintable characters: text displayed differently from what it really is.
		SpellBad = {}, -- Word that is not recognized by the spellchecker. |spell|
		SpellCap = {}, -- Word that should start with a capital. |spell|
		SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region.
		SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.
		StatusLine = { fg = palette.dark_gray, bg = palette.white }, -- status line of current window
		StatusLineNC = { fg = palette.dark_gray, bg = palette.light_gray }, -- status lines of not-current windows
		TabLine = { fg = palette.light_gray, bg = palette.yeet }, -- tab pages line, not active tab page label
		TabLineFill = { fg = palette.dark_gray, bg = palette.none }, -- tab pages line, where there are no labels
		TabLineSel = { fg = palette.white, bg = palette.gray }, -- tab pages line, active tab page label
		Substitute = { fg = palette.black, bg = palette.red }, -- |:substitute| replacement text highlighting
		TermCursor = {}, -- cursor in a focused terminal
		TermCursorNC = {}, -- cursor in an unfocused terminal
		Title = {}, -- titles for output from ":set all", ":autocmd" etc.
		VertSplit = { fg = palette.black, bg = palette.yeet }, -- the column separating vertically split windows
		Visual = { fg = palette.none, bg = palette.yeet }, -- Visual mode selection
		VisualNOS = { fg = palette.none, bg = palette.dark_gray }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = palette.yellow, bg = palette.none }, -- warning messages
		Whitespace = { fg = palette.red, bg = palette.none }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { fg = palette.white, bg = palette.gray }, -- current match in 'wildmenu' completion
	}

	local syntax_highlight_groups = {
		Boolean = { fg = palette.purple, bg = palette.none }, -- a boolean constant: TRUE, false
		Character = { fg = palette.orange, bg = palette.none }, -- a character constant: 'c', '\n'
		Comment = { fg = palette.light_gray, bg = palette.none }, -- any comment (nvim-cmp uses this)
		Conditional = { fg = palette.red, bg = palette.none }, -- if, then, else, endif, switch, etc.
		Constant = { fg = palette.purple, bg = palette.none }, -- any constant
		Debug = { fg = palette.white, bg = palette.none }, -- debugging statements
		Define = { fg = palette.blue, bg = palette.none }, -- preprocessor #define
		Delimiter = { fg = palette.white, bg = palette.none }, -- character that needs attention
		Error = { fg = palette.red, bg = palette.none }, -- any erroneous construct
		Exception = { fg = palette.yellow, bg = palette.none }, -- try, catch, throw
		Float = { fg = palette.orange, bg = palette.none }, -- a floating point constant: 2.3e10
		Function = { fg = palette.green, bg = palette.none }, -- function name (also: methods for classes)
		Identifier = { fg = palette.blue, bg = palette.none }, -- any variable name
		Ignore = { fg = palette.white, bg = palette.none }, -- left blank, hidden  |hl-Ignore|
		Include = { fg = palette.purple, bg = palette.none }, -- preprocessor #include
		Keyword = { fg = palette.red, bg = palette.none }, -- any other keyword
		Label = { fg = palette.red, bg = palette.none }, -- case, default, etc.
		Macro = { fg = palette.blue, bg = palette.none }, -- same as Define
		Number = { fg = palette.purple, bg = palette.none }, -- a number constant: 234, 0xff
		Operator = { fg = palette.orange, bg = palette.none }, -- "sizeof", "+", "*", etc.
		PreCondit = { fg = palette.red, bg = palette.none }, -- preprocessor #if, #else, #endif, etc.
		PreProc = { fg = palette.purple, bg = palette.none }, -- generic Preprocessor
		Repeat = { fg = palette.red, bg = palette.none }, -- for, do, while, etc.
		SpecialChar = { fg = palette.white, bg = palette.none }, -- special character in a constant
		SpecialComment = { fg = palette.white, bg = palette.none }, -- special things inside a comment (nvim-cmp uses this)
		Special = { fg = palette.light_gray, bg = palette.none }, -- any special symbol (nvim-cmp uses this)
		Statement = { fg = palette.orange, bg = palette.none }, -- any statement
		StorageClass = { fg = palette.red, bg = palette.none }, -- static, register, volatile, etc.
		String = { fg = palette.yellow, bg = palette.none }, -- a string constant: "this is a string"
		Structure = { fg = palette.red, bg = palette.none }, -- struct, union, enum, etc.
		Tag = { fg = palette.white, bg = palette.none }, -- you can use CTRL-] on this
		Todo = { fg = palette.blue, bg = palette.none }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Typedef = { fg = palette.red, bg = palette.none }, -- A typedef
		Type = { fg = palette.cyan, bg = palette.none }, -- int, long, char, etc.
		Underlined = { fg = palette.white, bg = palette.none }, -- text that stands out, HTML links
	}

	local treesitter_highlight_groups = {
		TSAnnotation = { fg = palette.red, bg = palette.none }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSAttribute = { fg = palette.white, bg = palette.none }, -- (unstable) TODO: docs
		TSBoolean = { fg = palette.purple, bg = palette.none }, -- For booleans.
		TSCharacter = { fg = palette.orange, bg = palette.none }, -- For characters.
		TSComment = { fg = palette.gray, bg = palette.none }, -- For comment blocks.
		TSConditional = { fg = palette.red, bg = palette.none }, -- For keywords related to conditionnals.
		TSConstant = { fg = palette.purple, bg = palette.none }, -- For constants
		TSConstBuiltin = { fg = palette.purple, bg = palette.none }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = palette.purple, bg = palette.none }, -- For constants that are defined by macros: `NULL` in C.
		TSConstructor = { fg = palette.blue, bg = palette.none }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
		TSError = { fg = palette.red, bg = palette.none }, -- For syntax/parser errors.
		TSException = { fg = palette.yellow, bg = palette.none }, -- For exception related keywords.
		TSField = { fg = palette.green, bg = palette.none }, -- For fields.
		TSFloat = { fg = palette.purple, bg = palette.none }, -- For floats.
		TSFunction = { fg = palette.green, bg = palette.none }, -- For function (calls and definitions).
		TSFuncBuiltin = { fg = palette.cyan, bg = palette.none }, -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro = { fg = palette.cyan, bg = palette.none }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = palette.purple, bg = palette.none }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = { fg = palette.red, bg = palette.none }, -- For keywords that don't fall in previous categories.
		TSKeywordFunction = { fg = palette.red, bg = palette.none }, -- For keywords used to define a fuction.
		TSKeywordOperator = { fg = palette.red, bg = palette.none }, -- for operators that are English words, e.g. `and`, `as`, `or`.
		TSLabel = { fg = palette.green, bg = palette.none }, -- For labels: `label:` in C and `:label:` in Lua.
		TSMethod = { fg = palette.green, bg = palette.none }, -- For method calls and definitions.
		TSNamespace = { fg = palette.blue, bg = palette.none }, -- For identifiers referring to modules and namespaces.
		TSNone = { fg = palette.none, bg = palette.none }, -- For no highlighting.
		TSNumber = { fg = palette.purple, bg = palette.none }, -- For all numbers
		TSOperator = { fg = palette.orange, bg = palette.none }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = palette.white, bg = palette.none }, -- For parameters of a function.
		TSParameterReference = { fg = palette.white, bg = palette.none }, -- For references to parameters of a function.
		TSProperty = { fg = palette.green, bg = palette.none }, -- Same as `TSField`.
		TSPunctDelimiter = { fg = palette.light_gray, bg = palette.none }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = palette.light_gray, bg = palette.none }, -- For brackets and parens.
		TSPunctSpecial = { fg = palette.light_gray, bg = palette.none }, -- For special punctutation that does not fall in the catagories before.
		TSRepeat = { fg = palette.red, bg = palette.none }, -- For keywords related to loops.
		TSString = { fg = palette.yellow, bg = palette.none }, -- For strings.
		TSStringRegex = { fg = palette.orange, bg = palette.none }, -- For regexes.
		TSStringEscape = { fg = palette.purple, bg = palette.none }, -- For escape characters within a string.
		TSSymbol = { fg = palette.white, bg = palette.none }, -- For identifiers referring to symbols or atoms.
		TSTag = { fg = palette.red, bg = palette.none }, -- Tags like html tag names.
		TSTagDelimiter = { fg = palette.blue, bg = palette.none }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = palette.white, bg = palette.none }, -- For strings considered text in a markup language.
		TSStrong = { fg = palette.white, bg = palette.none }, -- For text to be represented in bold.
		TSEmphasis = { fg = palette.white, bg = palette.none }, -- For text to be represented with emphasis.
		TSUnderline = { fg = palette.white, bg = palette.none }, -- For text to be represented with an underline.
		TSStrike = { fg = palette.white, bg = palette.none }, -- For strikethrough text.
		TSTitle = { fg = palette.white, bg = palette.none }, -- Text that is part of a title.
		TSLiteral = { fg = palette.white, bg = palette.none }, -- Literal text.
		TSURI = { fg = palette.blue, bg = palette.none }, -- Any URI like a link or email.
		TSMath = { fg = palette.green, bg = palette.none }, -- For LaTex-like math environments.
		TSTextReference = { fg = palette.white, bg = palette.none }, -- For footnotes, text references, citations.
		TSEnviroment = { fg = palette.white, bg = palette.none }, -- For text environments of markup languages.
		TSEnviromentName = { fg = palette.white, bg = palette.none }, -- For the name/the string indicating the type of text environment.
		TSNote = { fg = palette.white, bg = palette.none }, -- Text representation of an informational note.
		TSWarning = { fg = palette.blue, bg = palette.none }, -- Text representation of a warning note.
		TSDanger = { fg = palette.red, bg = palette.none }, -- Text representation of a danger note.
		TSType = { fg = palette.cyan, bg = palette.none }, -- For types.
		TSTypeBuiltin = { fg = palette.cyan, bg = palette.none }, -- For builtin types.
		TSVariable = { fg = palette.white, bg = palette.none }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = palette.red, bg = palette.none }, -- Variable names that are defined by the languages, like `this` or `self`.
	}

	local plugin_highlight_groups = {
		-- NvimTree
		-- NvimTreeSymlink
		NvimTreeFolderName = { fg = palette.white, bg = palette.none },
		NvimTreeRootFolder = { fg = palette.purple, bg = palette.none },
		NvimTreeFolderIcon = { fg = palette.blue, bg = palette.none },
		NvimTreeEmptyFolderName = { fg = palette.light_gray, bg = palette.none },
		NvimTreeOpenedFolderName = { fg = palette.purple, bg = palette.none },
		-- NvimTreeExecFile
		-- NvimTreeOpenedFile
		-- NvimTreeSpecialFile
		-- NvimTreeImageFile
		-- NvimTreeMarkdownFile
		NvimTreeIndentMarker = { fg = palette.yeet, bg = palette.none },

		-- Indent-Blankline
		IndentBlanklineChar = { fg = palette.yeet, bg = palette.none }, -- Highlight of indent character.
		-- IndentBlanklineSpaceChar = {}, -- Highlight of space character.
		-- IndentBlanklineSpaceCharBlankline = {}, -- Highlight of space character on blank lines.
		IndentBlanklineContextChar = { fg = palette.gray, bg = palette.none }, -- Highlight of indent character when base of current context.

		-- -- GitSigns
		GitSignsAdd = { fg = palette.green, bg = palette.none }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = palette.blue, bg = palette.none }, -- diff mode: Added line |diff.txt|
		GitSignsDelete = { fg = palette.red, bg = palette.none }, -- diff mode: Added line |diff.txt|

		-- Hop
		HopNextKey = { fg = palette.purple, bg = palette.black },
		HopNextKey1 = { fg = palette.black, bg = palette.blue },
		HopNextKey2 = { fg = palette.black, bg = palette.red },
		HopUnmatched = { fg = palette.gray, bg = palette.black },

		-- Lightspeed
		LightspeedLabel = { fg = palette.black, bg = palette.red },
		LightspeedLabelDistant = { fg = palette.black, bg = palette.purple },
		LightspeedMaskedChar = { fg = palette.black, bg = palette.blue },
		LightspeedShortcut = { fg = palette.black, bg = palette.red },
		LightspeedGreyWash = { fg = palette.gray, bg = palette.none },
		LightspeedUnlabeledMatch = { fg = palette.purple, bg = palette.black },
		LightspeedOneCharMatch = { fg = palette.black, bg = palette.purple },
		LightspeedCursor = { fg = palette.black, bg = palette.green },

		CmpDocumentation = { fg = palette.white, bg = palette.none },
		CmpDocumentationBorder = { fg = palette.white, bg = palette.none },

		InlayHints = { fg = palette.yeet, bg = palette.none },
	}

	for group, colors in pairs(builtin_highlight_groups) do
		highlight(group, colors)
	end

	for group, colors in pairs(syntax_highlight_groups) do
		highlight(group, colors)
	end

	for group, colors in pairs(treesitter_highlight_groups) do
		highlight(group, colors)
	end

	for group, colors in pairs(plugin_highlight_groups) do
		highlight(group, colors)
	end

	vim.g.terminal_color_0 = palette.black
	vim.g.terminal_color_1 = palette.red
	vim.g.terminal_color_2 = palette.green
	vim.g.terminal_color_3 = palette.yellow
	vim.g.terminal_color_4 = palette.blue
	vim.g.terminal_color_5 = palette.purple
	vim.g.terminal_color_6 = palette.cyan
	vim.g.terminal_color_7 = palette.white
	vim.g.terminal_color_8 = palette.light_gray
	vim.g.terminal_color_9 = palette.red
	vim.g.terminal_color_10 = palette.green
	vim.g.terminal_color_11 = palette.yellow
	vim.g.terminal_color_12 = palette.blue
	vim.g.terminal_color_13 = palette.purple
	vim.g.terminal_color_14 = palette.cyan
	vim.g.terminal_color_15 = palette.white

	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticError", "1", palette.red))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticWarn", "3", palette.yellow))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticInfo", "4", palette.blue))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticHint", "7", palette.blue))

	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticSignError", "1", palette.red))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticSignWarn", "3", palette.yellow))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticSignInfo", "4", palette.blue))
	vim.cmd(string.format("highlight %s ctermfg=%s guifg=%s", "DiagnosticSignHint", "7", palette.blue))

	vim.cmd(
		string.format("highlight %s cterm=underline gui=underline guisp=%s", "DiagnosticUnderlineError", palette.red)
	)
	vim.cmd(
		string.format("highlight %s cterm=underline gui=underline guisp=%s", "DiagnosticUnderlineWarn", palette.yellow)
	)
	vim.cmd(
		string.format("highlight %s cterm=underline gui=underline guisp=%s", "DiagnosticUnderlineInfo", palette.blue)
	)
	vim.cmd(
		string.format("highlight %s cterm=underline gui=underline guisp=%s", "DiagnosticUnderlineHint", palette.blue)
	)
end

return M
