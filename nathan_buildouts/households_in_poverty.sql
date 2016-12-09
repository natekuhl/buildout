DC1990

 P127         |          | POVERTY STATUS IN 1989 BY AGE OF HOUSEHOLDER BY HOUSEHOLD TYPE       | STF326
 P127         |          | Universe: Households                                                 |
 P127         |          | Income in 1989 below poverty level:                                  |
 P127         |          |   Householder 15 to 64 years:                                        |
 P127         | P1270016 |     Married-couple family                                            | STF326
 P127         |          |     Other family:                                                    |
 P127         | P1270017 |       Male householder, no wife present                              | STF326
 P127         | P1270018 |       Female householder, no husband present                         | STF326
 P127         |          |     Nonfamily households:                                            |
 P127         | P1270019 |       Householder living alone                                       | STF326
 P127         | P1270020 |       Householder not living alone                                   | STF326
 P127         |          |   Householder 65 to 74 years:                                        |
 P127         | P1270021 |     Married-couple family                                            | STF326
 P127         |          |     Other family:                                                    |
 P127         | P1270022 |       Male householder, no wife present                              | STF326
 P127         | P1270023 |       Female householder, no husband present                         | STF326
 P127         |          |     Nonfamily households:                                            |
 P127         | P1270024 |       Householder living alone                                       | STF326
 P127         | P1270025 |       Householder not living alone                                   | STF326
 P127         |          |   Householder 75 years and over:                                     |
 P127         | P1270026 |     Married-couple family                                            | STF326
 P127         |          |     Other family:                                                    |
 P127         | P1270027 |       Male householder, no wife present                              | STF326
 P127         | P1270028 |       Female householder, no husband present                         | STF326
 P127         |          |     Nonfamily households:                                            |
 P127         | P1270029 |       Householder living alone                                       | STF326
 P127         | P1270030 |       Householder not living alone                                   | STF326

--CONFIRM SET SUMS UP TO TOTAL HOUSEHOLDS
SELECT
x.P0050001, -- | Total                                                                | STF301

           -- | POVERTY STATUS IN 1989 BY AGE OF HOUSEHOLDER BY HOUSEHOLD TYPE 
           -- | Universe: Households                                           
           -- | Income in 1989 above poverty level:                            
           -- |   Householder 15 to 64 years:                                  
y.P1270001 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270002 +  -- |       Male householder, no wife present                        
y.P1270003 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270004 +  -- |       Householder living alone                                 
y.P1270005 +  -- |       Householder not living alone                             
  -- |   Householder 65 to 74 years:                                  
y.P1270006 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270007 +  -- |       Male householder, no wife present                        
y.P1270008 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270009 +  -- |       Householder living alone                                 
y.P1270010 +  -- |       Householder not living alone                             
  -- |   Householder 75 years and over:                               
y.P1270011 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270012 +  -- |       Male householder, no wife present                        
y.P1270013 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270014 +  -- |       Householder living alone                                 
y.P1270015 +  -- |       Householder not living alone                             
  -- | Income in 1989 below poverty level:                            
  -- |   Householder 15 to 64 years:                                  
y.P1270016 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270017 +  -- |       Male householder, no wife present                        
y.P1270018 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270019 +  -- |       Householder living alone                                 
y.P1270020 +  -- |       Householder not living alone                             
  -- |   Householder 65 to 74 years:                                  
y.P1270021 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270022 +  -- |       Male householder, no wife present                        
y.P1270023 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270024 +  -- |       Householder living alone                                 
y.P1270025 +  -- |       Householder not living alone                             
  -- |   Householder 75 years and over:                               
y.P1270026 +  -- |     Married-couple family                                      
  -- |     Other family:                                              
y.P1270027 +  -- |       Male householder, no wife present                        
y.P1270028 +  -- |       Female householder, no husband present                   
  -- |     Nonfamily households:                                      
y.P1270029 +  -- |       Householder living alone                                 
y.P1270030   -- |       Householder not living alone                             
as test_total_households
FROM dc1990.stf301 x JOIN dc1990.stf326 y using (statefp, logrecnu)
limit 100;


--TEST QUERIES
--STATES

drop table temp;
SELECT
stusab,
-- | POVERTY STATUS IN 1989 BY AGE OF HOUSEHOLDER BY HOUSEHOLD TYPE | Universe: Households 
  --  Income in 1989 below poverty level:                            
  --    Householder 15 to 64 years:                                  
