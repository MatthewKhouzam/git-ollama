# git-add-llm

Interactive git staging with AI-powered code explanations and commit message generation.

## Features

- **git-add-llm**: Interactive staging with AI explanations for each code chunk
- **git-train-commit-message**: Analyzes commit history to learn your project's style
- **prepare-commit-msg**: Auto-generates consistent commit messages using learned patterns
- Works with local LLM API (OpenAI-compatible)
- Processes hunks individually for precise control

## Installation

```bash
# Install git-add-llm and prepare-commit-msg
./install.sh

# Install git-train-commit-message (requires Python package)
./install-train.sh
```

This installs:
- `git-add-llm` to `~/.local/bin` 
- `git-train-commit-message` as a Python wheel with nltk dependency
- `prepare-commit-msg` hook

Make sure `~/.local/bin` is in your PATH.

## Usage

```bash
# Stage all changes with explanations
git add-llm

# Stage specific files with explanations  
git add-llm file1.py file2.js

# Analyze commit history and generate style prompt
git train-commit-message

# View analysis in JSON format
git train-commit-message --json
```

## Configuration

All scripts use a shared Ollama configuration with the following priority:
1. Environment variables (highest priority)
2. `ollama-config.json` file
3. Built-in defaults (lowest priority)

### Environment Variables
- `OLLAMA_HOST` - Server host (default: 127.0.0.1)
- `OLLAMA_PORT` - Server port (default: 11434)  
- `OLLAMA_MODEL` - Model name (default: gemma3:1b)
- `OLLAMA_TEMPERATURE` - Temperature setting (default: 0.3)
- `OLLAMA_MAX_TOKENS` - Max tokens (default: 100)
- `OLLAMA_API_TOKEN` - API authentication token (optional)

### Config File
Default `ollama-config.json`:
```json
{
  "host": "127.0.0.1",
  "port": "11434",
  "model": "gemma3:1b",
  "temperature": 0.3,
  "max_tokens": 100,
  "api_token": ""
}
```

Edit this file to change defaults for all git commands.

## Workflow

1. **Train the commit style**: Run `git train-commit-message` to analyze your project's commit patterns and generate a custom prompt
2. **Stage changes**: Use `git add-llm` to interactively stage changes with AI explanations
3. **Auto-generated commits**: The `prepare-commit-msg` hook uses your learned style to generate consistent commit messages

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
