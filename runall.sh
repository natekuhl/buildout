#!/bin/bash
while read i; do
    echo $i; 
    psql -hfloppyjoe -dpropdata -Upostgres -c "select * from census_search('$i')" > "out/$i";
done < names-only.txt
#done < names-top-datasets-2016-11-09.txt
