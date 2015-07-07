#!/bin/bash
# Parallel pl/pgsql performance tests (v1, July 2015)
# Graeme B Bell, NIBIO

# Dependencies: lscpu, postgresql/psql, perl. R if you want a nice graph.

resultsfile="ppppt_results.csv"
logfile="ppppt_log.log"

version=1
scale=1   # size of pgbench db
t=60      # time to run test
DBOPTS='' # anything you need to connect to your db goes here
parallelism_to_test="1 2 4 8 16"

echo "# Postgresql parallel pl/sql performance tests version 1" > $resultsfile
echo -en "# kernel info: " >> $resultsfile; uname -r >> $resultsfile
echo -en "# pg info: " >> $resultsfile; echo "select version()::char(17);" | psql $DBOPTS -t | head -1 >> $resultsfile
echo -en "# cpu info: " >> $resultsfile; lscpu | grep "ore\|ocket" | perl -pe 's/\n/.  /;s/  / /;' >> $resultsfile
echo -en "\n# PPPPT test length (seconds): $t\n" >> $resultsfile

cat $resultsfile  # display system info to screen

echo "Beginning tests..."

echo -e "test\tthreads\ttps" 
echo -e "testcase,threads,tps" >> $resultsfile

/usr/pgsql-9.3/bin/pgbench -i -s 1 2>/dev/null 1>>$logfile

for i in {0..5} ; do         # tests to run
  for c in $parallelism_to_test; do    # connections to test
    psql $DBOPTS <tests/parfunc$i.sql 2>&1 1>>$logfile
    tps=`/usr/pgsql-9.3/bin/pgbench -n -T $t -c$c -j$c -f tests/partest$i.sql | grep excluding | cut -f 3 -d " "`
    echo -e "$i,\t$c,\t$tps" # display to screen during progress
    echo -e "\"Test $i\",\"$c\",$tps" >> $resultsfile
  done
done

echo "Finished benchmark. Results are in $resultsfile."

if [[ -f /usr/bin/R ]]; 
  then R < pppptgraph.r --no-save 2>&1 1>$logfile; 
  echo "Finishing generating graphs. Results are in result[0-5].png";
fi
