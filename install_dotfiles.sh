#!/bin/bash

DOTFILES_DIR=~/dotfiles
LIST_FILE=$DOTFILES_DIR/dotfiles_list.txt

while read -r source target; do
  # translate to fullpath
  src_path="$DOTFILES_DIR/$source"
  target_path="${target/#\~/$HOME}" # "~" to "$HOME"

  # mkdir if parentdir is not existing
  mkdir -p "$(dirname "$target_path")"

  # backup
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    echo "Backing up existing $target_path to ${target_path}.bak"
    mv "$target_path" "${target_path}.bak"
  fi

  # link
  echo "Creating symlink: $src_path -> $target_path"
  sudo ln -s "$src_path" "$target_path"
done <"$LIST_FILE"

echo "Dotfiles installation completed!"
