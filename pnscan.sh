#!/bin/bash

if [ "$1" == "" ]
then
echo "You don't have an IP address specified"
echo "syntax ./nmap_test.sh 10.10.2.20"

else
ports=$(nmap -p- -Pn  --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -sC -sV -Pn -p$ports $1 >> results.txt
fi
