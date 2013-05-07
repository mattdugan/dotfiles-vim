" Install Pathogen
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Personalization (mostly set up by sensible)
syntax on
filetype plugin indent on
set nocompatible
set smartcase

