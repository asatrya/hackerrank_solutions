/*
Challenge link: https://www.hackerrank.com/challenges/occupations
Environment: MySQL
*/

SET @cnt_doctors = 0;
SET @cnt_professors = 0;
SET @cnt_singers = 0;
SET @cnt_actors = 0;

with 
doctors as (
    select 
        (@cnt_doctors := @cnt_doctors + 1) AS rowNumber, 
        o.name
    from occupations o
    where o.occupation = 'Doctor'
    order by 2
),
professors as (
    select 
        (@cnt_professors := @cnt_professors + 1) AS rowNumber, 
        o.name
    from occupations o
    where o.occupation = 'Professor'
    order by 2
),
singers as (
    select 
        (@cnt_singers := @cnt_singers + 1) AS rowNumber, 
        o.name
    from occupations o
    where o.occupation = 'Singer'
    order by 2
),
actors as (
    select 
        (@cnt_actors := @cnt_actors + 1) AS rowNumber, 
        o.name
    from occupations o
    where o.occupation = 'Actor'
    order by 2
),
doctors_professors as (
    select
        coalesce(d.rowNumber, p.rowNumber) as rowNumber
        ,d.name as d_name
        ,p.name as p_name
    from doctors d
    left join professors p on d.rowNumber = p.rowNumber
    union
    select
        coalesce(d.rowNumber, p.rowNumber) as rowNumber
        ,d.name as d_name
        ,p.name as p_name
    from doctors d
    right join professors p on d.rowNumber = p.rowNumber
    where d.rowNumber is null
),
doctors_professors_singers as (
    select
        coalesce(dp.rowNumber, s.rowNumber) as rowNumber
        ,dp.d_name
        ,dp.p_name
        ,s.name as s_name
    from doctors_professors dp
    left join singers s on dp.rowNumber = s.rowNumber
    union
    select
        coalesce(dp.rowNumber, s.rowNumber) as rowNumber
        ,dp.d_name
        ,dp.p_name
        ,s.name as s_name
    from doctors_professors dp
    right join singers s on dp.rowNumber = s.rowNumber
    where dp.rowNumber is null
),
doctors_professors_singers_actors as (
    select
        coalesce(dps.rowNumber, a.rowNumber) as rowNumber
        ,dps.d_name
        ,dps.p_name
        ,dps.s_name
        ,a.name as a_name
    from doctors_professors_singers dps
    left join actors a on dps.rowNumber = a.rowNumber
    union
    select
        coalesce(dps.rowNumber, a.rowNumber) as rowNumber
        ,dps.d_name
        ,dps.p_name
        ,dps.s_name
        ,a.name as a_name
    from doctors_professors_singers dps
    left join actors a on dps.rowNumber = a.rowNumber
    where dps.rowNumber is null
)
select
    t.d_name
    ,t.p_name
    ,t.s_name
    ,t.a_name
from doctors_professors_singers_actors t
