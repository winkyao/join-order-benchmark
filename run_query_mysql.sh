#!/bin/bash
set -e

run() {
CURDIR=$(cd `dirname $0`; pwd)
OUTDIR=$CURDIR/results/$1

if [ ! -e $OUTDIR ]; then
  mkdir -p $OUTDIR
fi

cd $CURDIR
for file in `ls queries/*.sql`; do
  bname=`basename $file`
  name=${bname%.*}
  outputfile=$OUTDIR/$name.out
  errorfile=$OUTDIR/$name.err
  echo "run $file > $outputfile"
  start=$(date +%s)
  logstart=$(date +"%D - %r")
  mysql -u root -p123456 -D imdbload < $file >$outputfile 2> $errorfile
  #mysql -u root -p123456 -D imdbload < $file
  end=$(date +%s)
  logend=$(date +"%D - %r")
  elapsed=$(( $end - $start ))
  echo "Start date and time: $logstart" >> $errorfile
  echo "End date and time: $logend" >> $errorfile
  echo "elapsed time: $elapsed s" >> $errorfile
done
}

if [ $# -eq 0 ]; then
  run mysql_r
else
  run $*
fi
