
#!/bin/bash
set -e

cd "$(dirname "$0")"

docker build -t sandbox-backend:latest -t 93.77.164.9:8081/khamitovar-backend-docker/sandbox-backend:latest .
docker push 93.77.164.9:8081/khamitovar-backend-docker/sandbox-backend:latest
