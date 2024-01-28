#!/bin/bash

if [ "$1" == "" ]
then
echo "You don't have a starting IP address specified"
echo "syntax ./sweep_test.sh 10.0.2"

elif [ "$2" == "" ]
then
echo "You need a url or IP address to target"

else
for ip in `seq 1 254`; do
curl -H "X-Forwarded-For: $1.$ip" $2
done
fi
