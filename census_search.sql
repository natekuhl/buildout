create or replace function census_search(text) returns table(
    source90sf1 text, desc90sf1 text,
    source90sf3 text, desc90sf3 text,
    source00sf1 text, desc00sf1 text,
    source00sf3 text, desc00sf3 text,
    source10sf1 text, desc10sf1 text,
    source12 text,    desc12    text,
    source14 text,    desc14    text
) as $$
    --DC1990 -sf1
    with dc1990_sf1 as (
    select row_number() OVER () as rnum, tables_table ||'-'|| field as source90sf1, text as desc90sf1
    from dc1990.meta1a
    where text ilike '%'||replace($1,' ','%')||'%'
    ), --DC1990 - sf3
    dc1990_sf3 as (
    select row_number() OVER () as rnum, tables_table ||'-'|| field as source90sf3, text as desc90sf3
    from dc1990.meta3a
    where text ilike '%'||replace($1,' ','%')||'%'
    ), --DC2000 - sf1
    dc2000_sf1 as (
    select row_number() OVER () as rnum, table_name ||'-'|| fieldnum as source00sf1, text_text as desc00sf1
    from dc2000.meta_sf1
    where text_text ilike '%'||replace($1,' ','%')||'%'
    ), --DC2000 - sf3
    dc2000_sf3 as (
    select row_number() OVER () as rnum, table_name ||'-'|| fieldnum as source00sf3, text_text as desc00sf3
    from dc2000.meta_sf3
    where text_text ilike '%'||replace($1,' ','%')||'%'
    ), --DC2010 - sf1
    dc2010_sf1 as (
    select row_number() OVER () as rnum, table_number ||'-'|| field_code as source10sf1, field_name as desc10sf1
    from dc2010.sf1_meta_2010
    where field_name ilike '%'||replace($1,' ','%')||'%'
    ), --DC2010 - sf2
    dc2010_sf2 as (
    select row_number() OVER () as rnum, table_id ||'-'|| field_code as source10sf2, field_name as desc10sf2
    from dc2010.sf2_meta_2010
    where field_name ilike '%'||replace($1,' ','%')||'%'
    ), --ACS2008-2012 
    acs2012 as (
    select row_number() OVER () as rnum, sequence_number ||'-'|| table_id as source12, table_title as desc12
    from acs_2012.meta
    where table_title ilike '%'||replace($1,' ','%')||'%'
    ), --ACS2014 
    acs2014 as (
    select row_number() OVER () as rnum, sequence_number||source_column as source14, table_title as desc14
    from acs2014.meta
    where table_title ilike '%'||replace($1,' ','%')||'%'
    ) 
    select 
        source90sf1 , desc90sf1 ,
        source90sf3 , desc90sf3 ,
        source00sf1 , desc00sf1 ,
        source00sf3 , desc00sf3 ,
        source10sf1 , desc10sf1 ,
        source12 ,    desc12    ,
        source14 ,    desc14    

    from dc1990_sf1
    full outer join dc1990_sf3 using (rnum)
    full outer join dc2000_sf1 using (rnum)
    --full outer join dc2000_sf2 using (rnum)
    full outer join dc2000_sf3 using (rnum)
    --full outer join dc2000_sf4 using (rnum)
    full outer join dc2010_sf1 using (rnum)
    --full outer join dc2010_sf2 using (rnum)
    full outer join acs2012 using (rnum)
    full outer join acs2014 using (rnum)
$$ language sql;
