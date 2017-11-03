#!/bin/sh

set -ex

cwd=$( cd `dirname ${0}` && pwd )

ln -sf $cwd/vimfiles ~/.vim
ln -sf $cwd/_vimrc ~/.vimrc
ln -sf $cwd/_gvimrc ~/.gvimrc
ln -sf $cwd/_gitconfig ~/.gitconfig
ln -sf $cwd/_gitignore ~/.gitignore
ln -sf $cwd/_jscsrc ~/.jscsrc

if [[ "$OSTYPE" == "darwin"* ]]; then
	CODE_DIR=~/Library/Application\ Support/Code/User
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
	CODE_DIR=~/.config/Code/User
fi

if [[ -n "$OSTYPE" ]]; then
	mkdir -p $CODE_DIR
	ln -sf $cwd/Code/settings.json "$CODE_DIR/settings.json"
fi
