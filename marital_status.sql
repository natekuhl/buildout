****DC1990****


    STF307                SEX BY MARITAL STATUS                  
                          Universe: Persons 15 years and over   
                          Male:                                 
    STF307   P0270001       Never married                        
                            Now married:                        
    STF307   P0270002         Married, spouse present            
                              Married, spouse absent:           
    STF307   P0270003           Separated                        
    STF307   P0270004           Other                            
    STF307   P0270005       Widowed                              
    STF307   P0270006       Divorced                             
                          Female:                               
    STF307   P0270007       Never married                        
                            Now married:                        
    STF307   P0270008         Married, spouse present            
                              Married, spouse absent:           
    STF307   P0270009           Separated                        
    STF307   P0270010           Other                            
    STF307   P0270011       Widowed                              
    STF307   P0270012       Divorced                             

--TEST QUERIES
--STATES                             

    drop table temp;
    SELECT
        stusab,
                   -- | SEX BY MARITAL STATUS | Universe: Persons 15 years and over             
                             --Never Married:
        STF307.P0270001 +    --    Never married                        
        STF307.P0270007      --    Never married                        
        as total__persons_never_married,

                             --  Now married:             
                             --  Male:
        STF307.P0270002 +    --    Married, spouse present
                             --    Married, spouse absent:
        STF307.P0270003 +    --       Separated           
        STF307.P0270004 +    --       Other               
                             --  Female:                               
                             --  Now married:                        
        STF307.P0270008 +    --    Married, spouse present            
                             --    Married, spouse absent:           
        STF307.P0270009 +    --       Separated                        
        STF307.P0270010      --       Other                            
        as total__persons_now_married,

                             --  Male: 
        STF307.P0270006 +    --      Divorced                             
                             --  Female:                               
        STF307.P0270012      --      Divorced                             
        as total__persons_divorced,

                             --  Male: 
        STF307.P0270005 +    --     Widowed                              
                             --  Female:                               
        STF307.P0270011      --     Widowed                              
        as total__persons_widowed
    INTO public.temp
    FROM dc1990.stf1a0 header
    JOIN dc1990.stf307 USING (statefp, logrecnu)
    where header.sumlev = '040'
    and header.geocomp = '00';
    select * from histogram('public', 'temp', 'total__persons_never_married');

--BLOCK GROUPS 
    SELECT
        header.blckgr,
                   -- | SEX BY MARITAL STATUS | Universe: Persons 15 years and over             
                             --Never Married:
        STF307.P0270001 +    --    Never married                        
        STF307.P0270007      --    Never married                        
        as total__persons_never_married,

                             --  Now married:             
                             --  Male:
        STF307.P0270002 +    --    Married, spouse present
                             --    Married, spouse absent:
        STF307.P0270003 +    --       Separated           
        STF307.P0270004 +    --       Other               
                             --  Female:                               
                             --  Now married:                        
        STF307.P0270008 +    --    Married, spouse present            
                             --    Married, spouse absent:           
        STF307.P0270009 +    --       Separated                        
        STF307.P0270010      --       Other                            
        as total__persons_now_married,

                             --  Male: 
        STF307.P0270006 +    --      Divorced                             
                             --  Female:                               
        STF307.P0270012      --      Divorced                             
        as total__persons_divorced,

                             --  Male: 
        STF307.P0270005 +    --     Widowed                              
                             --  Female:                               
        STF307.P0270011      --     Widowed                              
        as total__persons_widowed
    FROM dc1990.stf1a0 header
    JOIN dc1990.stf307 USING (statefp, logrecnu)
    where header.sumlev = '150'
    and header.geocomp = '00';


****DC2000**** 

    sf30002                sex by marital status for the population 15 years and over [19]
    sf30002                universe:  population 15 years and over
    sf30002    p018001     total:
    sf30002    p018002     male:
    sf30002    p018003     never married
    sf30002    p018004     now married:
    sf30002    p018005     married, spouse present
    sf30002    p018006     married, spouse absent:
    sf30002    p018007     separated
    sf30002    p018008     other
    sf30002    p018009     widowed
    sf30002    p018010     divorced
    sf30002    p018011     female:
    sf30002    p018012     never married
    sf30002    p018013     now married:
    sf30002    p018014     married, spouse present
    sf30002    p018015     married, spouse absent:
    sf30002    p018016     separated
    sf30002    p018017     other
    sf30002    p018018     widowed
    sf30002    p018019     divorced


--NEVER MARRIED 

--TEST QUERIES
--STATES 
    drop table temp;
    SELECT
        name,
                  --| SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER | Universe:  population 15 years and over
                              -- male:
        sf30002.p018003 +     -- never married
                              -- female:
        sf30002.p018012       -- never married
        as total__persons_never_married,

                              --male
        sf30002.p018004 +     -- now married:
                              --female
        sf30002.p018013       -- now married: 
        as total__persons_now_married,

                              --male
        sf30002.p018010 +     -- divorced
                              --female
        sf30002.p018019       -- divorced
        as total__persons_divorced,

                              --male
        sf30002.p018009 +     -- widowed
                              --female
        sf30002.p018018       -- widowed
        as total__persons_widowed
    INTO public.temp
    FROM dc2000.geosf3 header
    JOIN dc2000.sf30002 USING (stusab,logrecno)
    where header.sumlev = '040'
    and geocomp = '00';
    select * from histogram('public', 'temp', 'total__persons_never_married');

