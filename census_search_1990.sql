
create function census_search_1990(text) returns table(
    source90 text, desc90 text
) as $$
with meta as (
    select * from dc1990.meta1a 
    union all 
    select * from dc1990.meta3a
) 
select tables_table||'-'||segment||'-'||field as source90, text as desc90 
from meta 
where text ilike '%'||replace($1,' ','%')||'%'
$$ language sql;


--specific
select segment||'.'||field, text from dc1990.meta1a
union all 
select segment||'.'||field, text from dc1990.meta3a;


select * from dc1990.meta1a 
union all 
select * from dc1990.meta3a
;
