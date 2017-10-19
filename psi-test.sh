#!/bin/sh
var=`cat validUrls1.txt`
for i in $var; do
	echo "testing" $i 
	score=$(psi $i --threshold=50 --startegy=desktop --format=json | \
	jq '.overview' | jq '.Speed' --raw-output -c)
	if [[$score=~ ^[0-9]+$ ]] ; then
		if [[ $score -ge 90 ]] ; then
			status="high"
			echo $status
		elif [[ $score -ge 70 ]] ; then
            		status="medium"
			echo $status
		else
            		status="low"
			echo $status
        	fi
	else
        	score=0
		echo $score
    	fi

done
