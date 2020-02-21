#!/bin/bash

read input

touch a.sh

tgl=$(date +%H)

output=$(echo $input | sed 's/[^a-zA-Z]//g')


cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28 > "$output".txt
