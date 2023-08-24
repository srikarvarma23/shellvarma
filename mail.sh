#!/bin/bash

T0_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all args: $@"

FINAL_BODY=$(sed -e 's/Team-Name/DevOps/g' -e 's/ALERT_TYPE/high disk usage/g' -e "s/MESSAGE/$message/") template.html

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS