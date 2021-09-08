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

function! ThemeGruvboxMaterial()
  let g:gruvbox_material_background = "hard"

  colorscheme gruvbox-material

  hi LspDiagnosticsVirtualTextError guifg=#ea6962
  hi LspDiagnosticsVirtualTextWarning guifg=#d8a657
  hi LspDiagnosticsVirtualTextInformation guifg=#89b482
  hi LspDiagnosticsVirtualTextHint guifg=#89b482

  hi HopNextKey guifg=#ea6962 gui=NONE
  hi HopNextKey1 guifg=#7daea3 gui=NONE
  hi HopNextKey2 guifg=#e78a4e gui=NONE
  hi HopUnmatched guifg=#928374 gui=NONE
	
	hi IndentBlanklineContextChar guifg=#928374
endfunction
]])
