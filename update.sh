#!/bin/bash

# These aren't needed / used at the moment
# rm .zshenv
# cp ~/.zshenv .

rm -r .config

mkdir -p .config/alacritty
cp ~/.config/alacritty/alacritty.toml .config/alacritty

mkdir -p .config/zsh
cp ~/.config/zsh/.start .config/zsh
cp ~/.config/zsh/.zshrc .config/zsh

mkdir -p .config/nvim
cp -r ~/.config/nvim/lua .config/nvim/lua
cp ~/.config/nvim/init.lua .config/nvim
