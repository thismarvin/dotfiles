" Change default keys to reflect Workman.
let g:EasyMotion_keys = 'ashtgyneoiqdrwbjfupzxmcvkl'

" Disable default mappings.
let g:EasyMotion_do_mapping = 0 

" Keep cursor column when using a JK motion.
let g:EasyMotion_startofline = 0 

" Turn on case-insensitive feature.
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f2)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

