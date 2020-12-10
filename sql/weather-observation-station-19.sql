/*
Challenge link: https://www.hackerrank.com/challenges/weather-observation-station-19
Environment: MySQL
*/
select round(sqrt(power(min(s.lat_n) - max(s.lat_n), 2) + power(min(s.long_w) - max(s.long_w), 2)), 4)
from station s
