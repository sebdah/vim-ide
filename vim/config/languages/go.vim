"
" Go language configuration
"

au FileType go let b:delimitMate_expand_space = 0
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Run goimports when running gofmt
au FileType go let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
au FileType go let g:go_highlight_functions = 1
au FileType go let g:go_highlight_methods = 1
au FileType go let g:go_highlight_structs = 1
au FileType go let g:go_highlight_operators = 1
au FileType go let g:go_highlight_build_constraints = 1

" Open the tagbar automatically
au FileType go TagbarOpen
