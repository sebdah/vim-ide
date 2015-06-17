"
" Markdown configuration
"

" .md files should be treated as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell check markdown files
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
