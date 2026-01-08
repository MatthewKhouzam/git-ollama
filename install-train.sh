#!/bin/bash

# Build and install git-train-commit-message as a wheel
echo "Building git-train-commit-message wheel..."

# Check if we're in a virtual environment
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Virtual environment detected, installing locally..."
    # Install build tools and package in venv
    python3 -m pip install build
    python3 -m build --wheel
    python3 -m pip install dist/*.whl
    echo "git-train-commit-message installed in virtual environment"
else
    echo "Installing to user directory..."
    # Build wheel
    python3 -m pip install --user build
    python3 -m build --wheel
    # Install to ~/.local/bin
    python3 -m pip install --user dist/*.whl
    echo "git-train-commit-message installed to ~/.local/bin"
    echo "Make sure ~/.local/bin is in your PATH"
fi
