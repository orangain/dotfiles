#!/bin/sh

set -ex

cwd=$( cd `dirname ${0}` && pwd )

ln -sf $cwd/vimfiles ~/.vim
ln -sf $cwd/_vimrc ~/.vimrc
ln -sf $cwd/_gvimrc ~/.gvimrc
ln -sf $cwd/_gitconfig ~/.gitconfig
ln -sf $cwd/_gitignore ~/.gitignore
