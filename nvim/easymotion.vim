" Change default keys to reflect Workman.
let g:EasyMotion_keys = 'ashgyeoqdrwbfup;zxmcvkltni'

" Disable default mappings.
let g:EasyMotion_do_mapping = 0

" Keep cursor column when using a JK motion.
let g:EasyMotion_startofline = 0

" Turn on case-insensitive feature.
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f)

map <Leader><Right> <Plug>(easymotion-lineforward)
map <Leader><Down> <Plug>(easymotion-j)
map <Leader><Up> <Plug>(easymotion-k)
map <Leader><Left> <Plug>(easymotion-linebackward)

