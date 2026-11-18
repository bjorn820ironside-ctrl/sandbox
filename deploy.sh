#!/usr/bin/env bash
set -euo pipefail
cd "$HOME/sandbox"

docker compose pull
docker compose up -d --remove-orphans
curl -fsS --retry 10 --retry-delay 2 --retry-connrefused --max-time 5 \
  http://127.0.0.1:8888/ > /dev/null
docker image prune -f

grep '^VERSION=' .env | cut -d= -f2- > version
docker compose ps
