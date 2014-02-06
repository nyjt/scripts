#!/bin/bash


for i in `ls -1 *.tar.gz *.tgz *.tar`
do
  echo "Decompressing: $i"
  if echo | grep -e 'gz$'
  then
    tar -xzvf $i
  else
    tar -xvf $i
  fi
  echo "Done: $i"
  mv $i $i.OK
done

