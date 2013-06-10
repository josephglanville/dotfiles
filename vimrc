syntax on
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'nanotech/jellybeans.vim'
Bundle 'nono/vim-handlebars'
Bundle 'vim-ruby/vim-ruby'
Bundle 'smerrill/vagrant-vim'
Bundle 'majutsushi/tagbar'
filetype plugin indent on

nnoremap <silent> <F9> :TagbarToggle<CR>

set ts=4
set sw=4
set et

set encoding=utf-8
set hlsearch
set number

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype handlebars setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
