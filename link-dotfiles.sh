#!/usr/bin/env bash

# dotfiles repo location
DOTFILES_DIR=~/dev/dotfiles
BACKUP_DIR=~/dotfiles_backup_$(date +%Y%m%d%H%M)

mkdir -p "$BACKUP_DIR"

link() {
  local src="$DOTFILES_DIR/$1"
  local dest="$HOME/$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi

  echo "🔗 Linking $src → $dest"
  ln -s "$src" "$dest"
}

# Top-level dotfiles
link ".zshrc" ".zshrc"
link ".zprofile" ".zprofile"
link ".zshenv" ".zshenv"
link ".bashrc" ".bashrc"
link ".p10k.zsh" ".p10k.zsh"
link ".gitconfig" ".gitconfig"
link ".wezterm.lua" ".wezterm.lua"
link ".nanorc" ".nanorc"
link ".inputrc" ".inputrc"
link ".vimrc" ".vimrc"

# Dot folders
link ".config" ".config"
link ".nano" ".nano"
link ".vscode" ".vscode"

# Claude Code
link ".claude/settings.json" ".claude/settings.json"

echo "✅ Dotfiles symlinked. Backup saved to $BACKUP_DIR"