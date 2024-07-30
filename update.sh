#!/usr/bin/env bash

# These aren't needed / used at the moment
# rm .zshenv
# cp ~/.zshenv .

# remove everything that currently exists here
rm -r .config

# Copy over the alacritty stuff
mkdir -p .config/alacritty
cp ~/.config/alacritty/alacritty.toml .config/alacritty

# Copy over the zsh stuff 
rm .zshrc
scp ~/.zshrc .

# Copy over the neovim config
mkdir -p .config/nvim
cp -r ~/.config/nvim/lua .config/nvim/lua
cp ~/.config/nvim/init.lua .config/nvim
