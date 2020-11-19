let s:workman_mode = 0
function! WorkmanToggle()
  if s:workman_mode == 0
    let s:workman_mode = 1
    nnoremap j k
    nnoremap k j
  else
    let s:workman_mode = 0
    nnoremap j j
    nnoremap k k
  endif
endfunction

