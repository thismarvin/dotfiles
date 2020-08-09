let mapleader = " "

" Emulates some Window's shortcuts
nnoremap <C-s> :w<Enter>
nnoremap <C-a> ggVG

" Alternative means of entering Normal Mode
inoremap <C-s> <Esc>
vnoremap <C-s> <Esc>

" Alternative means of redoing an action
nnoremap U <C-r>

" Emulates vimium tab navigation
nnoremap J gT
nnoremap K gt

" Emulates vscode's line moving functionality
nnoremap <silent><C-j> :m .+1<Enter>==
nnoremap <silent><C-k> :m .-2<Enter>==
inoremap <silent><C-j> <Esc>:m .+1<Enter>==gi
inoremap <silent><C-k> <Esc>:m .-2<Enter>==gi
vnoremap <silent><C-j> :m '>+1<Enter>gv=gv
vnoremap <silent><C-k> :m '<-2<Enter>gv=gv

" Faster way to copy a line
nnoremap <leader>y Vy

" Better tabbing.
vnoremap < <gv
vnoremap > >gv

