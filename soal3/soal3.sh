#!/bin/bash


#for ((i=1 ; $i<=28 ; i++))
#do
#	wget "https://loremflickr.com/320/240/cat" -a "wget.log" -O "pdkt_kusuma_$i"
#done

i=1
while (($i<=28))
do
	wget "https://loremflickr.com/320/240/cat" -o "wget.log" -O "pdkt_kusuma_$i"
	i=$((i+1))
done
