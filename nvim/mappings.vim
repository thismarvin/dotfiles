let mapleader = " "

" Emulates some Windows shortcuts.
nnoremap <C-s> :w<CR>
nnoremap <C-a> ggVG

" Alternative means of entering Normal Mode. (Also saves on enter).
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Faster way to exit terminal mode.
tnoremap <C-s> <C-\><C-N>

" Alternative means of redoing an action.
nnoremap U <C-r>

" Alternative means of closing a window.
nnoremap <C-q> :q<CR>

" Easier way to enter window navigation.
nnoremap <leader>w <C-w>

" Emulates vscode's line moving functionality.
nnoremap <silent><S-Down> :m .+1<CR>==
nnoremap <silent><S-Up> :m .-2<CR>==
inoremap <silent><S-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><S-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><S-Down> :m '>+1<CR>gv=gv
vnoremap <silent><S-Up> :m '<-2<CR>gv=gv

" Slightly faster way to copy a whole line.
nnoremap <leader>y yy

" Better tabbing.
vnoremap < <gv
vnoremap > >gv

" Delete text.
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Turn off search highlighting during screen redraw.
nnoremap <silent><C-L> :noh<CR><C-L>
nnoremap <silent><leader>n :noh<CR>

" Save one keystoke when entering commands!
nnoremap ; :

" Create a blank new line, but stay in normal mode.
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Always center the window when iterating through searches.
nnoremap n nzz
nnoremap N Nzz

" Make Y act like D and C.
nnoremap Y y$

" Change the working directory to that of the current open file.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Toggle the built in spell checker.
nnoremap <silent><F12> :setlocal spell!<CR>

" Faster way to create a new terminal.
nnoremap <silent><leader>st :split<CR>:terminal pwsh<CR>i
nnoremap <silent><leader>vt :vsplit<CR>:terminal pwsh<CR>i

