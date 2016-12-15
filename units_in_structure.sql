DC1990
    STF328                  UNITS IN STRUCTURE          
    STF328                  Universe: Housing units    
    STF328     H0200001     1, detached                 
    STF328     H0200002     1, attached                 
    STF328     H0200003     2                           
    STF328     H0200004     3 or 4                      
    STF328     H0200005     5 to 9                      
    STF328     H0200006     10 to 19                    
    STF328     H0200007     20 to 49                    
    STF328     H0200008     50 or more                  
    STF328     H0200009     Mobile home or trailer      
    STF328     H0200010     Other                       

--TEST QUERIES 
--STATES 
    drop table temp;
    SELECT
        stusab,
                    -- UNITS IN STRUCTURE | Universe: Housing units     
        STF328.H0200001                          -- 1, detached            
        as total__units_in_structure_1_detached, 
        STF328.H0200002                          -- 1, attached            
        as total__units_in_structure_1_attached, 
        STF328.H0200003                          -- 2                      
        as total__units_in_structure_2, 
        STF328.H0200004                          -- 3 or 4                 
        as total__units_in_structure_3_4,
        STF328.H0200005                          -- 5 to 9                 
        as total__units_in_structure_5_9,
        STF328.H0200006                          -- 10 to 19               
        as total__units_in_structure_10_19,
        STF328.H0200007                          -- 20 to 49               
        as total__units_in_structure_20_49,
        STF328.H0200008                          -- 50 or more             
        as total__units_in_structure_50_or_more,
        STF328.H0200009                          -- Mobile home or trailer 
        as total__units_in_structure_mobile_homes,
        STF328.H0200010                          -- Other                  
        as total__units_in_structure_other
    INTO public.temp
    FROM dc1990.stf1a0 header
    join dc1990.stf328 using (statefp, logrecnu)
    where header.sumlev = '040'
    and geocomp = '00'; 
    select * from histogram('public', 'temp', 'total__units_in_structure_3_4');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |   7752 |  79436 |   35 | ******************************
      2 |  82211 | 123319 |   13 | ***********
      3 | 206268 | 212192 |    5 | ****
      4 | 226548 | 294064 |    8 | *******
      5 | 297599 | 297599 |    3 | ***
      7 | 503480 | 503480 |    3 | ***
     10 | 654082 | 654082 |    4 | ***

DC2000 
    SF30058               UNITS IN STRUCTURE
    SF30058               universe:  housing units
    SF30058    H030001    total:
    SF30058    H030002    1, detached
    SF30058    H030003    1, attached
    SF30058    H030004    2
    SF30058    H030005    3 or 4
    SF30058    H030006    5 to 9
    SF30058    H030007    10 to 19
    SF30058    H030008    20 to 49
    SF30058    H030009    50 or more
    SF30058    H030010    mobile home
    SF30058    H030011    boat, rv, van, etc.

--TEST QUERIES
--STATES
    drop table temp;
    SELECT
        name,
                     -- | UNITS IN STRUCTURE | Universe:  housing units
        SF30058.H030002             -- 1, detached
        as total__units_in_structure_1_detached,
        SF30058.H030003             -- 1, attached
        as total__units_in_structure_1_attached,
        SF30058.H030004             -- 2
        as total__units_in_structure_2,
        SF30058.H030005             -- 3 or 4
        as total__units_in_structure_3_4,
        SF30058.H030006             -- 5 to 9
        as total__units_in_structure_5_9,
        SF30058.H030007             -- 10 to 19
        as total__units_in_structure_10_19,
        SF30058.H030008             -- 20 to 49
        as total__units_in_structure_20_49,
        SF30058.H030009             -- 50 or more
        as total__units_in_structure_50_or_more,
        SF30058.H030010             -- mobile home
        as total__units_in_structure_mobile_homes,
        SF30058.H030011             -- boat, rv, van, etc.
        as total__units_in_structure_other
    INTO public.temp
    FROM dc2000.geosf3 header
    join dc2000.sf30058 USING (stusab, logrecno)
    where header.sumlev = '040'
    and geocomp = '00'
    ;
    select * from histogram('public', 'temp', 'total__units_in_structure_3_4');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |   8938 |  83524 |   34 | ******************************
      2 |  91047 | 132535 |    9 | ********
      3 | 223580 | 228116 |    2 | **
      4 | 241745 | 313631 |    4 | ****
      5 | 318494 | 318494 |    1 | *
      8 | 559886 | 559886 |    1 | *
     10 | 697779 | 697779 |    1 | *


