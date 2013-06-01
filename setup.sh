#!/bin/sh

set -ex

cwd=$( cd `dirname ${0}` && pwd )

$cwd/mksymlinks.sh

if [ -f ~/.bashrc ]; then
    echo "source dotfiles/_bashrc" >> ~/.bashrc
else
    echo "source dotfiles/_bashrc" >> ~/.bash_profile
fi

$(cd dotfiles; git submodule update --init)

echo "Setup completed."
echo "Execute vim & type :BundleInstall"
