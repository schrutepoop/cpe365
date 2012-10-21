rem kevin shibata
rem kkshibat@calpoly.edu

rem query 1

select distinct m.state, m.town
   from marathon m
   where    m.state <> 'MA'
         and m.state <> 'RI'
         and m.state <> 'CT'
         and m.sex = 'F'
         and m.partigroup = '20-39'
   order by m.state, m.town;

rem query 2

select distinct m.lastname, m.firstname, m.place, to_char(m.time, 'HH:MI:SS')
   from marathon m
   where m.town = 'N ATTL'
         and m.state = 'MA'
         and m.sex = 'M'
   order by m.place asc;

select m.town from marathon m where m.state = 'MA' and m.sex = 'M';

rem query 3

select distinct to_char(m.time,'HH:MI:SS') as over_all_time, m.lastname, m.firstname, m.town, m.state
   from marathon m
   where     m.age = 33
         and m.sex = 'F'
         and m.state = 'RI'
   order by over_all_time;

rem query 4

(select distinct m2.lastname, m2.firstname, m2.partigroup, m2.place, 
                m2.groupplace, to_char(m2.time,'HH:MI:SS') as running_time
   from marathon m1, marathon m2
   where     m1.bibnumber = 339
         and m2.bibnumber <> 339
         and m1.place > m2.place
         and m2.sex = 'F')
intersect
(select distinct m3.lastname, m3.firstname, m3.partigroup, m3.place,
                m3.groupplace, to_char(m3.time,'HH:MI:SS') as total_time
   from marathon m3, marathon m4
   where     m4.lastname = 'HAEDER'
         and m4.firstname = 'KEN'
         and m4.place < m3.place
         and m3.sex = 'F');

rem query 5

select distinct m1.partigroup as age_group, m1.sex, m1.lastname, m1.firstname,
               m1.groupplace, m2.lastname, m2.firstname, m2.groupplace
   from marathon m1, marathon m2
   where     m1.partigroup = m2.partigroup
         and m1.groupplace = 1
         and m2.groupplace = 2
         and m1.sex = m2.sex
   order by m1.sex, m1.partigroup;

rem query 6

select distinct to_char(m.pace,'MI:SS') as pace_, m.lastname, m.firstname,
          m.partigroup, m.place
   from marathon m
   where     m.time < to_date('1:29:22','HH:MI:SS')
         and m.state = 'CT'
         and m.sex = 'M'
   order by pace_;

