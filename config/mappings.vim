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

" Emulates some of vimium's tab behavior.
nnoremap J gT
nnoremap K gt
nnoremap <silent>t :tab new<CR>

" Alternative means of closing a window.
nnoremap <C-q> :q<CR>

" Slightly easier way to enter window navigation.
nnoremap <leader>w <C-w>

" Alternative means of creating a new split window.
nnoremap <silent><C-w>e :wincmd v<CR>
nnoremap <silent><leader>we :wincmd v<CR>

" Emulates vscode's line moving functionality.
nnoremap <silent><C-j> :m .+1<CR>==
nnoremap <silent><C-k> :m .-2<CR>==
inoremap <silent><C-j> <Esc>:m .+1<CR>==gi
inoremap <silent><C-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-j> :m '>+1<CR>gv=gv
vnoremap <silent><C-k> :m '<-2<CR>gv=gv

" Faster way to copy a whole line.
nnoremap <leader>y Vy

" Better tabbing.
vnoremap < <gv
vnoremap > >gv

" Delete text.
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Turn off search highlighting during screen redraw.
nnoremap <C-L> :noh<CR><C-L>

" Save one keystoke when entering commands!
nnoremap ; :

" Create a blank new line, but stay in normal mode.
nnoremap <leader>o o<Esc>

" Always center the window when iterating through searches.
nnoremap n nzz
nnoremap N Nzz

" Make Y move like D and C
nnoremap Y y$

" Change the working directory to that of the current open file.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

