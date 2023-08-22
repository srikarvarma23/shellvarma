#!/bin/bash

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



for i in $@
do 
   yum install $i -y 
done 