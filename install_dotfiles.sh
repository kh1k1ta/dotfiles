#!/bin/bash

DOTFILES_DIR=~/dotfiles
LIST_FILE=$DOTFILES_DIR/dotfiles_list.txt

while read -r source target; do
  # フルパスに変換
  src_path="$DOTFILES_DIR/$source"
  target_path="${target/#\~/$HOME}" # "~" を "$HOME" に置き換える

  # 親ディレクトリがない場合は作成
  mkdir -p "$(dirname "$target_path")"

  # 既存のターゲットをバックアップ
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    echo "Backing up existing $target_path to ${target_path}.bak"
    mv "$target_path" "${target_path}.bak"
  fi

  # シンボリックリンクを作成
  echo "Creating symlink: $src_path -> $target_path"
  ln -s "$src_path" "$target_path"
done <"$LIST_FILE"

echo "Dotfiles installation completed!"
