#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="shell-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then 
    echo "ERROR:: Please run this script with Root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing Mysql"

yum install git -y $>> $LOGFILE

VALIDATE $? "Installing Git"
