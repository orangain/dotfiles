
Getting Started
---------------

```
git clone https://github.com/orangain/dotfiles

./dotfiles/setup.sh

# then execute vim & type :BundleInstall
```

In Windows 7
------------

### Run as Administrator

```
cd %USERPROFILE%\dotfiles
mklink %USERPROFILE%\_vimrc dotfiles\_vimrc
mklink %USERPROFILE%\_gvimrc dotfiles\_gvimrc
mklink /d %USERPROFILE%\vimfiles dotfiles\vimfiles
```

### Run as Normal User

```
cd %USERPROFILE%\dotfiles
git submodule update --init
```