DC1990
    STF330                 TENURE BY VEHICLES AVAILABLE                  
                           Universe: Occupied housing units             
                           Owner occupied:                              
    STF330    H0370001       None                                        
    STF330    H0370002       1                                           
    STF330    H0370003       2                                           
    STF330    H0370004       3                                           
    STF330    H0370005       4                                           
    STF330    H0370006       5 or more                                   
                           Renter occupied:                             
    STF330    H0370007       None                                        
    STF330    H0370008       1                                           
    STF330    H0370009       2                                           
    STF330    H0370010       3                                           
    STF330    H0370011       4                                           
    STF330    H0370012       5 or more                                   

--TEST QUERIES
--STATES 
    drop table temp;
    SELECT
        stusab,
                     --| TENURE BY VEHICLES AVAILABLE | Universe: Occupied housing units                  
        STF330.H0370001+      --None  Owner occupied:                                       
        STF330.H0370007       --None  Renter occupied:                                      
        as total__housing_units_vehicles_available_none,
        STF330.H0370002+      --1   Owner occupied:                                         
        STF330.H0370008       --1   Renter occupied:                                        
        as total__housing_units_vehicles_available_1,
        STF330.H0370003+      --2    Owner occupied:                                        
        STF330.H0370009       --2    Renter occupied:                                       
        as total__housing_units_vehicles_available_2,
        STF330.H0370004+      --3     Owner occupied:                                       
        STF330.H0370010+      --3     Renter occupied:                                      
        STF330.H0370005+      --4      Owner occupied:                                      
        STF330.H0370011+      --4      Renter occupied:                                     
        STF330.H0370006+      --5 or more   Owner occupied:                                 
        STF330.H0370012       --5 or more   Renter occupied:                                
        as total__housing_units_vehicles_available_3_or_more
    INTO public.temp
    FROM dc1990.stf1a0 header
    join dc1990.stf330 using (statefp, logrecnu)
    where header.sumlev = '040'
    and geocomp = '00';
    select * from histogram('public', 'temp', 'total__housing_units_vehicles_available_2');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   40995 |  441157 |   23 | ******************************
      2 |  481034 |  899966 |   20 | **************************
      3 |  903340 | 1030686 |    5 | *******
      4 | 1332965 | 1757115 |   15 | ********************
      5 | 1891008 | 1891008 |    2 | ***
      6 | 2422344 | 2422344 |    2 | ***
     10 | 3914755 | 3914755 |    4 | *****

DC2000
    SF30058                 TENURE BY VEHICLES AVAILABLE [15]
    SF30058                 universe:  occupied housing units
    SF30058    h044001      total:
    SF30058    h044002      owner occupied:
    SF30058    h044003      no vehicle available
    SF30058    h044004      1 vehicle available
    SF30058    h044005      2 vehicles available
    SF30058    h044006      3 vehicles available
    SF30058    h044007      4 vehicles available
    SF30058    h044008      5 or more vehicles available
    SF30058    h044009      renter occupied:
    SF30058    h044010      no vehicle available
    SF30058    h044011      1 vehicle available
    SF30058    h044012      2 vehicles available
    SF30058    h044013      3 vehicles available
    SF30058    h044014      4 vehicles available
    SF30058    h044015      5 or more vehicles available

--TEST QUERIES
--STATES
    drop table temp;
    SELECT
    name,
        -- | TENURE BY VEHICLES AVAILABLE | Universe:  occupied housing units
        SF30058.h044003+     -- no vehicle available
        SF30058.h044010      -- no vehicle available
        as total__housing_units_vehicles_available_none,
        SF30058.h044004+     -- 1 vehicle available
        SF30058.h044011      -- 1 vehicle available
        as total__housing_units_vehicles_available_1,
        SF30058.h044005+     -- 2 vehicles available
        SF30058.h044012      -- 2 vehicles available
        as total__housing_units_vehicles_available_2,
        SF30058.h044006+     -- 3 vehicles available
        SF30058.h044013+     -- 3 vehicles available
        SF30058.h044007+     -- 4 vehicles available
        SF30058.h044014+     -- 4 vehicles available
        SF30058.h044008+     -- 5 or more vehicles available
        SF30058.h044015      -- 5 or more vehicles available
        as total__housing_units_vehicles_available_3_or_more
    INTO public.temp
    FROM dc2000.geosf3 header
    join dc2000.sf30058 USING (stusab, logrecno)
    where header.sumlev = '040'
    and geocomp = '00';
    select * from histogram('public', 'temp', 'total__housing_units_vehicles_available_2');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   38395 |  464402 |   23 | ******************************
      2 |  529491 |  941344 |   17 | **********************
      3 | 1068102 | 1250640 |    4 | *****
      4 | 1541576 | 1927691 |    5 | *******
      5 | 2419707 | 2419707 |    1 | *
      7 | 3024813 | 3024813 |    1 | *
     10 | 4342204 | 4342204 |    1 | *


