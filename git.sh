#!/bin/bash

USERID=$(id -u)
if [$USERID -ne 0 ]
then 
 echo "installation will be failure, do it with root"
 
fi