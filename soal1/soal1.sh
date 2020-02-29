#!/bin/bash

#a
echo 'Soal a'
awk -F'\t' '{ if($13 == "West") a+=$21; else if($13 == "East") b+=$21; else if($13 == "Central") c+=$21; else if($13 == "South") d+=$21;} END {if(a<b && a<c && a<d) print "West"; else if(b<a && b<c && b<d) print "East"; else if(c<a && c<b && c<d) print "Central"; else if(d<a && d<b && d<c) print "South"}' Sample-Superstore.tsv


#b
echo $'\n\nSoal b'
awk -F '\t' '$13 ~/Central/ {iter[$11]+=$21} END {for(hasil in iter) {print iter[hasil]" "hasil}}' Sample-Superstore.tsv | sort -g | head -2


#c
echo $'\n\nSoal c'
awk -F'\t' '$13 ~/Central/ {if($11 == "Texas" || $11 == "Illinois") iter[$17]+=$21} END {for(hasil in iter) {print iter[hasil]" "hasil}}' Sample-Superstore.tsv | sort -g | head -10
