"
" Split configuration
"

" Create horizontal splits below the current window
set splitbelow

" Move between splits with ctrl+h,j,k,l
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Creating splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Close splits
nnoremap <leader>q :close<CR>
