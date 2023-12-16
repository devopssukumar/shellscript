#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/temp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
N="\e[0m"

echo "This script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$B ERROR $N...$R Please run this script with Root user $N"
    exit 1
fi

for TOOL in $@
do
    yum list installed $TOOL &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $TOOL -y &>> $LOGFILE
        VALIDATE $? "installing $TOOL"
    else
        echo -e "$TOOL is already installed ... $Y SKIPPING $N"
    fi
done