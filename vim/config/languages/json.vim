"
" vim-json configuration
"

" Disable concealing
let g:vim_json_syntax_conceal = 0

" Enable syntax folding for javascript files
au FileType json setlocal foldmethod=syntax
