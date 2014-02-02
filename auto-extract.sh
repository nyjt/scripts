#!/bin/bash


for i in `ls -l *.tar.gz *.tgz`
do
  echo "Decompressing: $i"
  tar -xzv $i
  echo "Done: $i"
  mv $i $i.OK
done

