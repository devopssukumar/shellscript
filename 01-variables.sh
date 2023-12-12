#!/bin/bash

PERSON1=$1
PERSON2=$2
DATE=$(date)

echo "$PERSON1: Hi $PERSON2, Good morning"
echo "$PERSON2: Hello $PERSON1, very Good morning"
echo "$PERSON1: How are you $PERSON2 ?"
echo "$PERSON2: I am good $PERSON1, Thank you"

echo "This script is generated on $(DATE)"