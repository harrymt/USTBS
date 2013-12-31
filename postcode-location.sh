#!/usr/bin/sh
until [ -z "$1" ] #Returns true if the string is null
	do
		CLINPUT=`echo "$1" | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
		OUTPUT=`awk "/$CLINPUT/" < ng-new.csv`
		if [[ $OUTPUT != "" ]]; then
			EASTING=`echo "$OUTPUT" | cut -d ',' -f2`
			NORTHING=`echo "$OUTPUT" | cut -d ',' -f3`
			OUTPUT=`echo "$OUTPUT" | cut -d ',' -f1`
			OUTPUT=`echo "$OUTPUT" | sed -e 's/[^a-zA-Z0-9]//g'`
			echo "$OUTPUT $EASTING $NORTHING"
		fi
		shift
	done