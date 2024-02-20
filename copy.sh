#!/bin/zsh

# Copy files
cp .zshrc ~/
cp .vimrc ~/
cp -r .themes/ ~/
cp -r .config/ ~/
cp -r .fonts/ ~/

# Load any dconf configurations
dconf load /com/gexperts/Tilix/ < tilix.dconf

# Source zshrc
source ~/.zshrc
