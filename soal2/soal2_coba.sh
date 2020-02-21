#!/bin/bash

for input in $@;do

#nama_file="$input"

tgl=$(date -r a.sh +"%H")

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
mono=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

string1="${input%.*}"

newphrase=$(echo $string1 | tr "${dual:0:26}" "${dual:${tgl}:26}" | tr "${mono:0:26}" "${mono:${tgl}:26}")

mv $string1.txt $newphrase.txt

done
