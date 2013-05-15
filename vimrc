" Don't worry about vi mode
set nocompatible

" Personalization (mostly set up by sensible)
set background=dark
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
set ignorecase
set smartcase

" Install Pathogen
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme molokai

" Powerline
"let g:Powerline_symbols = 'fancy'

" GVIM settings
if has("gui_running")
  set guioptions=acei
  set guifont=Liberation\ Mono\ for\ Powerline\ 12
endif

" NetRW settings
let g:netrw_altv = 1 " vsplit open to the /right/
let g:netrw_list_hide = ".svn,.git,.class,.pyc,.settings,.*\.swp"
let g:netrw_keepdir = 0 " follow the browsing directory
" Try to use split-open instead of file-drawer functionality
" let g:netrw_browse_split = 2 " vsplit by default
let g:netrw_liststyle = 3 " tree view by default
let g:netrw_special_syntax = 1 " differentiate special file types
let g:netrw_use_noswf = 1 " no swap files
let g:netrw_menu = 0 " no menu
let g:netrw_preview = 1 " vsplit for preview
