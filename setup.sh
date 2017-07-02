#!/bin/sh

set -ex

cwd=$( cd `dirname ${0}` && pwd )

$cwd/mksymlinks.sh

if [ -f ~/.bashrc ]; then
    echo "" >> ~/.bashrc
    echo ". ~/dotfiles/_bashrc" >> ~/.bashrc
else
    echo "" >> ~/.bash_profile
    echo ". ~/dotfiles/_bashrc" >> ~/.bash_profile
fi

(cd ~/dotfiles; git submodule update --init)

vim +BundleInstall
echo "Setup completed."
