"
" Split configuration
"

" Natural splits
set splitbelow
set splitright

" Move between splits with ctrl+h,j,k,l
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Creating splits
nnoremap <C-S-v> :vsplit<CR>
nnoremap <C-S-h> :split<CR>
