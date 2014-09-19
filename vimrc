" vinter vim rc file
"
" Do not modify this file directly, use .vimrc.local instead

"
" Vundle configuration
"

" Vundle: Configure
set nocompatible
filetype on     " Avoid a zero exit status later due to filetype off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle: Install plugins
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

if filereadable(expand("~/.vimrc.plugins.local"))
  source ~/.vimrc.plugins.local
endif

" Vundle: Wrap up
call vundle#end()
syntax enable
filetype plugin indent on

"
" Vim configuration
"
set autoindent                                              " take indent for new line from previous line
set autoread                                                " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                             " Fix broken backspace in some setups
set backupcopy=yes                                          " see :help crontab
set clipboard=unnamed                                       " yank and paste with the system clipboard
set completeopt-=preview                                    " don't show the scratch preview window
set cursorline                                              " highlight current line
set directory-=.                                            " don't store swapfiles in the current directory
set encoding=utf-8                                          " encoding used internally
set expandtab                                               " expand tabs to spaces
set hidden                                                  " don't unload the buffer when abandoned
set history=1000                                            " remember more commands and searches
set incsearch                                               " search as you type
set laststatus=2                                            " always show statusline
set list                                                    " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set mouse=a
set number                                                  " show line numbers
set nobackup                                                " don't create backup files
set noerrorbells                                            " turn off error beeps
set nospell                                                 " disable spell check
set noswapfile                                              " don't create swap files
set wrap                                                    " enable wrapping
set relativenumber                                          " use relative numbers in side bar
set ruler                                                   " show where you are
set scrolloff=3                                             " show context above/below cursorline
set shiftwidth=2                                            " normal mode indentation commands use 2 spaces
set showcmd                                                 " show command in status line
set smartcase                                               " case-sensitive search if any caps
set softtabstop=2                                           " insert mode tab and backspace use 2 spaces
set tabstop=8                                               " actual tabs occupy 8 characters
set title                                                   " let vim set the terminal title
set undolevels=1000                                         " allow more undos
set visualbell                                              " use visual bell instead of beeping
set wildignore=*/log/*,*/node_modules/*,*/target/*,*/tmp/*,*.rbc,*.pyc,*.swp,*.bak
set wildmenu                                                " show a navigable menu for tab completion
set wildmode=longest,list,full

"
" Folding
"

set foldmethod=indent                                       " folding type
set foldnestmax=10                                          " maximum fold depth
set nofoldenable                                            " set to display all folds
set foldlevel=1                                             " initial foldlevel when starting editing

"
" Keyboard shortcuts
"
let mapleader = ','

" Move between buffers with Shift + arrow key
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

" Replace selected text with buffer
vmap r "_dP

" Close an open buffer using the bclose.vim plugin
nnoremap <leader>w :Bclose<CR>

"
" NERDTree configuration
"

" Keybindings
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Files to ignore
let NERDTreeIgnore=['\~$', '\.pyc$', '^\.DS_Store$', '^node_modules$']

" Open if no specific file was opened when launching vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDtree is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"
" emmet-vim configuration
"

" Only enable emmet for HTML and CSS files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"
" delimitMate configuration
"

" Autoclose brackets
let delimitMate_autoclose = 1

" Expand <CR> characters
let delimitMate_expand_cr = 2

" Expand <space> characters
let delimitMate_expand_space = 1

" Try to balance brackets on the current line
let delimitMate_balance_matchpairs = 1

" Enable smart quote handling
let delimitMate_smart_quotes = 1

" Enable smart brackets handling
let delimitMate_smart_matchpairs = 1

" Allow nested quoting in Python
au FileType python let b:delimitMate_nesting_quotes = ['"',"'"]

"
" vim-json configuration
"

" Disable concealing
let g:vim_json_syntax_conceal = 0

" Enable syntax folding for javascript files
au FileType json setlocal foldmethod=syntax

"
" Plexer settings
"

nnoremap <leader>pa :Plexer add<CR>
nnoremap <leader>pA :Plexer apply<CR>
nnoremap <leader>pc :Plexer clear<CR>
nnoremap <leader>ph :Plexer hide<CR>
nnoremap <leader>ps :Plexer show<CR>


"
" Tagbar configuration
"

" Keybindings
nmap <leader>T :TagbarToggle<CR>

"
" neocomplcache configuration
"

" Enable neocomplcache on start
let g:neocomplcache_enable_at_startup = 1

"
" Python-mode configuration
"

" Disable automatic folding
let g:pymode_folding = 0

" Disable rope code completion
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

"
" Filetype fixes
"

" .md files should be treated as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

"
" Read local configuration
"
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

