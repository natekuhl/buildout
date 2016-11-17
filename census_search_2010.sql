create function census_search_2010(text) 
returns table(
    source10sf1 text, desc10sf1 text,
    source12 text, desc12 text
) as $$

with --DC2010 - sf1
    dc2010_sf1 as (
    select row_number() OVER () as rnum, 
        segment ||'-'|| table_number ||'-'|| field_code ||'-'|| dec_num as source10sf1,
        field_name as desc10sf1
    from dc2010.sf1_meta_2010
    where field_name ilike '%'||replace($1,' ','%')||'%'
    ), --ACS2008-2012 
    acs2012 as (
    select row_number() OVER () as rnum, 
        table_id as source12, 
        table_title as desc12
    from acs_2012.meta
    where table_title ilike '%'||replace($1,' ','%')||'%'
) select source10sf1, desc10sf1, source12, desc12
from dc2010_sf1
full outer join acs2012 using (rnum)

$$ language sql;
