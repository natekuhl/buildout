DC1990


          | POVERTY STATUS IN 1989 BY AGE                                        | STF322
          | Universe: Persons for whom poverty status is determined              |
          | Income in 1989 above poverty level:                                  |
 P1170001 |   Under 5 years                                                      | STF322
 P1170002 |   5 years                                                            | STF322
 P1170003 |   6 to 11 years                                                      | STF322
 P1170004 |   12 to 17 years                                                     | STF322
 P1170005 |   18 to 24 years                                                     | STF322
 P1170006 |   25 to 34 years                                                     | STF322
 P1170007 |   35 to 44 years                                                     | STF322
 P1170008 |   45 to 54 years                                                     | STF322
 P1170009 |   55 to 59 years                                                     | STF322
 P1170010 |   60 to 64 years                                                     | STF322
 P1170011 |   65 to 74 years                                                     | STF322
 P1170012 |   75 years and over                                                  | STF322
          | Income in 1989 below poverty level:                                  |
 P1170013 |   Under 5 years                                                      | STF322
 P1170014 |   5 years                                                            | STF322
 P1170015 |   6 to 11 years                                                      | STF322
 P1170016 |   12 to 17 years                                                     | STF322
 P1170017 |   18 to 24 years                                                     | STF322
 P1170018 |   25 to 34 years                                                     | STF322
 P1170019 |   35 to 44 years                                                     | STF322
 P1170020 |   45 to 54 years                                                     | STF322
 P1170021 |   55 to 59 years                                                     | STF322
 P1170022 |   60 to 64 years                                                     | STF322
 P1170023 |   65 to 74 years                                                     | STF322
 P1170024 |   75 years and over                                                  | STF322


--TEST QUERIES
--STATES

