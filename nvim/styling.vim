if has('termguicolors')
	set termguicolors
endif

" Gruvbox Material.
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1   
let g:gruvbox_material_diagnostic_line_highlight = 1
colorscheme gruvbox-material

"" Edge.
"let g:edge_transparent_background = 0
"let g:edge_diagnostic_line_highlight = 1
"colorscheme edge

"" Sonokai.
"let g:sonokai_style = 'andromeda'
""let g:sonokai_transparent_background = 1
"let g:sonokai_diagnostic_line_highlight = 1
"colorscheme sonokai

" Jellybeans.
"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}
"if has('termguicolors') && &termguicolors
    "let g:jellybeans_overrides['background']['guibg'] = 'none'
"endif
"colorscheme jellybeans

" Make the background transparent.
function! TransparentMode()
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
endfunction

augroup style_commands
    autocmd!
    autocmd VimEnter * silent call TransparentMode()
augroup end

