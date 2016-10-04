"
" NERDTree configuration
"

" Keybindings
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" Files to ignore
let NERDTreeIgnore=['\~$', '\.pyc$', '^\.DS_Store$', '^node_modules$', '.git', '.ropeproject', '__pycache__']

" Open if no specific file was opened when launching vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDtree is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default
let NERDTreeShowHidden=1
