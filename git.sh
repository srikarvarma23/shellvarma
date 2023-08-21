#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
 echo "$2 "
 exit 1 
else 
 echo "$2 "
fi 
}

if [ $USERID -ne 0 ]
then 
 echo "installation will be failure, do it with root"
 exit 1
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "mysql installation is success"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "postfix installaton is success"

