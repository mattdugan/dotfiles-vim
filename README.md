dotfiles-vim
============

VIM Configuration for ~/.vim

To install, first clone the repository.  Then run the following
commands, ensuring that each completes successfully:

`git clone https://github.com/mattdugan/dotfiles-vim.git ~/.vim`
`cd ~/.vim`
`git submodule init`
`git submodule update`
`ln -sf ~/.vim/vimrc ~/.vimrc`

To add new plugins, a convenience script can be run, like so:

`~/.vim/git-vim-plugin.sh https://github.com/<user>/<repository>.git`

To ensure plugin code stays up to date, or to retrieve current 
updates to any plugin, simply use the `git submodule update`
command anytime.

