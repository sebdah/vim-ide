"
" Split configuration
"

" Natural splits
set splitbelow
set splitright

" Move between splits with ctrl+h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Creating splits
nnoremap <C-v> :vsplit<CR>
nnoremap <C-h> :split<CR>
