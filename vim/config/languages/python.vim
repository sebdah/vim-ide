"
" Python configuration
"

" Enable auto indenting
au FileType python let g:pymode_indent = 1

" Enable pymode lint checking
au FileType python let g:pymode_lint = 1
au FileType python let g:pymode_lint_on_write = 1
au FileType python let g:pymode_lint_checkers = ['pep8']
au FileType python let g:pymode_lint_ignore = "F0002"

" Disable automatic folding
au FileType python let g:pymode_folding = 0

" Disable rope code completion
au FileType python let g:pymode_rope_lookup_project = 0
au FileType python let g:pymode_rope_completion = 1
au FileType python let g:pymode_rope_complete_on_dot = 1

" Documentation
au FileType python let g:pymode_doc = 0
au FileType python let g:pymode_doc_bind = '<F11>'
