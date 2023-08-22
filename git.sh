#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
 echo -e "$2... $R failure $N"
 exit 1 
else 
 echo  -e "$2...  $G success $N"
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

