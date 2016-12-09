*******DC1990*******

	STF329                  MEDIAN YEAR STRUCTURE BUILT                                        
	STF329                  Universe: Housing units                                             
	STF329     H025A001     Median year structure built


SELECT
stusab,
--|  MEDIAN YEAR STRUCTURE BUILT | Universe: housing units
    h025a001 -- Median year structure built 
    as median_year_structure_built
FROM dc1990.stf1a0 header
join dc1990.stf329 using (statefp, logrecnu)
where header.sumlev = '040'
and geocomp = '00'
limit 1000;

*******DC2000*******

SF30058                  MEDIAN YEAR STRUCTURE BUILT  
SF30058                  UNIVERSE:  HOUSING UNITS
SF30058     H035001      Median year structure built


SELECT
name,
--| MEDIAN YEAR STRUCTURE BUILT |  Universe:  housing units
     h035001 -- Median year structure built
     as median_year_structure_built
FROM dc2000.geosf3 header 
join dc2000.sf30058 USING (stusab, logrecno)
where header.sumlev = '040'
and geocomp = '00'
limit 1000;


*******ACS_2012*******

seq0104_2012      -- The meta for acs 2012 isn't very helpful; couldn't find the universe label                 
seq0104_2012                       
seq0104_2012      b250350001      Median year structure built


SELECT
name,
--| MEDIAN YEAR STRUCTURE BUILT 
     b250350001 -- Median year structure built
     as median_year_structure_built
FROM acs2012.geoheader header
join acs2012.seq0104 USING (stusab, logrecno)
where header.sumlevel = '150'
and component = '00'
limit 1000;


*******ACS2014*******

seq0104                         MEDIAN YEAR STRUCTURE BUILT
seq0104                         UNIVERSE:  HOUSING UNITS
seq0104      B25035001          Median year structure built



SELECT
name,
--| MEDIAN YEAR STRUCTURE BUILT | Universe: housing units
     B25035001 -- Median year structure built
     as median_year_structure_built
FROM acs2014.geoheader header 
join acs2014.seq0104 USING (stusab, logrecno)
where header.sumlevel = '040'
and component = '00'
limit 1000;



