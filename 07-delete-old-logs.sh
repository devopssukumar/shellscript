#!/bin/bash

SOURCE_DIR=/tmp/shell-script-logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # -d is dir exists| ! is opposite=if dir not exists
then
    echo -e "$R source directory: $SOURCE_DIR does not exists. $N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while ifs= read -r line # read -r line=Reads line by line | ifs=internal field seperator
do
    echo "Deleting file: $line"
done <<< $FILES_TO_DELETE