
#!/bin/bash
set -e

cd "$(dirname "$0")"

docker build -t sandbox-frontend:latest -t 93.77.164.9:8081/khamitovar-frontend-docker/sandbox-frontend:latest .
docker push 93.77.164.9:8081/khamitovar-frontend-docker/sandbox-frontend:latest
