#!/bin/sh

# Update config files
cp -r ~/.zsh* .
cp ~/.gitconfig ~/.gitignore_global ~/.git-completion.bash ~/.hyper.js ~/.p10k.zsh .
cp -r ~/.config/colorls .config/
cp ~/.ssh/config .ssh/
code --list-extensions > code_extensions.txt
cp ~/Library/Application\ Support/Code/User/settings.json .
