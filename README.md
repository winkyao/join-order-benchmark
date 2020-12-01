# Introduction

This is a clone of original repo:
https://github.com/winkyao/join-order-benchmark

Additional fixes on top of original code:
- ...

# join-order-benchmark

This package contains the Join Order Benchmark (JOB) queries from:
"How Good Are Query Optimizers, Really?"
by Viktor Leis, Andrey Gubichev, Atans Mirchev, Peter Boncz, Alfons Kemper, Thomas Neumann
PVLDB Volume 9, No. 3, 2015
http://www.vldb.org/pvldb/vol9/p204-leis.pdf

the csv_files/schematext.sql and queries/*.sql is modified to MySQL syntax.

IMDB Data Set

The CSV files used in the paper, which are from May 2013, can be found at http://homepages.cwi.nl/~boncz/job/imdb.tgz

### load

use `load_data.sh` to load data into mysql or TiDB.

### order problem

`queries/17b.sql` and `queries/8d.sql` have order problem, because we use diffrent order rule from MySQL, so it is not a real bug.

### use analyze table to make TiDB faster
exec `analyze_table.sql`
