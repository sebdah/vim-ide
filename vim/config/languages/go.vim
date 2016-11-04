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

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Mappings
au FileType go nmap <F9> :GoMetaLinter<cr>
au FileType go nmap <F10> <Plug>(go-test)
au FileType go nmap <F11> <Plug>(go-doc-vertical)
au FileType go nmap <F12> <Plug>(go-def)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
