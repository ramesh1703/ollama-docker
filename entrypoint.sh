#!/bin/bash

# Start ollama serve in the background
ollama serve &

# Wait for the service to actually be ready (up to 30s)
echo "Waiting for Ollama to start..."
for i in $(seq 1 30); do
  if ollama list >/dev/null 2>&1; then
    echo "Ollama is ready."
    break
  fi
  sleep 1
done

# Pull models (comma-separated list via MODELS env var)
MODELS="${MODELS:-llama3}"
IFS=',' read -ra MODEL_LIST <<< "$MODELS"
for model in "${MODEL_LIST[@]}"; do
  model=$(echo "$model" | xargs)  # trim whitespace
  echo "Pulling model: $model"
  ollama pull "$model"
done

# Bring the background process to the foreground so the container stays alive
wait
