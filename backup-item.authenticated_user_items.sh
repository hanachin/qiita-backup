#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Please set environment variable TOKEN"
    exit 1
fi

set -ex

page=1

mkdir -p ./backups/json/authenticated_user

while :
do
    response=$(wget -qO - --header "Authorization: Bearer $TOKEN" "https://qiita.com/api/v2/authenticated_user/items?per_page=100&page=$page")
    if [ "0" -eq $(echo $response | jq length) ]; then
        break
    fi

    echo $response > backups/json/authenticated_user/items.$page.json
    page=$((page + 1))
done
