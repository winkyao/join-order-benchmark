#!/bin/bash
CURDIR=$(cd `dirname $0`; pwd)
cd $CURDIR

ls $CURDIR/csv_files/*.csv | while read file; do
  table=`basename $file`
  table=${table%.*}
  #echo "select count(*) $table from $table;"
  #echo "ANALYZE TABLE $table;"
  echo $table
done
