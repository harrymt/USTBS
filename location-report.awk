#!/usr/local/bin/bash
BEGIN{}
NF{count[$5]++}
END
{
	for(town in count)
	{print town " appears " count[town] " times}
}