#!/bin/bash

set -e

APP_PATH="/usr/share/Czentrix/qa_admin_frontend"
APP_NAME="qa-frontend"

echo "Changing directory to ${APP_PATH}..."
cd "${APP_PATH}"

echo "Installing production dependencies..."
npm install --production

echo "Starting application with PM2..."
HOSTNAME=0.0.0.0 PORT=3001 pm2 start .next/standalone/qa_admin_frontend/server.js --name "${APP_NAME}"

echo "Waiting for application to start..."
sleep 5

echo "Checking PM2 service status..."
pm2 status "${APP_NAME}"

STATUS=$(pm2 jlist | grep -A 10 "\"name\":\"${APP_NAME}\"" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)

if [ "$STATUS" = "online" ]; then
    echo "========================================="
    echo "Service Status : RUNNING"
    echo "Application    : ${APP_NAME}"
    echo "PM2 Status     : ${STATUS}"
    echo "========================================="
    exit 0
else
    echo "========================================="
    echo "Service Status : FAILED"
    echo "Application    : ${APP_NAME}"
    echo "PM2 Status     : ${STATUS:-unknown}"
    echo "========================================="
    echo "Last 20 lines of PM2 logs:"
    pm2 logs "${APP_NAME}" --lines 20 --nostream
    exit 1
fi