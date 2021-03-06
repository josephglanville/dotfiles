syntax on
set nocompatible               " be iMproved

call plug#begin('~/.vim/plugged')
Plug 'cespare/vim-toml'
Plug 'dpwright/vim-tup'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'gmarik/vundle'
Plug 'google/vim-jsonnet'
Plug 'groenewege/vim-less'
Plug 'hashivim/vim-terraform'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/pgsql.vim'
Plug 'littleq0903/vim-nginx'
Plug 'majutsushi/tagbar'
Plug 'ngmy/vim-rubocop'
Plug 'nono/vim-handlebars'
Plug 'plasticboy/vim-markdown'
Plug 'rakr/vim-one'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'smerrill/vagrant-vim'
Plug 'tfnico/vim-gradle'
Plug 'uarun/vim-protobuf'
Plug 'udalov/kotlin-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'withgod/vim-sourcepawn'
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
autocmd Filetype jsonnet setlocal ts=2 sts=2 sw=2

let g:indentLine_color_term = 238
let g:jellybeans_term_trans = 1
let g:ruby_path='/usr/bin/ruby'

" JSON settings
let g:vim_json_syntax_conceal = 0

" Go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Rust settings
let g:rustfmt_autosave = 1

" Terraform settings
let g:terraform_fmt_on_save=1

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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
