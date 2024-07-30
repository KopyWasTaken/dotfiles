#!/usr/bin/env bash

# Install Oh-My-Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy over the zsh configuration
cp .zshrc $HOME/

# Source the Zsh configuration
source $HOME/.zshrc

# Install Homebrew if on Mac
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all of the homebrew stuff
#xargs brew install < leaves

# make the config directory if it doesn't exist yet
mkdir -p $HOME/.config

# move everything into the config 
cp -r ./.config/* $HOME/.config
