#!/usr/bin/sh
if [ -f $1 ] 
	then
	if [ -s `find $1 -mmin -10` ]
		then
		echo 1
	else
		echo 0
	fi
else
	echo 0
fi