--BLOCK GROUPS 

    SELECT
        name,
                  --| SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER | Universe:  population 15 years and over
                              -- male:
        sf30002.p018003 +     -- never married
                              -- female:
        sf30002.p018012       -- never married
        as total__persons_never_married,

                              --male
        sf30002.p018004 +     -- now married:
                              --female
        sf30002.p018013       -- now married: 
        as total__persons_now_married,

                              --male
        sf30002.p018010 +     -- divorced
                              --female
        sf30002.p018019       -- divorced
        as total__persons_divorced,

                              --male
        sf30002.p018009 +     -- widowed
                              --female
        sf30002.p018018       -- widowed
        as total__persons_widowed
    INTO public.temp
    FROM dc2000.geosf3 header
    JOIN dc2000.sf30002 USING (stusab,logrecno)
    where header.sumlev = '150'
    and geocomp = '00';


****ACS2012**** 
    SEQ0038     B120010001     Total:
    SEQ0038     B120010002     Total: Male:
    SEQ0038     B120010003     Total: Male: Never married
    SEQ0038     B120010004     Total: Male: Now married:
    SEQ0038     B120010005     Total: Male: Now married: Married, spouse present
    SEQ0038     B120010006     Total: Male: Now married: Married, spouse absent:
    SEQ0038     B120010007     Total: Male: Now married: Married, spouse absent: Separated
    SEQ0038     B120010008     Total: Male: Now married: Married, spouse absent: Other
    SEQ0038     B120010009     Total: Male: Widowed
    SEQ0038     B120010010     Total: Male: Divorced
    SEQ0038     B120010011     Total: Female:
    SEQ0038     B120010012     Total: Female: Never married
    SEQ0038     B120010013     Total: Female: Now married:
    SEQ0038     B120010014     Total: Female: Now married: Married, spouse present
    SEQ0038     B120010015     Total: Female: Now married: Married, spouse absent:
    SEQ0038     B120010016     Total: Female: Now married: Married, spouse absent: Separated
    SEQ0038     B120010017     Total: Female: Now married: Married, spouse absent: Other
    SEQ0038     B120010018     Total: Female: Widowed
    SEQ0038     B120010019     Total: Female: Divorced

    SELECT
        name,
                   -- | SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER | Universe:  population 15 years and over
        SEQ0038.B120010003+     -- Total: Male: Never married
        SEQ0038.B120010012      -- Total: Female: Never married
        as total__persons_never_married,
        SEQ0038.B120010004+     -- Total: Male: Now married:
        SEQ0038.B120010013      -- Total: Female: Now married:
        as total__persons_now_married,
        SEQ0038.B120010009+     -- Total: Male: Widowed
        SEQ0038.B120010018      -- Total: Female: Widowed
        as total__persons_widowed,
        SEQ0038.B120010010+     -- Total: Male: Divorced
        SEQ0038.B120010019      -- Total: Female: Divorced
        as total__persons_divorced
    FROM acs2012.geoheader header
    JOIN acs2012.seq0038 USING (stusab, logrecno)
    where header.sumlevel = '150'
    and component = '00';


****ACS2014**** 
    seq0037         | B1200100      | Marital Status                      | SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER
    seq0037         | B1200100      |                                     | Universe:  Population 15 years and over
    seq0037         | B12001001     |                                     | Total:
    seq0037         | B12001002     |                                     | Male:
    seq0037         | B12001003     |                                     | Never married
    seq0037         | B12001004     |                                     | Now married:
    seq0037         | B12001005     |                                     | Married, spouse present
    seq0037         | B12001006     |                                     | Married, spouse absent:
    seq0037         | B12001007     |                                     | Separated
    seq0037         | B12001008     |                                     | Other
    seq0037         | B12001009     |                                     | Widowed
    seq0037         | B12001010     |                                     | Divorced
    seq0037         | B12001011     |                                     | Female:
    seq0037         | B12001012     |                                     | Never married
    seq0037         | B12001013     |                                     | Now married:
    seq0037         | B12001014     |                                     | Married, spouse present
    seq0037         | B12001015     |                                     | Married, spouse absent:
    seq0037         | B12001016     |                                     | Separated
    seq0037         | B12001017     |                                     | Other
    seq0037         | B12001018     |                                     | Widowed
    seq0037         | B12001019     |                                     | Divorced


--TEST QUERIES
--STATES 
    drop table temp;
    SELECT
        name,
                -- | SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER | Universe:  Population 15 years and over
        seq0037.B12001003+   --  Never married
        seq0037.B12001012   --  Never married
        as total__persons_never_married,
        seq0037.B12001004+   --  Now married:
        seq0037.B12001013   --  Now married:
        as total__persons_now_married,
        seq0037.B12001009+   --  Widowed
        seq0037.B12001018   --  Widowed
        as total__persons_widowed,
        seq0037.B12001010+   --  Divorced
        seq0037.B12001019   --  Divorced
        as total__persons_divorced
    INTO public.temp
    FROM acs2014.geoheader header 
    JOIN acs2014.seq0037 USING (stusab, logrecno)
    where header.sumlevel= '040'
    and component = '00'
    ;
    select * from histogram('public', 'temp','total__persons_never_married');

--BLOCK GROUPS

    SELECT
        name,
                -- | SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER | Universe:  Population 15 years and over
        seq0037.B12001003+   --  Never married
        seq0037.B12001012   --  Never married
        as total__persons_never_married,
        seq0037.B12001004+   --  Now married:
        seq0037.B12001013   --  Now married:
        as total__persons_now_married,
        seq0037.B12001009+   --  Widowed
        seq0037.B12001018   --  Widowed
        as total__persons_widowed,
        seq0037.B12001010+   --  Divorced
        seq0037.B12001019   --  Divorced
        as total__persons_divorced
    FROM acs2014.geoheader header 
    JOIN acs2014.seq0037 USING (stusab, logrecno)
    where header.sumlevel= '150'
    and component = '00'
    ;

