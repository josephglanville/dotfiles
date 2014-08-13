syntax on
set nocompatible               " be iMproved
filetype off                   " required!
set backspace=2 " make backspace work like most other apps
set t_Co=256

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'josephglanville/jellybeans.vim'
Bundle 'nono/vim-handlebars'
Bundle 'vim-ruby/vim-ruby'
Bundle 'smerrill/vagrant-vim'
Bundle 'majutsushi/tagbar'
Bundle 'jnwhiteh/vim-golang'
Bundle 'elzr/vim-json'
Bundle 'wting/rust.vim'
Bundle 'cespare/vim-toml'
"Bundle 'scrooloose/syntastic'
Bundle 'ngmy/vim-rubocop'
"Bundle 'Yggdroot/indentLine'
Bundle 'tfnico/vim-gradle'
filetype plugin indent on

nnoremap <silent> <F9> :TagbarToggle<CR>

set ts=4
set sw=4
set et
set ruler
set encoding=utf-8
set hlsearch
set number

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype handlebars setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

let g:indentLine_color_term = 238
let g:jellybeans_term_trans = 1

color peachpuff
