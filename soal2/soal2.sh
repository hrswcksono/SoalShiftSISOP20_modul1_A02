#!/bin/bash

read input

if [[ $input =~ ^[A-Za-z_]+$ ]]; then

  touch a.sh
  flag=1;
  while [ $flag -gt 0 ]
  do
     a=$(cat /dev/urandom| tr -dc '0-9a-zA-Z'|head -c 28)
     if [[ "$a" =~ [[:upper:]] && "$a" =~ [[:lower:]] && "$a" =~ [[:digit:]] ]]; then
      echo "$a" >> "$input".txt
      flag=0
     fi 
  done 
else
  echo "salah"
fi

