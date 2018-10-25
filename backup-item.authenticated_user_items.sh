#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Please set environment variable TOKEN"
    exit 1
fi

set -ex

mkdir -p ./backups/raw_json/authenticated_user

# I have 56 Qiita posts
for page in `seq 1 56`
do
    wget -qO - --header "Authorization: Bearer $TOKEN" "https://qiita.com/api/v2/authenticated_user/items?per_page=1&page=$page" > backups/raw_json/authenticated_user/items.$page.json
done
