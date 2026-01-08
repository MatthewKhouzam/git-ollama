#!/bin/bash

# Common Ollama configuration loader
# Source this file to get OLLAMA_* variables
# Priority: Environment variables > Config file > Defaults

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/ollama-config.json"

# Load from config file
if [ -f "$CONFIG_FILE" ]; then
    CONFIG_HOST=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('host', ''))" 2>/dev/null)
    CONFIG_PORT=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('port', ''))" 2>/dev/null)
    CONFIG_MODEL=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('model', ''))" 2>/dev/null)
    CONFIG_TEMPERATURE=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('temperature', ''))" 2>/dev/null)
    CONFIG_MAX_TOKENS=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('max_tokens', ''))" 2>/dev/null)
    CONFIG_API_TOKEN=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('api_token', ''))" 2>/dev/null)
fi

# Set values with priority: ENV > Config > Default
OLLAMA_HOST="${OLLAMA_HOST:-${CONFIG_HOST:-127.0.0.1}}"
OLLAMA_PORT="${OLLAMA_PORT:-${CONFIG_PORT:-11434}}"
OLLAMA_MODEL="${OLLAMA_MODEL:-${CONFIG_MODEL:-gemma3:1b}}"
OLLAMA_TEMPERATURE="${OLLAMA_TEMPERATURE:-${CONFIG_TEMPERATURE:-0.3}}"
OLLAMA_MAX_TOKENS="${OLLAMA_MAX_TOKENS:-${CONFIG_MAX_TOKENS:-100}}"
OLLAMA_API_TOKEN="${OLLAMA_API_TOKEN:-${CONFIG_API_TOKEN}}"

export OLLAMA_HOST OLLAMA_PORT OLLAMA_MODEL OLLAMA_TEMPERATURE OLLAMA_MAX_TOKENS OLLAMA_API_TOKEN
