#!/usr/bin/env bash
# Sync the dotfiles
rsync -aPhr --delete --filter="merge $HOME/.config/scripts/backup_config.filter" ~/.config/. ~/dotfiles/dotfiles/.config/

echo "==================== SYNCING FILES ===================="
# Also sync the config files that live in the home directory
rsync -aPh --include='.bashrc_custom' --include='.vimrc' --include='.tmux.conf' --exclude='/**' ~/ ~/dotfiles/dotfiles/
