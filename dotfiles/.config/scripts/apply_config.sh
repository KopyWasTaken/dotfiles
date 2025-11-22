#!/usr/bin/env bash

echo "==================== Applying Config Folders ===================="
rsync -aPhr --delete --filter="merge $HOME/dotfiles/dotfiles/.config/scripts/config.filter" ~/dotfiles/dotfiles/.config/ ~/.config/. 

echo "==================== Applying Loose Files ===================="
rsync -aPh --include='.bashrc_custom' --include='.vimrc' --include='.tmux.conf' --exclude='/**' ~/dotfiles/dotfiles/ ~/
