rem kevin shibata
rem kkshibat@calpoly.edu

set pagesize 200
set linesize 200

rem query 1

select count(*) as "numb participants"
   from marathon m
   where m.time < to_date('1:20:00','HH:MI:SS');

rem query 2

select count(*) as "Females from MA in top 75"
   from marathon m
   where m.place <= 75
         and m.state = 'MA'
         and m.sex = 'F';

rem query 3

select m.partigroup, m.sex, count(m.bibnumber) as "number of participants",
       min(m.place) as "best of groups runners place", 
       to_char(min(m.time),'HH:MI:SS') as "best time in the group"
   from marathon m
   group by m.partigroup, m.sex
   order by m.partigroup, m.sex;

rem query 4

select m.state, count(*) as "number of runners in top 50"
   from marathon m
   where m.groupplace <= 50
   group by m.state
   having count(*) > 0
   order by "number of runners in top 50" desc;


rem query 5

select m.town, 
       (avg(to_number(to_char(m.time,'HH'))) * 60 * 60) +
       (avg(to_number(to_char(m.time,'MI'))) * 60) +
       avg(to_number(to_char(m.time,'SS'))) as "AVG time in seconds"
   from marathon m
   where m.state = 'CT'
   group by m.town
   having count(*) >= 3
   order by "AVG time in seconds" asc;


