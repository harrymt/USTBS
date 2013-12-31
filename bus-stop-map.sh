#!/usr/bin/sh
if [ $# -eq 1 ]
then
	RADIUS=1000
	POSTCODE=$1
elif [ $# -eq 3 ] 
then
	RADIUS=$2
	POSTCODE=$3
elif [ $# -eq 0 ]
then
	echo 1
	exit
else
	echo "Wrong number of arguments!"
	echo "USAGE: ./bus-stop-map.sh [-r radius] POSTCODE"
	exit
fi
String=`sh postcode-location.sh "$POSTCODE"`
#Note normalise the postcode for the file name
POSTCODE=`echo $POSTCODE | sed -e 's/[^a-zA-Z0-9\-]//g'`
POSTCODE=`echo $POSTCODE | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
EASTING=`echo $String | cut -d " " -f2`
NORTHING=`echo $String | cut -d " " -f3`
Locations=`sh nearby-stops.sh $EASTING $NORTHING $RADIUS | cut -d " " -f 1`
Locations=`echo $Locations | cut -d "." -f1`
if [[ $Locations -ne 0 ]]
	then
	sh nearby-stops.sh $EASTING $NORTHING $RADIUS > locations.txt
	URL=`awk -f openstreetmap.awk < locations.txt`
	#check to see if the file has been downloaded in the last 10 minutes
	Modified=`sh recently-modified.sh $POSTCODE.jpg`
	if [[ $Modified -eq 1 ]] 
		then
		echo Using cached image.
	else
		wget -q -O $POSTCODE.jpg $URL
		echo Downloaded map file: $POSTCODE.jpg
	fi
	open $POSTCODE.jpg
else 
	echo "Postcode :$POSTCODE doesn't exist on database."
fi