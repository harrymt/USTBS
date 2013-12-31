#!/usr/bin/sh

if [ $# -eq 3 ]
then
	awk -v EASTING=$1 -v NORTHING=$2 -v RADIUS=$3 '{if(((EASTING - $1)^2 + (NORTHING - $2)^2 < RADIUS^2)) print $4 " " $3}' < Stops-new.csv
else
	echo 0
	# echo "Wrong number of arguments!"
	# echo "USAGE: ./nearby-stops.sh EASTING NORTHING RADIUS"
fi