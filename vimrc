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
filetype plugin indent on

"
" Vim configuration
"
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set mouse=a

" Enable syntax highlighting
syntax on

" Set default colorscheme
colorscheme elflord

"
" Filetype fixes
"

" .md files should be treated as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

"
" Read local configuration
"
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

