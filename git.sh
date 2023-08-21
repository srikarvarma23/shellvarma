#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
 echo "installation  is error"
 exit 1 
else 
 echo "installaton is success"
fi 
}

if [ $USERID -ne 0 ]
then 
 echo "installation will be failure, do it with root"
 exit 1
fi

yum install mysql -y 

VALIDATE $? 

yum install postfix -y 

VALIDATE $?

