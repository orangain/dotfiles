
Getting Started
---------------

```
git clone https://github.com/orangain/dotfiles

./dotfiles/setup.sh

# then execute vim & type :BundleInstall
```

In Windows XP
-------------

```
fsutil hardlink create $HOME\_vimrc dotfiles\_vimrc
fsutil hardlink create $HOME\_gvimrc dotfiles\_gvimrc
linkd $HOME\vimfiles dotfiles\vimfiles
```
