set noshowmode

let g:lightline = {
    \ 'colorscheme' : 'gruvbox_material',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'modified' ] , [ 'longfilename' ] ],
    \   'right': [ [], [ 'lineinfo' ] ]
    \ },
    \ 'component': {
    \   'longfilename': '%{FiletypeIcon()} %F',
    \   'gitbranch': ' %{FugitiveHead()}'
    \ }
    \ }

function! FiletypeIcon()
  return strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : ''
endfunction

