#!/usr/local/bin/bash
awk
BEGIN{}
{
	$0 ~ POSTCODE{print $3 "\t" $4}
}
END{}