#!/bin/bash

if [ -z $1 ]
then
  echo 'You have to give the mysql password. The name of the database must be the'
  echo 'same as the .sql (wo .sql) filename and the username.'
  echo 'The password must be the same for all.'
  exit
fi

for i in `ls -1 *.sql`
do
  echo "Importing: $i"
  db=`echo $i | sed "s/.sql//g"`
  cat $i | mysql -u $db -p$1 $db
done
