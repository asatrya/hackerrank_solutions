/*
Challenge link: https://www.hackerrank.com/challenges/interviews/
Environment: MySQL
*/
select 
    ct.contest_id
    ,ct.hacker_id
    ,ct.name
    ,sum(total_submissions) as total_submissions
    ,sum(total_accepted_submissions) as total_accepted_submissions
    ,sum(total_views) as total_views
    ,sum(total_unique_views) as total_unique_views
from contests as ct
left join colleges as cl on ct.contest_id = cl.contest_id
left join challenges as ch on cl.college_id = ch.college_id 
left join (
   select 
        v.challenge_id
        ,sum(v.total_views) as total_views
        ,sum(v.total_unique_views) as total_unique_views
   from view_stats v
   group by v.challenge_id
) as view_stats_agg on ch.challenge_id = view_stats_agg.challenge_id
left join (
    select 
        s.challenge_id
        ,sum(s.total_submissions) as total_submissions
        ,sum(s.total_accepted_submissions) as total_accepted_submissions
    from submission_stats s
    group by s.challenge_id
) as submissions_stats_agg on ch.challenge_id = submissions_stats_agg.challenge_id
group by ct.contest_id, ct.hacker_id, ct.name
having total_submissions > 0
    or total_accepted_submissions > 0
    or total_views > 0
    or total_unique_views > 0
order by ct.contest_id;
