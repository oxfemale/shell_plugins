#!/bin/sh

curl -s https://corona-stats.online/Russia > ~/.cache/corona

#grep "Country\|Russia" ~/.cache/corona |
grep "Russia" ~/.cache/corona |
	sed "s/\s*//g ; s/║//g ; s/│/;/g" |
	sed  's/\x1b\[[0-9;]*m//g' |
	awk -F';' '{print "😷:" $3 " (" $4 ") ☠:" $6}'
  
