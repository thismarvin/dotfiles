local execute = require("utils").execute
local has = require("utils").has
local set = require("utils").set

if has("termguicolors") then
    set("termguicolors")
end

execute([[
" Makes the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

function! ThemeGruvboxMaterial()
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_diagnostic_line_highlight = 1

  colorscheme gruvbox-material

  hi LspDiagnosticsVirtualTextError guifg=#ea6962
  hi LspDiagnosticsVirtualTextWarning guifg=#d8a657
  hi LspDiagnosticsVirtualTextInformation guifg=#89b482
  hi LspDiagnosticsVirtualTextHint guifg=#89b482
endfunction

augroup styling
  autocmd!
  autocmd VimEnter * silent call ThemeGruvboxMaterial()
augroup end
]])
