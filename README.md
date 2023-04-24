# Join-Order-Benchmark

This package contains the Join Order Benchmark (JOB) queries from:
"[How Good Are Query Optimizers, Really?](http://www.vldb.org/pvldb/vol9/p204-leis.pdf)"
by Viktor Leis, Andrey Gubichev, Atans Mirchev, Peter Boncz, Alfons Kemper, Thomas Neumann
PVLDB Volume 9, No. 3, 2015


The `csv_files/schematext.sql` and `queries/*.sql` are modified to MySQL syntax.


## Quick Start

1. Get the data:
```shell
cd csv_files/
wget http://homepages.cwi.nl/~boncz/job/imdb.tgz
tar -xvzf imdb.tgz
```

2. Launch the database server:
3. Run script:
```
./load_data.sh
```
If you meets access restriction, please modify the config:
```
mysql --local-infile=1 -h 127.0.0.1 -P 4000 -u root -D imdbload < $sql_file
```

## order problem

`queries/17b.sql` and `queries/8d.sql` have order problem, because we use diffrent order rule from MySQL, so it is not a real bug.

## use analyze table to make TiDB faster
exec `analyze_table.sql`
