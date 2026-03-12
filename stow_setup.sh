#!/bin/sh

PACKAGE_SOURCE_DIR=$(cd "$(dirname "$0")" && pwd)

if [ -L "$HOME/.config" ]; then
    TARGET_DIR=$(readlink -f "$HOME/.config")
    echo "Resolved ~/.config symlink to: $TARGET_DIR"
else
    TARGET_DIR="$HOME/.config"
    mkdir -p "$TARGET_DIR"
fi

stow --adopt -v -d "$PACKAGE_SOURCE_DIR" -t "$TARGET_DIR" .
