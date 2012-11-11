
Getting Started
---------------

```
git clone https://github.com/orangain/dotfiles

ln -s dotfiles/vimfiles ~/.vim
ln -s dotfiles/_vimrc ~/.vimrc
ln -s dotfiles/_gvimrc ~/.gvimrc

git submodule init
git submodule update

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
