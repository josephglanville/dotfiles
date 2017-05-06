syntax on
set nocompatible               " be iMproved

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'gmarik/vundle'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'nono/vim-handlebars'
Plug 'vim-ruby/vim-ruby'
Plug 'smerrill/vagrant-vim'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'littleq0903/vim-nginx'
Plug 'uarun/vim-protobuf'
Plug 'ngmy/vim-rubocop'
Plug 'tfnico/vim-gradle'
Plug 'scrooloose/nerdcommenter'
Plug 'withgod/vim-sourcepawn'
Plug 'dpwright/vim-tup'
call plug#end()

nnoremap <silent> <F9> :TagbarToggle<CR>

set ts=4
set sw=4
set et
set ruler
set encoding=utf-8
set hlsearch
set number
set backspace=2 " make backspace work like most other apps
set t_Co=256
set nofoldenable

autocmd Filetype sh setlocal ts=2 sts=2 sw=2
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
let g:ruby_path='/usr/bin/ruby'

" Go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Use One Dark colorscheme
if (empty($TMUX))
  if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 <
	"https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark " for the dark version
colorscheme one

" Fix YAML key matching
autocmd FileType yaml execute 
            \'syn match yamlBlockMappingKey /^\s*\zs[a-zA-Z0-9 ]*\ze\s*:\%(\s\|$\)/ '.
            \'nextgroup=yamlKeyValueDelimiter'