drop table temp;
SELECT
stusab,
--| POVERTY STATUS IN 1989 BY AGE | Universe: Persons for whom poverty status is determined
-- Income in 1989 below poverty level
STF322.P1170013 + -- Under 5 years           
STF322.P1170014 + -- 5 years                 
STF322.P1170015 + -- 6 to 11 years           
STF322.P1170016 + -- 12 to 17 years          
STF322.P1170017 + -- 18 to 24 years          
STF322.P1170018 + -- 25 to 34 years          
STF322.P1170019 + -- 35 to 44 years          
STF322.P1170020 + -- 45 to 54 years          
STF322.P1170021 + -- 55 to 59 years          
STF322.P1170022 + -- 60 to 64 years          
STF322.P1170023 + -- 65 to 74 years          
STF322.P1170024 -- 75 years and over       
as total__persons_below_poverty_level
INTO public.temp
FROM dc1990.stf1a0 header
JOIN dc1990.STF322 using (statefp, logrecnu)
where header.sumlev = '040'
and geocomp = '00'
;
select * from histogram('public', 'temp', 'total__persons_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   47906 |  437089 |   26 | ******************************
      2 |  508545 |  829858 |   20 | ***********************
      3 |  923085 | 1190698 |    5 | ******
      4 | 1283629 | 1604186 |   11 | *************
      6 | 2277296 | 2277296 |    3 | ***
      8 | 3000515 | 3000515 |    2 | **
     10 | 3627585 | 3627585 |    4 | *****

--BLOCK GROUPS
SELECT
header.blckgr,
--| POVERTY STATUS IN 1989 BY AGE | Universe: Persons for whom poverty status is determined
-- Income in 1989 below poverty level
STF322.P1170013 + -- Under 5 years           
STF322.P1170014 + -- 5 years                 
STF322.P1170015 + -- 6 to 11 years           
STF322.P1170016 + -- 12 to 17 years          
STF322.P1170017 + -- 18 to 24 years          
STF322.P1170018 + -- 25 to 34 years          
STF322.P1170019 + -- 35 to 44 years          
STF322.P1170020 + -- 45 to 54 years          
STF322.P1170021 + -- 55 to 59 years          
STF322.P1170022 + -- 60 to 64 years          
STF322.P1170023 + -- 65 to 74 years          
STF322.P1170024 -- 75 years and over       
as total__persons_below_poverty_level
FROM dc1990.stf1a0 header
JOIN dc1990.STF322 using (statefp, logrecnu)
where header.sumlev = '150'
and geocomp = '00'
;


***DC2000***

SF30007                POVERTY STATUS IN 1999 BY AGE [17]
SF30007                 universe:  population for whom poverty status is determined
SF30007     p087001     total:
SF30007     p087002     income in 1999 below poverty level:
SF30007     p087003     under 5 years
SF30007     p087004     5 years
SF30007     p087005     6 to 11 years
SF30007     p087006     12 to 17 years
SF30007     p087007     18 to 64 years
SF30007     p087008     65 to 74 years
SF30007     p087009     75 years and over
SF30007     p087010     income in 1999 at or above poverty level:
SF30007     p087011     under 5 years
SF30007     p087012     5 years
SF30007     p087013     6 to 11 years
SF30007     p087014     12 to 17 years
SF30007     p087015     18 to 64 years
SF30007     p087016     65 to 74 years
SF30007     p087017     75 years and over


--TEST QUERIES
--STATES
drop table temp;
SELECT
name,
--| POVERTY STATUS IN 1999 BY AGE | Universe:  population for whom poverty status is determined
sf30007.p087002 -- income in 1999 below poverty level
as total__persons_below_poverty_level
INTO public.temp
FROM dc2000.geosf3 header
JOIN dc2000.sf30007 USING (stusab, logrecno)
where header.sumlev = '040'
and geocomp = '00'
;
select * from histogram('public', 'temp', 'total__persons_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   54777 |  559484 |   31 | ******************************
      2 |  573421 | 1033793 |   12 | ************
      3 | 1170698 | 1304117 |    3 | ***
      4 | 1818687 | 1952629 |    2 | **
      6 | 2692202 | 3117609 |    2 | **
     10 | 4706130 | 4706130 |    1 | *


--BLOCK GROUPS
SELECT
name,
--| POVERTY STATUS IN 1999 BY AGE | Universe:  population for whom poverty status is determined
sf30007.p087002 -- income in 1999 below poverty level
as total__persons_below_poverty_level
FROM dc2000.geosf3 header
JOIN dc2000.sf30007 USING (stusab, logrecno)
where header.sumlev = '150'
and geocomp = '00'
;



***ACS2012****

--ALL POVERTY VARIABLES
--this one was very difficult to find

SELECT 
seq0035.b100590002, -- 
seq0041.b140060002, -- 
seq0046.b160090002, -- 
seq0047.b170010002, -- 
seq0049.b170030002, -- 
seq0049.b170040002, -- 
seq0049.b170050002, -- 
seq0049.b170060002, -- 
seq0050.b170070002, -- 
seq0050.b170090002, -- 
seq0050.b170100002, -- 
--seq0053.b17020a0002, -- 
--seq0053.b17020b0002, -- 
--seq0053.b17020c0002, -- 
--seq0053.b17020d0002, -- 
--seq0053.b17020e0002, -- 
--seq0053.b17020f0002, -- 
--seq0053.b17020g0002, -- 
--seq0054.b17020h0002, -- 
--seq0054.b17020i0002, -- 
seq0054.b170210002 -- 
FROM 
acs2012.seq0041 
join acs2012.seq0046 using (stusab, logrecno) 
join acs2012.seq0035 using (stusab, logrecno) 
join acs2012.seq0047 using (stusab, logrecno) 
join acs2012.seq0049 using (stusab, logrecno) 
join acs2012.seq0050 using (stusab, logrecno) 
join acs2012.seq0053 using (stusab, logrecno) 
join acs2012.seq0054 using (stusab, logrecno)
limit 100; 


Alternatives - didn't go down to block groups
-- seq0050.b170070002 as suspect1, -- 
-- seq0050.b170070001 as total1, -- total 
-- seq0047.b170010001 as total2 -- sum, below and above poverty
-- seq0047.b170010002 as suspect2 -- Total: Income in the past 12 months below poverty level


SEQ0047                         POVERTY STATUS BY AGE AND SEX
SEQ0047                         Universe - population for whom poverty status is determined
SEQ0047          B170010002     Total: Income in the past 12 months below poverty level:


-- TEST QUERIES
-- STATES

drop table temp;
SELECT 
header.name,
-- | POVERTY STATUS BY AGE AND SEX | Universe - population for whom poverty status is determined
seq0054.b170210002
as total__persons_below_poverty_level
INTO public.temp
FROM acs2012.geoheader header
join acs2012.seq0054 using (stusab, logrecno)
where header.sumlevel = '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__persons_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   60636 |  640132 |   28 | ******************************
      2 |  690832 | 1074986 |   13 | **************
      3 | 1563464 | 1723485 |    7 | ********
      5 | 2814409 | 2887151 |    2 | **
      7 | 4270218 | 4270218 |    1 | *
     10 | 5590100 | 5590100 |    1 | *

-- BLOCK GROUPS

SELECT 
header.name,
-- | POVERTY STATUS BY AGE AND SEX | Universe - population for whom poverty status is determined
seq0054.b170210002 
as total__persons_below_poverty_level
FROM acs2012.geoheader header
join acs2012.seq0054 using (stusab, logrecno)
where header.sumlevel = '150'
and component = '00'
;


***ACS2014***

SEQ0054          B1702100        POVERTY STATUS OF INDIVIDUALS IN THE PAST 12 MONTHS BY LIVING ARRANGEMENT
SEQ0054          B1702100        Universe:  Population for whom poverty status is determined
SEQ0054          B17021002       Income in the past 12 months below poverty level:


--TEST QUERIES
--STATES
drop table temp;
SELECT
name,
--| POVERTY STATUS OF INDIVIDUALS IN THE PAST 12 MONTHS BY LIVING ARRANGEMENT | Universe:  Population for whom poverty status is determined
seq0054.B17021002 -- Income in the past 12 months below poverty level
as total__persons_below_poverty_level
INTO public.temp
FROM acs2014.geoheader header
join acs2014.seq0054 using (stusab,logrecno)
where header.sumlevel = '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__persons_below_poverty_level');


--BLOCK GROUPS

SELECT
name,
--| POVERTY STATUS OF INDIVIDUALS IN THE PAST 12 MONTHS BY LIVING ARRANGEMENT | Universe:  Population for whom poverty status is determined
seq0054.B17021002 -- Income in the past 12 months below poverty level
FROM acs2014.geoheader header
join acs2014.seq0054 using (stusab,logrecno)
where header.sumlevel = '150'
and component = '00'
;




