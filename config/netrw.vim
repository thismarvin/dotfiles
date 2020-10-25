let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 22

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'netrw') | q | endif
