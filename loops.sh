#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
 echo "error: please do it with root access"
 exit 1 
fi 



for i in $@
do 
   yum install $i -y 
done 