#!/bin/bash

# Build and install git-train-commit-message as a wheel
echo "Building git-train-commit-message wheel..."

# Build wheel
python3 -m pip install --user build
python3 -m build --wheel

# Install to ~/.local/bin
python3 -m pip install --user dist/*.whl

echo "git-train-commit-message installed to ~/.local/bin"
echo "Make sure ~/.local/bin is in your PATH"
