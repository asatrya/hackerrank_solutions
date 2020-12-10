/*
Challenge link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem
Environment: MySQL
*/

SET @rownum = 0;
SET @totalrows = 0;

with 
sorted_station as (
    select 
        s.lat_n
        ,(@rownum := @rownum + 1) as rownumber
        ,@total_rows := @rownum as totalrows
    from station s
    ORDER BY s.lat_n
),
total_rows as (
    select count(s.lat_n) as val
    from station s
)
select round(ss.lat_n,4) 
from sorted_station ss, total_rows
where ss.rownumber in (floor((total_rows.val + 1) / 2), floor((total_rows.val + 2) / 2))
