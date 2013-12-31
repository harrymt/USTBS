#!/usr/local/bin/bash
awk
BEGIN{print "latitude\tlongitude"}
{ if ((EASTING - $1)^2 + (NORTHING - $2)^2 < 1000^2)
	print $4, "\t", $3;
}
END{}