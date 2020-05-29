# dotfiles

## Getting Started

```
git clone https://github.com/orangain/dotfiles

cd dotfiles

ln -sf $(pwd)/_zshrc ~/.zshrc
ln -sf $(pwd)/_vimrc ~/.vimrc
ln -sf $(pwd)/_gitconfig ~/.gitconfig
mkdir -p ~/.config/git && ln -sf $(pwd)/_gitignore ~/.config/git/ignore

# macOS
mkdir -p "~/Library/Application Support/Code/User" && ln -sf $(pwd)/Code/settings.json "~/Library/Application Support/Code/User/settings.json"
# Linux
mkdir -p "~/.config/Code/User" && ln -sf $(pwd)/Code/settings.json "~/.config/Code/User/settings.json"
```
