#!/bin/bash

for input in $@;do

nama_file="$input"

tgl=$(date -r a.sh +"%H")

dcrpt=$(($tgl*(-1)+26))

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
mono=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

string1="${input%.*}"

newphrase=$(echo $string1 | tr "${dual:0:26}" "${dual:${dcrpt}:26}" | tr "${mono:0:26}" "${mono:${dcrpt}:26}") 

mv $string1.txt $newphrase.txt

done
