local execute = require("utils").execute
local has = require("utils").has
local set = require("utils").set

if has("termguicolors") then
	set("termguicolors")
end

execute([[colorscheme groovemat]])

execute([[
" Makes the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction
]])
