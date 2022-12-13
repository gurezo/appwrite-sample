#!/bin/bash

set -e

# イメージを抽出
echo "docker compose down"
docker compose stop
docker compose down

# イメージを抽出
echo "イメージを抽出"
docker images -f "dangling=true"

# イメージを一括削除
echo "イメージを一括削除"
docker image prune

docker rmi -f $(docker images -q)
