#!/bin/bash
dir=`pwd`
outpt=$1
echo $outpt | cut -c1-9
ot=`echo $outpt | cut -c1-9`
file="$dir/$1"
> $dir/dblink_db.sql
while read line
do
echo "\c \"$line\" "   >> $dir/dblink_db.sql
echo "CREATE EXTENSION dblink;"   >> $dir/dblink_db.sql
done <"$file"
mv $dir/dblink_db.sql  $dir/dblink_db_$ot.sql
chmod 777 $dir/*
