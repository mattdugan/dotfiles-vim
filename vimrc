" reset to vim-defaults
if &compatible          " only if not set before:
  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" Install Pathogen so plugins will work
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set scrolloff=8         " 8 lines above/below cursor when scrolling, vim-sensible uses 1
set sidescroll=1        " enable side scrolling
set sidescrolloff=10    " 10 character read ahead when scrolling horizontally on a line
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildmode=list:longest " default sort order when completing to longest match
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html
set foldmethod=indent   " Fold based on indentation level rather than block delimiter
set foldnestmax=3       " Don't nest more than 3 folds together
set foldminlines=2      " Don't fold just one line
set foldenable          " Turn on folding by default
set cursorline          " Highlight the line containing the current cursor position
set colorcolumn=80      " Show a line at the 80 character mark, use as a margin hint
colorscheme molokai     " Colorschemes make things beautiful

" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set expandtab           " turn a tabs into spaces
set linebreak           " Soft-break lines at sensible points, enter inserts a hard break
set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode


" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
  " Clean looking GVIM settings
  set guioptions=acei " No scrollbars, menu bar or toolbars.
  set guifont=Liberation\ Mono\ 12
  set linespace=1    " Add a little padding between lines for comfort
endif

" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" file type specific settings
if has("autocmd")
  " For debugging
  "set verbose=9

  " if bash is sh.
  let bash_is_sh=1

  " change to directory of current file automatically
  autocmd BufEnter * lcd %:p:h

  " Put these in an autocmd group, so that we can delete them easily.
  augroup type_specific_editor
    au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
    au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

    " Confirm to PEP8 when editing python
    au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
  augroup END

  " Always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 

  " Attempt to watch for external edits to files in buffers and reload if possible
  set autoread
  augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
  augroup END
endif " has("autocmd")

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
