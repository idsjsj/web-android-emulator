#!/bin/bash
set -e

echo "==== Docker 설치 확인 ===="
if ! command -v docker &> /dev/null; then
    echo "[info] Docker 설치 중..."
    apt update
    apt install -y docker.io
fi

sudo systemctl enable --now docker
sudo systemctl start docker || true
export PATH=$PATH:/usr/bin
