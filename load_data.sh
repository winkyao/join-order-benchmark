#!/bin/bash
set -e

TASKNUM=5
trap "exec 1000>&-;exec 1000<&-;exit 0" 2
tempfifo=$$.fifo 
mkfifo $tempfifo
exec 1000<>$tempfifo
rm -rf $tempfifo

for ((i=1; i<=$TASKNUM; i++))
do
    echo >&1000
done

load_data() {
  CURDIR=$(cd `dirname $0`; pwd)
  PREFIX=$CURDIR/csv_files/
  for csv_file in `ls $CURDIR/csv_files/*.csv`; do
    read -u1000

    bname=${csv_file%.*}
    sql_file="$bname.sql"
    table=${bname#$PREFIX}
    sql="LOAD DATA LOCAL INFILE '$csv_file' INTO TABLE $table FIELDS TERMINATED BY ',';"
    echo $sql > $sql_file
    echo $sql_file
    {
       mysql -h 127.0.0.1 -P 4000 -u root -D imdbload < $sql_file
       echo >&1000
    }& 
  done
}

load_data
wait
echo "done!!!!!!!!!!"
