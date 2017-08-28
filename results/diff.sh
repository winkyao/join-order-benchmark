#!/bin/bash
for file in `ls tidb_r/*.out`; do
	echo $file
	basename=`basename $file`
	diff $file mysql_r/$basename
done
