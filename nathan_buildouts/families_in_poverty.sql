*****DC1990*****

SUMMARY FILE 3
 P004         |          | FAMILIES                                                             | STF301
 P004         |          | Universe: Families                                                   |
 P004         | P0040001 | Total                                                                | STF301

 P123         |          | POVERTY STATUS IN 1989 BY FAMILY TYPE AND PRESENCE AND AGE OF        | STF324
 P123         |          | CHILDREN                                                             |
 P123         |          | Universe: Families                                                   |
 P123         |          | Income in 1989 below poverty level:                                  |
 P123         |          |   Married-couple family:                                             |
 P123         |          |     With related children under 18 years:                            |
 P123         | P1230013 |       Under 5 years only                                             | STF324
 P123         | P1230014 |       5 to 17 years only                                             | STF324
 P123         | P1230015 |       Under 5 years and 5 to 17 years                                | STF324
 P123         | P1230016 |     No related children under 18 years                               | STF324
 P123         |          |   Other family:                                                      |
 P123         |          |     Male householder, no wife present:                               |
 P123         |          |       With related children under 18 years:                          |
 P123         | P1230017 |         Under 5 years only                                           | STF324
 P123         | P1230018 |         5 to 17 years only                                           | STF324
 P123         | P1230019 |         Under 5 years and 5 to 17 years                              | STF324
 P123         | P1230020 |       No related children under 18 years                             | STF324
 P123         |          |     Female householder, no husband present:                          |
 P123         |          |       With related children under 18 years:                          |
 P123         | P1230021 |         Under 5 years only                                           | STF324
 P123         | P1230022 |         5 to 17 years only                                           | STF324
 P123         | P1230023 |         Under 5 years and 5 to 17 years                              | STF324
 P123         | P1230024 |       No related children under 18 years                             | STF324

--TEST QUERIES
--STATES

drop table temp;
SELECT stusab,
-- | POVERTY STATUS IN 1989 BY FAMILY TYPE AND PRESENCE AND AGE OF CHILDREN | Universe   Families
stf324.p1230013 +  -- Income in 1989 below poverty level   Married-couple family   With related children under 18 years   Under 5 years only              
stf324.p1230014 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  5 to 17 years only              
stf324.p1230015 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  Under 5 years and 5 to 17 years 
stf324.p1230016 +  -- Income in 1989 below poverty level  Married-couple family   No related children under 18 years
stf324.p1230017 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years only             
stf324.p1230018 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  5 to 17 years only
stf324.p1230019 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years and 5 to 17 years
stf324.p1230020 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   No related children under 18 years
stf324.p1230021 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years only             
stf324.p1230022 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  5 to 17 years only
stf324.p1230023 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years and 5 to 17 years
stf324.p1230024    -- Income in 1989 below poverty level  Other family   Female householder, no husband present   No related children under 18 years 
as total__families_below_poverty_level
FROM dc1990.stf300 header 
join dc1990.STF324 using (statefp, logrecnu)
where header.sumlev = '040'
and header.geocomp = '00'
;
select * from histogram('public', 'temp', 'total__families_below_poverty_level');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |   9198 |  80485 |   23 | ******************************
      2 |  82888 | 139463 |   18 | ***********************
      3 | 158369 | 213030 |    7 | *********
      4 | 251687 | 283906 |   12 | ****************
      5 | 319978 | 319978 |    2 | ***
      7 | 454872 | 454872 |    3 | ****
      9 | 617981 | 617981 |    2 | ***
     10 | 670685 | 670685 |    4 | *****

