#!/bin/bash

# Install git-add-llm as a git command

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy the script
cp "$SCRIPT_DIR/git-add-llm" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/git-add-llm"

echo "git-add-llm installed to $INSTALL_DIR"
echo "Make sure $INSTALL_DIR is in your PATH to use 'git add-llm'"

# Check if it's in PATH
if [[ ":$PATH:" == *":$INSTALL_DIR:"* ]]; then
    echo "✓ $INSTALL_DIR is already in your PATH"
else
    echo "⚠ Add this to your ~/.bashrc or ~/.zshrc:"
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
fi
