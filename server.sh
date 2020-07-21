#!/bin/bash

input="./ips.txt"

for IFS=read -r line
do
	ping -c 3 $line
	if [ $? -ne 0 ]
	then
		mailx -s "Server $line is down" -t examplle@something.com < /dev/null
	fi
done