ACS2012
Universe - Occupied Housing Units
    SEQ0104       B250440001     Total:
    SEQ0104       B250440002     Total: Owner occupied:
    SEQ0104       B250440003     Total: Owner occupied: No vehicle available
    SEQ0104       B250440004     Total: Owner occupied: 1 vehicle available
    SEQ0104       B250440005     Total: Owner occupied: 2 vehicles available
    SEQ0104       B250440006     Total: Owner occupied: 3 vehicles available
    SEQ0104       B250440007     Total: Owner occupied: 4 vehicles available
    SEQ0104       B250440008     Total: Owner occupied: 5 or more vehicles available
    SEQ0104       B250440009     Total: Renter occupied:
    SEQ0104       B250440010     Total: Renter occupied: No vehicle available
    SEQ0104       B250440011     Total: Renter occupied: 1 vehicle available
    SEQ0104       B250440012     Total: Renter occupied: 2 vehicles available
    SEQ0104       B250440013     Total: Renter occupied: 3 vehicles available
    SEQ0104       B250440014     Total: Renter occupied: 4 vehicles available
    SEQ0104       B250440015     Total: Renter occupied: 5 or more vehicles available

--TEST QUERIES
--STATES
    drop table temp;
    SELECT
    name,
        -- | TENURE BY VEHICLES AVAILABLE | Universe:  occupied housing units
        SEQ0104.B250440003+     --Total: Owner occupied: No vehicle available
        seq0104.b250440010     --total: renter occupied: no vehicle available
        as total__housing_units_vehicles_available_none,
        SEQ0104.B250440004+     --Total: Owner occupied: 1 vehicle available
        SEQ0104.B250440011     --Total: Renter occupied: 1 vehicle available
        as total__housing_units_vehicles_available_1,
        SEQ0104.B250440005+     --Total: Owner occupied: 2 vehicles available
        SEQ0104.B250440012     --Total: Renter occupied: 2 vehicles available
        as total__housing_units_vehicles_available_2,
        SEQ0104.B250440006+     --Total: Owner occupied: 3 vehicles available
        SEQ0104.B250440013+     --Total: Renter occupied: 3 vehicles available
        SEQ0104.B250440007+     --Total: Owner occupied: 4 vehicles available
        SEQ0104.B250440014+     --Total: Renter occupied: 4 vehicles available
        SEQ0104.B250440008+     --Total: Owner occupied: 5 or more vehicles available
        SEQ0104.B250440015     --Total: Renter occupied: 5 or more vehicles available
        as total__housing_units_vehicles_available_3_or_more
    INTO public.temp
    FROM acs2012.geoheader header
    join acs2012.seq0104 USING (stusab, logrecno)
    where header.sumlevel = '040'
    and component = '00';
    select * from histogram('public', 'temp', 'total__housing_units_vehicles_available_2');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   39654 |  522246 |   24 | ******************************
      2 |  567603 |  996778 |   16 | ********************
      3 | 1151879 | 1484159 |    5 | ******
      4 | 1732617 | 1939075 |    4 | *****
      6 | 2725483 | 2725483 |    1 | *
      7 | 3563093 | 3563093 |    1 | *
     10 | 4679680 | 4679680 |    1 | *



ACS2014
    SEQ0104                           TENURE BY VEHICLES AVAILABLE
    SEQ0104                           Universe:  Occupied housing units
    SEQ0104          B25044001        Total:
    SEQ0104          B25044002        Owner occupied:
    SEQ0104          B25044003        No vehicle available
    SEQ0104          B25044004        1 vehicle available
    SEQ0104          B25044005        2 vehicles available
    SEQ0104          B25044006        3 vehicles available
    SEQ0104          B25044007        4 vehicles available
    SEQ0104          B25044008        5 or more vehicles available
    SEQ0104          B25044009        Renter occupied:
    SEQ0104          B25044010        No vehicle available
    SEQ0104          B25044011        1 vehicle available
    SEQ0104          B25044012        2 vehicles available
    SEQ0104          B25044013        3 vehicles available
    SEQ0104          B25044014        4 vehicles available
    SEQ0104          B25044015        5 or more vehicles available

--TEST QUERIES
--STATES
    drop table temp;
    SELECT
    name,
             --| TENURE BY VEHICLES AVAILABLE | Universe:  Occupied housing units
        SEQ0104.B25044003+       -- No vehicle available
        SEQ0104.B25044010        -- No vehicle available
        as total__housing_units_vehicles_available_none,
        SEQ0104.B25044004+       -- 1 vehicle available
        SEQ0104.B25044011        -- 1 vehicle available
        as total__housing_units_vehicles_available_1,
        SEQ0104.B25044005+       -- 2 vehicles available
        SEQ0104.B25044012        -- 2 vehicles available
        as total__housing_units_vehicles_available_2,
        SEQ0104.B25044006+       -- 3 vehicles available
        SEQ0104.B25044013+       -- 3 vehicles available
        SEQ0104.B25044007+       -- 4 vehicles available
        SEQ0104.B25044014+       -- 4 vehicles available
        SEQ0104.B25044008+       -- 5 or more vehicles available
        SEQ0104.B25044015        -- 5 or more vehicles available
        as total__housing_units_vehicles_available_3_or_more
    INTO public.temp 
    FROM acs2014.geoheader header
    join acs2014.seq0104 USING (stusab, logrecno)
    where header.sumlevel = '040'
    and component = '00';
    select * from histogram('public', 'temp', 'total__housing_units_vehicles_available_2');

 bucket |   min   |   max   | freq |              bar               
--------+---------+---------+------+--------------------------------
      1 |   41487 |  515426 |   24 | ******************************
      2 |  571497 | 1006576 |   16 | ********************
      3 | 1152943 | 1471971 |    5 | ******
      4 | 1724675 | 1921643 |    4 | *****
      6 | 2737573 | 2737573 |    1 | *
      7 | 3645441 | 3645441 |    1 | *
     10 | 4730132 | 4730132 |    1 | *