--BLOCK GROUPS
SELECT header.stusab,
-- | POVERTY STATUS IN 1989 BY FAMILY TYPE AND PRESENCE AND AGE OF CHILDREN | Universe   Families
stf324.p1230013 +  -- Income in 1989 below poverty level   Married-couple family   With related children under 18 years   Under 5 years only              
stf324.p1230014 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  5 to 17 years only              
stf324.p1230015 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  Under 5 years and 5 to 17 years 
stf324.p1230016 +  -- Income in 1989 below poverty level  Married-couple family   No related children under 18 years
stf324.p1230017 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years only             
stf324.p1230018 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  5 to 17 years only
stf324.p1230019 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years and 5 to 17 years
stf324.p1230020 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   No related children under 18 years
stf324.p1230021 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years only             
stf324.p1230022 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  5 to 17 years only
stf324.p1230023 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years and 5 to 17 years
stf324.p1230024    -- Income in 1989 below poverty level  Other family   Female householder, no husband present   No related children under 18 years 
as total__families_below_poverty_level
FROM dc1990.stf1a0 header 
join dc1990.STF324 using (statefp, logrecnu)
where header.sumlev = '150'
and header.geocomp = '00'
;

*****DC2000*****

SF30008
 p092       |            | p92.      | poverty status in 1999 of households by household type by age of householder [59]
 p092       |            |           | universe:  households
 p092       | p092001    |           | total:
 p092       | p092002    |           | income in 1999 below poverty level:
 p092       | p092003    |           | family households:


SF30007
 p090       |            | p90.      | poverty status in 1999 of families by family type by presence of related children under 18 years by age of related children [41]
 p090       |            |           | universe:  families
 p090       | p090001    |           | total:
 p090       | p090002    |           | income in 1999 below poverty level:
 p090       | p090003    |           | married-couple family:
 p090       | p090004    |           | with related children under 18 years:
 p090       | p090005    |           | under 5 years only
 p090       | p090006    |           | under 5 years and 5 to 17 years
 p090       | p090007    |           | 5 to 17 years only
 p090       | p090008    |           | no related children under 18 years
 p090       | p090009    |           | other family:
 p090       | p090010    |           | male householder, no wife present:
 p090       | p090011    |           | with related children under 18 years:
 p090       | p090012    |           | under 5 years only
 p090       | p090013    |           | under 5 years and 5 to 17 years
 p090       | p090014    |           | 5 to 17 years only
 p090       | p090015    |           | no related children under 18 years
 p090       | p090016    |           | female householder, no husband present:
 p090       | p090017    |           | with related children under 18 years:
 p090       | p090018    |           | under 5 years only
 p090       | p090019    |           | under 5 years and 5 to 17 years
 p090       | p090020    |           | 5 to 17 years only
 p090       | p090021    |           | no related children under 18 years

SF30002
 p015       |            | p15.      | family type by presence of own children under 18 years by age of own children [20]
 p015       |            |           | universe:  families
 p015       | p015001    |           | total:


--matching families below poverty level totals
SELECT x.p092003, y.p090002 from dc2000.sf30008 x join dc2000.sf30007 y using (stusab,logrecno) limit 144;
--matching totals
SELECT x.p015001, y.p090001 from dc2000.sf30002 x join dc2000.sf30007 y using (stusab,logrecno) limit 144;


--TEST QUERIES

--STATES

drop table temp;
SELECT
name,
--| POVERTY STATUS IN 1999 OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN | Universe: Families
sf30007.p090002 -- Total- income in 1999 below poverty level 
as total__families_below_poverty_level
INTO public.temp
FROM dc2000.geosf3 header
join dc2000.sf30007 using (stusab, logrecno)
where header.sumlev = '040'
and geocomp = '00'  
;
select * from histogram('public', 'temp', 'total__families_below_poverty_level');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |   9925 |  88478 |   27 | ******************************
      2 | 103757 | 192376 |   14 | ****************
      3 | 196423 | 250296 |    5 | ******
      5 | 383131 | 450254 |    2 | **
      6 | 535935 | 535935 |    1 | *
      7 | 632676 | 632676 |    1 | *
     10 | 845991 | 845991 |    1 | *

--BLOCK GROUPS

SELECT
name,
--| POVERTY STATUS IN 1999 OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN | Universe: Families
sf30007.p090002 -- Total- income in 1999 below poverty level 
FROM dc2000.geosf3 header
join dc2000.sf30007 using (stusab, logrecno)
where header.sumlev = '150'
and geocomp = '00'  
;