ACS2012
    seq0103          b250240001     Total:
    seq0103          b250240002     Total: 1, detached
    seq0103          b250240003     Total: 1, attached
    seq0103          b250240004     Total: 2
    seq0103          b250240005     Total: 3 or 4
    seq0103          b250240006     Total: 5 to 9
    seq0103          b250240007     Total: 10 to 19
    seq0103          b250240008     Total: 20 to 49
    seq0103          b250240009     Total: 50 or more
    seq0103          b250240010     Total: Mobile home
    seq0103          b250240011     Total: Boat, RV, van, etc.

--TEST QUERIES 
--STATES
    drop table temp;
    SELECT 
        name,
                      -- | UNITS IN STRUCTURE | Universe:  Housing units 
        --seq0103.b250240001     --Total:
        --as total__housing_units,
        seq0103.b250240002     -- Total: 1, detached
        as total__units_in_structure_1_detached,
        seq0103.b250240003     -- Total: 1, attached
        as total__units_in_structure_1_attached,
        seq0103.b250240004     -- Total: 2
        as total__units_in_structure_2,
        seq0103.b250240005     -- Total: 3 or 4
        as total__units_in_structure_3_4,
        seq0103.b250240006     -- Total: 5 to 9
        as total__units_in_structure_5_9,
        seq0103.b250240007     -- Total: 10 to 19
        as total__units_in_structure_10_19,
        seq0103.b250240008     -- Total: 20 to 49
        as total__units_in_structure_20_49,
        seq0103.b250240009     -- Total: 50 or more
        as total__units_in_structure_50_or_more,
        seq0103.b250240010     -- Total: Mobile home
        as total__units_in_structure_mobile_homes,
        seq0103.b250240011     -- Total: Boat, RV, van, etc.
        as total__units_in_structure_other
    INTO public.temp
    FROM acs2012.seq0103 
    JOIN acs2012.geoheader header USING (stusab, logrecno)
    where header.sumlevel = '040'
    and component = '00';
    select * from histogram('public', 'temp', 'total__units_in_structure_3_4');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |  10029 |  91304 |   34 | ******************************
      2 |  96990 | 131758 |    9 | ********
      3 | 230152 | 234854 |    3 | ***
      4 | 305329 | 314623 |    2 | **
      5 | 343790 | 362321 |    2 | **
      8 | 598187 | 598187 |    1 | *
     10 | 757121 | 757121 |    1 | *


ACS2014
    seq0103                      UNITS IN STRUCTURE
    seq0103                      Universe:  Housing units
    seq0103       B25024001      Total:
    seq0103       B25024002      1, detached
    seq0103       B25024003      1, attached
    seq0103       B25024004      2
    seq0103       B25024005      3 or 4
    seq0103       B25024006      5 to 9
    seq0103       B25024007      10 to 19
    seq0103       B25024008      20 to 49
    seq0103       B25024009      50 or more
    seq0103       B25024010      Mobile home
    seq0103       B25024011      Boat, RV, van, etc.

--TEST QUERIES
--STATES
    drop table temp;
    SELECT
    name,
                      -- | UNITS IN STRUCTURE | Universe:  Housing units 
        --seq0103.B25024001      --Total:
        --as total__housing_units,
        seq0103.B25024002      --1, detached
        as total__units_in_structure_1_detached,
        seq0103.B25024003      --1, attached
        as total__units_in_structure_1_attached,
        seq0103.B25024004      --2
        as total__units_in_structure_2,
        seq0103.B25024005      --3 or 4
        as total__units_in_structure_3_4,
        seq0103.B25024006      --5 to 9
        as total__units_in_structure_5_9,
        seq0103.B25024007      --10 to 19
        as total__units_in_structure_10_19,
        seq0103.B25024008      --20 to 49
        as total__units_in_structure_20_49,
        seq0103.B25024009      --50 or more
        as total__units_in_structure_50_or_more,
        seq0103.B25024010      --Mobile home
        as total__units_in_structure_mobile_homes,
        seq0103.B25024011      --Boat, RV, van, etc.
        as total__units_in_structure_other
    INTO public.temp
    FROM acs2014.geoheader header
    join acs2014.seq0103 USING (stusab, logrecno)
    where header.sumlevel = '040'
    and component = '00'
    ;
    select * from histogram('public', 'temp', 'total__units_in_structure_3_4');

 bucket |  min   |  max   | freq |              bar               
--------+--------+--------+------+--------------------------------
      1 |   9982 |  93324 |   34 | ******************************
      2 |  98682 | 133452 |    9 | ********
      3 | 228642 | 231220 |    3 | ***
      4 | 308150 | 326464 |    2 | **
      5 | 348179 | 360401 |    2 | **
      8 | 602592 | 602592 |    1 | *
     10 | 763015 | 763015 |    1 | *

