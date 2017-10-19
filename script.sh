#!/bin/sh
var=`cat urls6.txt`
for i in $var; do
        echo curl $i
	curl -w "%{http_code} %{url_effective}\n" $i 
done | grep '^200\|^301\|^302' | awk '{print $2}' | sort | uniq > validUrls1.txt
