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
if filereadable(expand("~/.vim/vimrc.plugins"))
  source ~/.vim/vimrc.plugins
endif

if filereadable(expand("~/.vimrc.plugins.local"))
  source ~/.vimrc.plugins.local
endif

" Vundle: Wrap up
call vundle#end()
syntax enable
filetype plugin indent on
