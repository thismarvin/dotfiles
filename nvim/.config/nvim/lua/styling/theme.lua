local execute = require("utils").execute
local has = require("utils").has
local set = require("utils").set

if has("termguicolors") then
	set("termguicolors")
end

vim.g.tokyonight_style = "night"
vim.g.tokyonight_dark_sidebar = true

vim.g.catppuccin_flavour = "latte"

require('kanagawa').setup({
	-- transparent = true,
	dimInactive = true,
	globalStatus = true,
})

-- execute([[colorscheme tokyonight]])
-- execute([[colorscheme kanagawa]])
execute([[colorscheme catppuccin]])

execute([[
" Makes the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction
]])
