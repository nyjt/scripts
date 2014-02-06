#!/bin/bash

if [ -z $3 ]
then
  echo 'You should give at least 3 arguments.'
  echo "$0 'old thing that you will replace' 'replace to this new thing' 'filename.for.example.txt'"
  exit
fi

from=$1
to=$2

file=$3

echo 'Making a backup from original file: '
rm -f $3.backup
cp -vf $3 $3.backup
echo "$3  ->  $3.backup"
echo -n 'Replacing... '
cat $3.backup | sed "s,$1,$2,g" >$3
echo 'Done'

if [ `md5sum $3` eq `md5sum $3.backup` ]
then
  echo "There are nothing to replace in $3."
  echo "Deleting backup file: $3.backup"
  rm $3.backup
fi
