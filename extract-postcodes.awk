#!/usr/local/bin/bash
BEGIN {print "Postcode\tEastings\tNorthings\n"}
{FS=","}
{print $1",",$3",",$4}
END{}

# FS=","
awk '/$1/' < Data/ng.csv
