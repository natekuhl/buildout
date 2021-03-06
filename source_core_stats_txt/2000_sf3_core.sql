     --| MEDIAN YEAR STRUCTURE BUILT |  Universe:  housing units
     sf30058.h035001 -- Median year structure built
     as median_year_structure_built,

     --| POVERTY STATUS IN 1999 BY AGE | Universe:  population for whom poverty status is determined
     sf30007.p087002 -- income in 1999 below poverty level
     as total__persons_below_poverty_level


     --| POVERTY STATUS IN 1999 OF HOUSEHOLDS BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | Universe - Households
     sf30007.p092002  -- income in 1999 below poverty level:
     as total__households_below_poverty_level
     
     
     --| POVERTY STATUS IN 1999 OF FAMILIES BY FAMILY TYPE BY PRESENCE OF RELATED CHILDREN UNDER 18 YEARS BY AGE OF RELATED CHILDREN | Universe: Families
     sf30008.p090002 -- Total- income in 1999 below poverty level
     as total__families_below_poverty_level


FROM dc2000.geosf3 header
join dc2000.sf30058 USING (stusab, logrecno) -- median year structure built
JOIN dc2000.sf30007 USING (stusab, logrecno)
join dc2000.sf30008 using (stusab, logrecno)
;
