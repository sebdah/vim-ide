"
" Split configuration
"

" Create horizontal splits below the current window
set splitbelow
set splitright

" Tmux vim integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" Move between splits with ctrl+h,j,k,l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Creating splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Close splits
nnoremap <leader>q :close<CR>