stf326.P1270016 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270017 +  --        Male householder, no wife present                        
stf326.P1270018 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270019 +  --        Householder living alone                                 
stf326.P1270020 +  --        Householder not living alone                             
--    Householder 65 to 74 years:                                  
stf326.P1270021 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270022 +  --        Male householder, no wife present                        
stf326.P1270023 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270024 +  --        Householder living alone                                 
stf326.P1270025 +  --        Householder not living alone                             
--    Householder 75 years and over:                               
stf326.P1270026 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270027 +  --        Male householder, no wife present                        
stf326.P1270028 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270029 +  --        Householder living alone                                 
stf326.P1270030   --        Householder not living alone                             
as total__households_below_poverty_level 
INTO public.temp
FROM dc1990.stf1a0 header 
JOIN dc1990.stf326 using (statefp, logrecnu)
where header.sumlev = '040'
and geocomp = '00'
;
select * from histogram('public', 'temp', 'total__households_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   15140 |  127074 |   20 | ******************************
      2 |  134297 |  241453 |   19 | ****************************
      3 |  268596 |  351770 |    9 | **************
      4 |  444535 |  444535 |    3 | ****
      5 |  481483 |  512172 |    9 | **************
      6 |  619514 |  619514 |    2 | ***
      8 |  845603 |  845603 |    3 | ****
      9 | 1001688 | 1001688 |    2 | ***
     10 | 1049206 | 1049206 |    4 | ******



--BLOCK GROUPS
SELECT
header.blckgr,
-- | POVERTY STATUS IN 1989 BY AGE OF HOUSEHOLDER BY HOUSEHOLD TYPE | Universe: Households 
  --  Income in 1989 below poverty level:                            
  --    Householder 15 to 64 years:                                  
stf326.P1270016 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270017 +  --        Male householder, no wife present                        
stf326.P1270018 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270019 +  --        Householder living alone                                 
stf326.P1270020 +  --        Householder not living alone                             
--    Householder 65 to 74 years:                                  
stf326.P1270021 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270022 +  --        Male householder, no wife present                        
stf326.P1270023 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270024 +  --        Householder living alone                                 
stf326.P1270025 +  --        Householder not living alone                             
--    Householder 75 years and over:                               
stf326.P1270026 +  --      Married-couple family                                      
--      Other family:                                              
stf326.P1270027 +  --        Male householder, no wife present                        
stf326.P1270028 +  --        Female householder, no husband present                   
--      Nonfamily households:                                      
stf326.P1270029 +  --        Householder living alone                                 
stf326.P1270030   --        Householder not living alone                             
as total__households_below_poverty_level 
FROM dc1990.stf1a0 header 
JOIN dc1990.stf326 using (statefp, logrecnu)
where header.sumlev = '150'
and geocomp = '00'
;


****DC2000***
SF30008                            poverty status in 1999 of households by household type by age of householder
SF30008                            universe:  households                                                       
SF30008     p092001                total:                                                                      
SF30008     p092002                income in 1999 below poverty level:                                         

--CONFIRM WE'RE IN THE RIGHT UNIVERSE
SELECT
--           | p92.      | poverty status in 1999 of households by household type by age of householder [59]
--           |           | universe:  households
x.p092001 as sum_housholds_poverty, --    |           | total:
x.p092002 + --    |           | income in 1999 below poverty level:
x.p092031 as test_total_housholds, --    |           | income in 1999 at or above poverty level:
y.p010001 as total_households -- from table 1
FROM dc2000.sf30008 x join dc2000.sf30001 y using (stusab, logrecno) limit 100;

--TEST QUERIES
--STATES
drop table temp;
SELECT
header.name,
--| POVERTY STATUS IN 1999 OF HOUSEHOLDS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | Universe - Households
sf30008.p092002  -- income in 1999 below poverty level:
as total__households_below_poverty_level
INTO public.temp
FROM dc2000.geosf3 header 
join dc2000.sf30008 using (stusab, logrecno) 
where header.sumlev = '040'
and geocomp = '00'
;
select * from histogram('public', 'temp', 'total__households_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   18435 |  164788 |   26 | ******************************
      2 |  174845 |  311730 |   14 | ****************
      3 |  316991 |  465376 |    5 | ******
      4 |  474607 |  596466 |    3 | ***
      5 |  743525 |  743525 |    1 | *
      7 |  982266 | 1034059 |    2 | **
     10 | 1360284 | 1360284 |    1 | *



--BLOCK GROUPS
SELECT
header.name,
--| POVERTY STATUS IN 1999 OF HOUSEHOLDS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | Universe - Households
sf30008.p092002  -- income in 1999 below poverty level:
as total__households_below_poverty_level
FROM dc2000.geosf3 header 
join dc2000.sf30008 using (stusab, logrecno) 
where header.sumlev = '150'
and geocomp = '00'
;


***ACS2012***
--checking against total households
SELECT
x.b110050001 as total_households,-- Totalseq0037
y.b170170001 as total_households_test,-- Totalseq0053
y.b170170002 +
y.b170170031 as total_test_sum
FROM acs2012.seq0037 x join acs2012.seq0053 y using (stusab,logrecno) limit 100;



SEQ0053                 HOUSEHOLD POVERTY STATUS BY HOUSEHOLD TYPE 
SEQ0053                 Universe - Households 
SEQ0053  b170170002     Total- Income in the past 12 months below poverty level

--TEST QUERIES
--STATES

drop table temp;
SELECT
name,
--| HOUSEHOLD POVERTY STATUS BY HOUSEHOLD TYPE | Universe - households
seq0053.b170170002 -- Total- Income in the past 12 months below poverty level
as total__households_below_poverty_level
INTO public.temp
FROM acs2012.geoheader header 
JOIN acs2012.seq0053 using (stusab,logrecno) 
where header.sumlevel = '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__households_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   20271 |  201526 |   23 | ******************************
      2 |  216775 |  343228 |   17 | **********************
      3 |  403321 |  567070 |    4 | *****
      4 |  573705 |  662157 |    4 | *****
      6 | 1019792 | 1028106 |    2 | ***
      8 | 1361960 | 1361960 |    1 | *
     10 | 1675718 | 1675718 |    1 | *


--BLOCK GROUPS

SELECT
name,
--| HOUSEHOLD POVERTY STATUS BY HOUSEHOLD TYPE | Universe - households
seq0053.b170170002 -- Total- Income in the past 12 months below poverty level
as total__households_below_poverty_level
FROM acs2012.geoheader header 
JOIN acs2012.seq0053 using (stusab,logrecno) 
where header.sumlevel = '150'
and component = '00'
;


***ACS2014***


total
 seq0035         | B1100100      | Households - Families               | HOUSEHOLD TYPE (INCLUDING LIVING ALONE)
 seq0035         | B1100100      |                                     | Universe:  Households
 seq0035         | B11001001     |                                     | Total:
poverty
 seq0053         | B1701700      | Poverty                             | POVERTY STATUS IN THE PAST 12 MONTHS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER
 seq0053         | B1701700      |                                     | Universe:  Households
 seq0053         | B17017001     |                                     | Total:
 seq0053         | B17017002     |                                     | Income in the past 12 months below poverty level:
 seq0053         | B17017003     |                                     | Family households:
 seq0053         | B17017004     |                                     | Married-couple family:
 seq0053         | B17017005     |                                     | Householder under 25 years
 seq0053         | B17017006     |                                     | Householder 25 to 44 years
 seq0053         | B17017007     |                                     | Householder 45 to 64 years
 seq0053         | B17017008     |                                     | Householder 65 years and over
 seq0053         | B17017009     |                                     | Other family:
 seq0053         | B17017010     |                                     | Male householder, no wife present:
 seq0053         | B17017011     |                                     | Householder under 25 years
 seq0053         | B17017012     |                                     | Householder 25 to 44 years
 seq0053         | B17017013     |                                     | Householder 45 to 64 years
 seq0053         | B17017014     |                                     | Householder 65 years and over
 seq0053         | B17017015     |                                     | Female householder, no husband present:
 seq0053         | B17017016     |                                     | Householder under 25 years
 seq0053         | B17017017     |                                     | Householder 25 to 44 years
 seq0053         | B17017018     |                                     | Householder 45 to 64 years
 seq0053         | B17017019     |                                     | Householder 65 years and over
 seq0053         | B17017020     |                                     | Nonfamily households:
 seq0053         | B17017021     |                                     | Male householder:
 seq0053         | B17017022     |                                     | Householder under 25 years
 seq0053         | B17017023     |                                     | Householder 25 to 44 years
 seq0053         | B17017024     |                                     | Householder 45 to 64 years
 seq0053         | B17017025     |                                     | Householder 65 years and over
 seq0053         | B17017026     |                                     | Female householder:
 seq0053         | B17017027     |                                     | Householder under 25 years
 seq0053         | B17017028     |                                     | Householder 25 to 44 years
 seq0053         | B17017029     |                                     | Householder 45 to 64 years
 seq0053         | B17017030     |                                     | Householder 65 years and over

--check that universe is correct

SELECT
x.B11001001, -- seq0035
y.B17017001 -- seq0053 
from acs2014.seq0035 x join acs2014.seq0053 y using (stusab, logrecno)
limit 100;


--TEST QUERIES
--STATES

drop table temp;
SELECT
name,
--| POVERTY STATUS IN THE PAST 12 MONTHS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | Universe - Households
seq0053.B17017002 -- Income in the past 12 months below poverty level
as total__households_below_poverty_level
INTO public.temp
from acs2014.geoheader header
join acs2014.seq0053 using (stusab, logrecno)
where header.sumlevel = '040'
and component = '00'
;
select * from histogram('public', 'temp', 'total__households_below_poverty_level');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   21345 |  206377 |   23 | ******************************
      2 |  230495 |  416587 |   18 | ***********************
      3 |  555882 |  601119 |    4 | *****
      4 |  639670 |  685149 |    3 | ****
      6 | 1071715 | 1094402 |    2 | ***
      7 | 1418910 | 1418910 |    1 | *
     10 | 1833084 | 1833084 |    1 | *


--BLOCK GROUPS

SELECT
name,
--| POVERTY STATUS IN THE PAST 12 MONTHS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | Universe - Households
seq0053.B17017002 -- Income in the past 12 months below poverty level
from acs2014.geoheader header
join acs2014.seq0053 y using (stusab, logrecno)
where header.sumlevel = '150'
and component = '00'
;