*****ACS_2012*****

--CONFIRM universe=families
select
x.b170100001 as totalfamiliesguess,
y.b191310001 as totalfamilies,
z.b110030001 as tot_fams,
w.b110040001 as tot_families
from acs2012.seq0050 x
join acs2012.seq0064 y using (stusab, logrecno)
join acs2012.seq0036 z using (stusab, logrecno)
join acs2012.seq0037 w using (stusab, logrecno)
limit 100;

select
x.b170100002 +
x.b170100022 as totalfamiliesguess,
y.b191310001 as totalfamilies,
z.b110030001 as tot_fams,
w.b110040001 as tot_families
from acs2012.seq0050 x
join acs2012.seq0064 y using (stusab, logrecno)
join acs2012.seq0036 z using (stusab, logrecno)
join acs2012.seq0037 w using (stusab, logrecno)
limit 100;


 SEQ0050                    Universe: Families   
 SEQ0050     B170100002     Total: Income in the past 12 months below poverty level:

--TEST QUERIES

--STATES
drop table temp;
SELECT
name,
--| FAMILY POVERTY LEVEL STATUS | Universe-families 
seq0050.B170100002 -- Total- Income in the past 12 months below poverty level
as total__families_below_poverty_level
INTO public.temp
FROM acs2012.geoheader header
join  acs2012.seq0050 USING (stusab, logrecno)
where header.sumlevel = '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__families_below_poverty_level');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |  10532 | 117758 |   27 | ******************************
      2 | 123431 | 214361 |   14 | ****************
      3 | 292539 | 332154 |    6 | *******
      4 | 365612 | 365612 |    1 | *
      5 | 525993 | 528709 |    2 | **
      8 | 826695 | 826695 |    1 | *
     10 | 980731 | 980731 |    1 | *


--BLOCK GROUPS

SELECT
name,
--| FAMILY POVERTY LEVEL STATUS | Universe-families 
seq0050.B170100002 -- Total -  Income in the past 12 months below poverty level
as total__families_below_poverty_level
FROM acs2012.geoheader header
join  acs2012.seq0050 USING (stusab, logrecno)
where header.sumlevel = '150'
and component = '00'
;


*****ACS2014*****

     SEQ0050                      POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN
     
     SEQ0050                      Universe: Families
     
     SEQ0050          B17010002   Income in the past 12 months below poverty level

--TEST QUERIES

--STATES

drop table temp;
SELECT 
name,
--| POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN | Universe: families
     seq0500.b17010002 -- Income in the past 12 months below poverty level
     as total__families_below_poverty_level
INTO public.temp
FROM acs2014.geoheader header
join acs2014.seq0050 USING (stusab, logrecno)
where header.sumlevel= '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__families_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   11721 |  121496 |   27 | ******************************
      2 |  131475 |  222612 |   14 | ****************
      3 |  298326 |  344294 |    6 | *******
      4 |  366843 |  366843 |    1 | *
      5 |  554677 |  566521 |    2 | **
      8 |  862797 |  862797 |    1 | *
     10 | 1064297 | 1064297 |    1 | *



--BLOCK GROUPS

SELECT 
name,
--| POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN | Universe: families
     seq0050.b17010002 -- Income in the past 12 months below poverty level
     as total__families_below_poverty_level
FROM acs2014.geoheader header
join acs2014.seq0050 USING (stusab, logrecno)
where header.sumlevel= '150'
and component = '00'
;




select x.b17012002, y.b17010002 from acs2014.seq0052 x join acs2014.seq0050 y using (stusab, logrecno) limit 1000;
 -- ^ above query checks whether two variables in two different tables are the same`

select x.B17010001 as default, y.B11003001 as total_families
from acs2014.seq0050 x join acs2014.seq0035 y using (stusab, logrecno) limit 111;
-- ^ above query checks whether we're in the right universe
