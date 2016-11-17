create or replace function census_search_2000(text) 
returns table(
    source00sf1 text, desc00sf1 text,
    source00sf3 text, desc00sf3 text
) as $$

    with dc2000_sf1 as (
        select row_number() OVER () as rnum, 
            seg ||'-'|| table_name ||'-'|| fieldnum as source00sf1, 
            text_text as desc00sf1
        from dc2000.meta_sf1
        where text_text ilike '%'||replace($1,' ','%')||'%'
    ), --DC2000 - sf3
    dc2000_sf3 as (
        select row_number() OVER () as rnum, 
            seg ||'-'|| table_name ||'-'|| fieldnum as source00sf3, 
            text_text as desc00sf3
        from dc2000.meta_sf3
        where text_text ilike '%'||replace($1,' ','%')||'%'
    ) select source00sf1, desc00sf1, source00sf3, desc00sf3
    from dc2000_sf1
    full outer join dc2000_sf3 using (rnum)

$$ language sql;
