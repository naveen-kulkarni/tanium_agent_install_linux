#!/bin/bash

DATELOG=$(date +'%d-%b-%y')
Log=$PWD/hwReport_$DATELOG.csv
echo "Host Name=OS Version=Agent Version=Agent Installation=Agent Status" >> $Log 2>&1
for i in `cat $PWD/log`
do
ssh -q $i 'bash -s' < $PWD/getInfo.sh  >>  $Log 2>&1
done
