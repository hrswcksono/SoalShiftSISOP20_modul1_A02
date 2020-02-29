#!/bin/bash

if [ ! -d duplicate ]; then  
    mkdir duplicate
fi
if [ ! -d kenangan ]; then
    mkdir kenangan
fi

grep 'Location' wget.log > location.log

readarray arr < location.log

for ((a=0; a<28; a++));
do
#d=0
e=0
for ((c=a+1; c<28; c++));
do
     #d=$((a+1))
     e=$((c+1))
     if [[ "${arr[$a]}" == "${arr[$c]}" ]] 
     then
	mv pdkt_kusuma_"$e" duplicate/duplicate_"$e" 
     fi
done
done


for ((c=1; c<29; c++));
do
     if [ -f pdkt_kusuma_"$c" ]; then
  	 mv pdkt_kusuma_"$c" kenangan/kenangan_"$c"
     fi
done


mv wget.log "wget $(date).bak.log"
