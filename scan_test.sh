#!/bin/bash

if [ "$1" == "" ]
then 
echo "You don't have an IP address specified"
echo "syntax ./nmap_test.sh 10.10.2.20"

else
ping -c 1 10.10.10.161 >> results.txt
ports=$(nmap -p- --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -sC -sV -p$ports $1 >> results.txt
fi
