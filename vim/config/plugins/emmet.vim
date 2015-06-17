"
" emmet-vim configuration
"

" Only enable emmet for HTML and CSS files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Keyboard shortcut for Emmet
let g:user_emmet_leader_key='<leader>e'
