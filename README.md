
Getting Started
---------------

```
git clone https://github.com/orangain/dotfiles

ln -s dotfiles/_gitignore ~/.gitignore
ln -s dotfiles/_gitconfig ~/.gitconfig
ln -s dotfiles/vimfiles ~/.vim
ln -s dotfiles/_vimrc ~/.vimrc
ln -s dotfiles/_gvimrc ~/.gvimrc

cd dotfiles
git submodule update --init

vim
# then type :BundleInstall
```

In Windows XP
-------------

```
fsutil hardlink create $HOME\_vimrc dotfiles\_vimrc
fsutil hardlink create $HOME\_gvimrc dotfiles\_gvimrc
linkd $HOME\vimfiles dotfiles\vimfiles
```