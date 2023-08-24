#!/bin/bash

LOGSDIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=0.5


while IFS= read line 
do 

usage=$(echo $line | awk '{print $6}' | cut -d % -f 1)
partition=$(echo $line | awk '{print $1}')

if [ $usage gt $DISK_USAGE_THRESHOLD ]
then 
  message+=" $R it is running out of disk storage $N"
 fi 
done <<< $DISK_USAGE

echo -e "message: $message"