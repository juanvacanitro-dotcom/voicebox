#!/usr/bin/env bash
set -Eeuo pipefail

echo "Preparing Voicebox for GitHub Codespaces..."

# Wait for the Docker-in-Docker daemon to become ready.
for attempt in $(seq 1 90); do
  if docker info >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

if ! docker info >/dev/null 2>&1; then
  echo "Docker did not become ready. Open the Codespaces terminal and run: docker compose up -d --build"
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "Docker Compose is not available in this Codespace."
  exit 1
fi

# Build in the background so Codespaces can finish opening while the large
# CPU-only Voicebox image is being prepared.
nohup docker compose up -d --build \
  >/tmp/voicebox-compose.log 2>&1 </dev/null &

echo "Voicebox build started in the background."
echo "Build log: /tmp/voicebox-compose.log"
echo "When the build completes, open the forwarded port 17600 (Voicebox Web UI)."
