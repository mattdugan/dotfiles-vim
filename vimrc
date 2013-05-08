" Don't worry about vi mode
set nocompatible

" Personalization (mostly set up by sensible)
set smartcase
set number
set autoread
set hidden
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set linebreak
set foldmethod=indent
set foldnestmax=3
set foldenable
set wildmode=list:longest
set scrolloff=8 "sensible uses 1
set sidescrolloff=15
set sidescroll=1

" Install Pathogen
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

" Powerline
"let g:Powerline_symbols = 'fancy'
set guifont=Liberation\ Mono\ for\ Powerline\ 12

" GVIM settings
set guioptions=
colorscheme vividchalk

