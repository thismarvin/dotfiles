set noshowmode

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ] , [ 'readonly', 'filename' ] ],
    \   'right': [ [], [ 'fileicon' ] ] 
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [] ] 
    \ },
    \ 'component_function': {
    \   'filename' : 'LightlineFileName',
    \   'fileicon' : 'LightlineFiletypeIcon',
    \   'gitbranch' : 'LightlineGitBranch'
    \ },
    \ 'mode_map': {
    \   'n' : 'N',
    \   'i' : 'I',
    \   'R' : 'R',
    \   'v' : 'V',
    \   'V' : 'VL',
    \   "\<C-v>": 'VB',
    \   'c' : 'C',
    \   's' : 'S',
    \   'S' : 'SL',
    \   "\<C-s>": 'SB',
    \   't': 'T',
    \ }
    \ }

function! LightlineFileName()
    if winwidth(0) < 70
        return ''
    endif
    let filename = expand('%:t')
    let modified = &modifiable && &modified ? ' +' : ''
    return filename . modified 
endfunction

function! LightlineFiletypeIcon()
    return strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : ''
endfunction

function! LightlineGitBranch()
    if winwidth(0) < 70
        return ''
    endif
    let branch = FugitiveHead()
    return branch == '' ? '' : ' ' . branch
endfunction

