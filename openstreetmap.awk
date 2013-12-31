#!/usr/local/bin/bash
awk
BEGIN
{
	printf "http://staticmap.openstreetmap.de/staticmap.php?zoom=16&size=1024x768&markers="
}
{
	printf $1","$2",ol-marker|"
	longitude += $2
	latitude += $1
}
END
{
	longitude = longitude/NR
	latitude = latitude/NR
	printf "&center="latitude","longitude
}