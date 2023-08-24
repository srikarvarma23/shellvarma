#!/bin/bash

T0_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
echo "escaped content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all args: $@"

FINAL_BODY=$(sed -e 's/Team-Name/DevOps/g' -e 's/ALERT_TYPE/high disk usage/g' -e "s/MESSAGE/$BODY/g" template.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\n-content-Type: text/html")" "$TO_ADDRESS"