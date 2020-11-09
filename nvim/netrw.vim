let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 22

augroup netrw_commands
  autocmd!
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'netrw') | q | endif
augroup end

