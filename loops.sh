#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/centos/shellvarma-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ];
then 
 echo -e " $R error: please do it with root access $N"
 exit 1 
fi 

VALIDATE(){
 
 if [ $1 -ne 0 ]
 then 
  echo -e  " $R installating $2 failure $N"
  exit 1
  else 
   echo -e " $G installating $2 success $N"
   fi 
}

for i in $@
do 
   yum list installed $i &>>$LOGFILE
   if [ $? -ne 0 ]
   then 
    echo "if the package is not installed, lets install it"
     yum install $i -y &>>$LOGFILE
     VALIDATE $? "$i"
    else 
     echo -e " $Y $i is already installed, skip $N"
done 