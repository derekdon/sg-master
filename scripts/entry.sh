#!/bin/bash
set -e
set -x
set -m

if [ -z "$DATABASE_NAME" ]; then
    echo "DATABASE_NAME environment variable not set"
    exit 1
fi

if [ -z "$DATABASE_BUCKET" ]; then
    echo "DATABASE_BUCKET environment variable not set"
    exit 2
fi

if [ -z "$DATABASE_SERVER" ]; then
    echo "DATABASE_SERVER environment variable not set"
    exit 3
fi

if [ -z "$ADMIN_INTERFACE" ]; then
    echo "ADMIN_INTERFACE environment variable not set"
    exit 3
fi

if [ -z "$INTERFACE" ]; then
    echo "INTERFACE environment variable not set"
    exit 3
fi

sed \
  -e "s,<ADMIN_INTERFACE>,$ADMIN_INTERFACE,g" \
  -e "s,<INTERFACE>,$INTERFACE,g" \
  -e "s,<CORS_ORIGIN_1>,$CORS_ORIGIN_1,g" \
  -e "s,<CORS_ORIGIN_2>,$CORS_ORIGIN_2,g" \
  -e "s,<CORS_ORIGIN_3>,$CORS_ORIGIN_3,g" \
  -e "s,<CORS_LOGIN_ORIGIN_1>,$CORS_LOGIN_ORIGIN_1,g" \
  -e "s,<CORS_LOGIN_ORIGIN_2>,$CORS_LOGIN_ORIGIN_2,g" \
  -e "s,<CORS_LOGIN_ORIGIN_3>,$CORS_LOGIN_ORIGIN_3,g" \
  -e "s,<DATABASE_NAME>,$DATABASE_NAME,g" \
  -e "s,<DATABASE_SERVER>,$DATABASE_SERVER,g" \
  -e "s,<DATABASE_BUCKET>,$DATABASE_BUCKET,g" \
  -i /etc/sync_gateway/config.json

sleep 20

sync_gateway /etc/sync_gateway/config.json