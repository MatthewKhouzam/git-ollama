# git-add-llm

Interactive git staging with AI-powered code explanations. Like `git add -p` but with LLM explanations for each code chunk.

## Features

- Shows AI explanations for each code change before staging
- Interactive staging with familiar git add -p controls
- Works with local LLM API (OpenAI-compatible)
- Processes hunks individually for precise control

## Installation

```bash
./install.sh
```

This installs `git-add-llm` to `~/.local/bin`. Make sure this directory is in your PATH.

## Usage

```bash
# Stage all changes with explanations
git add-llm

# Stage specific files with explanations  
git add-llm file1.py file2.js

# Use as git subcommand
git add-llm
```

## Configuration

The script expects a local LLM server running on `127.0.0.1:11343` with OpenAI-compatible API.

To change the host/port, edit the variables at the top of the `git-add-llm` script:
```bash
LLM_HOST="127.0.0.1"
LLM_PORT="11343"
```

## Controls

- `y` - stage this hunk
- `n` - skip this hunk  
- `q` - quit without staging remaining hunks
- `a` - stage this and all remaining hunks
- `d` - skip this and all remaining hunks
- `?` - show help

## Requirements

- bash
- git
- curl
- python3
- Local LLM server with OpenAI-compatible API
