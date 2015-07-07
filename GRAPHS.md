Results
-------

These graphs should hopefully be self-explanatory. 

![Graph0](sample_results/result0.png)
![Graph1](sample_results/result1.png)
![Graph2](sample_results/result2.png)
![Graph3](sample_results/result3.png)
![Graph4](sample_results/result4.png)
![Graph5](sample_results/result5.png)

Observations
------------

- ParTest 0-2 demonstrate that calling into pl/pgsql parallelises pretty well. It's interesting to see the impact of adding 1 local 
variable or an input parameter upon performance.

- ParTest 3/5 demonstrates that as soon you touch a table, your ability to parallelise worsens substantially (n.b. NOT the absolute 
value but rather the scalability the from 1-core value). This includes both a soft-limit (my performance doesn't scale up past a couple 
of cores) plus also a hard-limit (after 8 cores, the performance crashes).

- ParTest 4 and 5 demonstrate that as soon as you start doing 'work' inside your function, parallelisation/core-scalability falls through the floor.

An alternative set of benchmarks I have prepared that find a very similar result (using different hardware and different PG versions) 
can be seen at http://parpsql.com

I hope this is useful and inspires some discussion/thought in the dev community about this problem, assuming the problem is not unique 
to my systems.

