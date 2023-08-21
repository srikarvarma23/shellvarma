#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
 echo "$2  is error"
 exit 1 
else 
 echo "$2 is success"
fi 
}

if [ $USERID -ne 0 ]
then 
 echo "installation will be failure, do it with root"
 exit 1
fi

yum install mysql -y 

VALIDATE $? "mysql installation is success"

yum install postfix -y 

VALIDATE $? "postfix installaton is success"

