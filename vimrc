syntax on
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
filetype plugin indent on

set number
autocmd Filetype html setlocal ts=2 sts=2 sw=2 et
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2 et
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
