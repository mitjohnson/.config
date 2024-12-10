#!/bin/bash

DOTFILE_DIR="$HOME/.config"

for f in "$DOTFILE_DIR"/*; do
  if [[ -d "$f" ]]; then
    echo "Skipping directory: $f"
    continue
  fi

  if [[ "$f" == *.sh ]]; then
    echo "Skipping shell script: $f"
    continue
  fi

  ln -s "$f" "$HOME/.$(basename "$f")"
  echo "Linked: $f -> $HOME/.$(basename "$f")"
done
