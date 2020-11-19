call plug#begin(stdpath('data') . '/plugged')

" Essentials.
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'editorconfig/editorconfig-vim'

" QOL.
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" COC.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" C# Support.
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'dense-analysis/ale'

" Interface. 
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'wfxr/minimap.vim'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'

" Color Themes.
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'nanotech/jellybeans.vim'

call plug#end()

