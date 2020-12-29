if has('termguicolors')
  set termguicolors
endif

" Makes the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

function! ThemeGruvboxMaterial()
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_diagnostic_line_highlight = 1
  colorscheme gruvbox-material

  let g:lightline.colorscheme = 'gruvbox_material'
  call lightline#init()
  call lightline#colorscheme()
endfunction

function! ThemeEdge()
  let g:edge_diagnostic_line_highlight = 1
  colorscheme edge

  let g:lightline.colorscheme = 'edge'
  call lightline#init()
  call lightline#colorscheme()
endfunction

function! ThemeSonokai()
  let g:sonokai_style = 'andromeda'
  let g:sonokai_diagnostic_line_highlight = 1
  colorscheme sonokai

  let g:lightline.colorscheme = 'sonokai'
  call lightline#init()
  call lightline#colorscheme()
endfunction

function! ThemeJellybeans()
  colorscheme jellybeans
  highlight LineNr guibg=none
  let g:lightline.colorscheme = 'jellybeans'
  call lightline#init()
  call lightline#colorscheme()
endfunction

augroup style_commands
    autocmd!
    autocmd VimEnter * silent call ThemeGruvboxMaterial() | call TransparentMode()
augroup end

