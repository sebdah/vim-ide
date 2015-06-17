"
" Ruby configuration
"

" Indentation config
au FileType ruby,eruby set expandtab
au FileType ruby,eruby set shiftwidth=2
au FileType ruby,eruby set softtabstop=2
au FileType ruby,eruby set tabstop=2

" Remove blank lines at the end of the file on save
au BufWritePre *.rb :%s#\($\n\s*\)\+\%$##
