

    --|  MEDIAN YEAR STRUCTURE BUILT | Universe: housing units
    stf329.h025a001 -- Median year structure built
    as median_year_structure_built


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


    -- | POVERTY STATUS IN 1989 BY FAMILY TYPE AND PRESENCE AND AGE OF CHILDREN | Universe   Families
    STF324.p1230013 +  -- Income in 1989 below poverty level   Married-couple family   With related children under 18 years   Under 5 years only
    STF324.p1230014 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  5 to 17 years only
    STF324.p1230015 +  -- Income in 1989 below poverty level  Married-couple family   With related children under 18 years  Under 5 years and 5 to 17 years
    STF324.p1230016 +  -- Income in 1989 below poverty level  Married-couple family   No related children under 18 years
    STF324.p1230017 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years only
    STF324.p1230018 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  5 to 17 years only
    STF324.p1230019 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   With related children under 18 years  Under 5 years and 5 to 17 years
    STF324.p1230020 +  -- Income in 1989 below poverty level  Other family   Male householder, no wife present   No related children under 18 years
    STF324.p1230021 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years only
    STF324.p1230022 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  5 to 17 years only
    STF324.p1230023 +  -- Income in 1989 below poverty level  Other family   Female householder, no husband present   With related children under 18 years  Under 5 years and 5 to 17 years
    STF324.p1230024    -- Income in 1989 below poverty level  Other family   Female householder, no husband present   No related children under 18 years
    as total__families_below_poverty_level


FROM dc1990.stf1a0 header
join dc1990.stf329 using (statefp, logrecnu) 
JOIN dc1990.STF322 using (statefp, logrecnu)
JOIN dc1990.stf326 using (statefp, logrecnu)
join dc1990.STF324 using (statefp, logrecnu)
;

