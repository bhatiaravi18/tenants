#!/bin/bash
dir=`pwd`
outpt=$1
echo $outpt | cut -c1-9
ot=`echo $outpt | cut -c1-9`
file="$dir/$1"
> $dir/alter_db.sql
while read line
do
#> $dir/alter_db.sql

echo "alter database \"$line\" set timezone to 'CST6CDT';"   >> $dir/alter_db.sql
echo "alter database \"$line\" set datestyle = 'iso,dmy';"   >> $dir/alter_db.sql
echo "alter database \"$line\" set search_path = \"simaruser\",tecfg,teopr,testg,temet,teusr,public,terep_cstm,terep,wso2carbon,tenopr,terep_dirty,teqtrz,qrtz,teqrtz_bkp,teopr_bkp; "   >> $dir/alter_db.sql
#sed -i 's/simar/$/g' $dir/alter_db.sql
done <"$file"
sed -i 's/simar/$/g' $dir/alter_db.sql
mv $dir/alter_db.sql  $dir/alter_db_$ot.sql
chmod 777 $dir/*
