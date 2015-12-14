"
" vim-json configuration
"

" Disable concealing
let g:vim_json_syntax_conceal = 0

" Enable syntax folding for javascript files
au FileType json setlocal foldmethod=syntax

au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set tabstop=2
au FileType json set softtabstop=2
