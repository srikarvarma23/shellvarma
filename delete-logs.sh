#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGSDIR=/home/centos/shellvarma-logs
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" - type f -mtime +14)

echo "$FILES_TO_DELETE"