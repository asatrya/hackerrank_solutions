/*
Challenge link: https://www.hackerrank.com/challenges/binary-search-tree-1/
Environment: MySQL
*/

select distinct
    t.n
    ,case
        when t.p is null then 'Root'
        when t2.p is not null then 'Inner'
        else 'Leaf'
    end
from bst t
left join bst t2 on t.n = t2.p
order by t.n
