#!/bin/bash

IFS=$'\n'
for i in `ls -1 *.pdf`
do
  echo $i
  convert "$i[0]" -colorspace RGB -background white -flatten -quality 90 -geometry 200 "$i.jpg"
done
