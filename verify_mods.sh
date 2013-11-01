#!/bin/bash
for line in `cat data/lehman_manifest.txt`; do
	prefix=`basename $line | sed s/_[^_]*$//`
	count=`find data/aquifer -name $prefix* | wc -l`
	if [ "$count" == "0" ]
		then
		echo "$line has no corresponding MODS"
	fi
done