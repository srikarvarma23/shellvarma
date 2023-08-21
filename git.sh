#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
 echo "installation will be failure, do it with root"
 exit 1
fi

yum install mysql -y 

if [ $? -ne 0 ]
then 
 echo "installation of mysql is error"
 exit 1 
else 
 echo "installaton of mysql is success"
fi 