#!/bin/bash

if [ -z "$1" ]
then
  echo 'You need to give the first argument as a pattern of files you want to rename.'
  exit
fi

if [ -z $2 ]
then
  echo 'The second parameter must be the thing you want ot replace in the file name.'
  echo 'The scrip will replace this part for the third gien parmeter.'
  echo 'If the third parameter is missing, this part will be deleted from the new file name.'
  exit
fi

for i in `ls -1 $1`
do
  echo -n "Renaming $i -> "
  new_name=`echo $i | sed "s/$2/$3/g"`
  mv $i $new_name
  echo $new_name
done
