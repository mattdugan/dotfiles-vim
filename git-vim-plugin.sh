#!/bin/sh

GITHUB=$(echo $1 | sed 's/git:/https:/')
MODULE=$(echo $GITHUB | sed 's/.*github.com\///;s/.git//')
PLUGIN=$(echo $MODULE | sed 's/.*\/vim-//')

cd ~/.vim

echo ""
echo "============================================"
echo "Installing vim plugin as git submodule:"
echo "GitHub: $GITHUB"
echo "Module: $MODULE"
echo "Plugin: $PLUGIN"
echo "============================================"
echo ""

git submodule add $GITHUB bundle/$PLUGIN && \
  git add . && \
  git commit -m "Install $MODULE submodule"

cd -

