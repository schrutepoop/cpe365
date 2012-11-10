rem kevin shibata
rem kkshibat@calpolyl.edu

rem query 1

select l.grade, ll.max
   from (select grade, count(distinct classroom) as c
         from list 
         group by grade) l,
        (select max(count(distinct classroom)) as max
         from list
         group by grade) ll
   where ll.max = l.c;
         
rem query 2

select t.lastname, t.firstname, t.classroom
   from (select classroom, count(*) as c
         from list
         group by classroom) l,
        (select min(count(*)) as min
         from list
         group by classroom) ll,
        teachers t
   where ll.min = l.c and
         l.classroom = t.classroom; 

rem query 3

select count(*) as "#classrooms below avg"
   from (select classroom, count(*) as c
         from list
         group by classroom) l,
        (select avg(count(*)) as average
         from list
         group by classroom) ll
   where l.c < ll.average;
   
rem query 4

select ll.grade
   from (select count(*) as c
         from list
         where grade = 4) l,
        (select grade, count(*) as cc
         from list
         group by grade) ll
   where ll.grade <> 4 and
         ll.cc < l.c;

rem query 5

select ll.grade, l.grade, l.c
   from (select grade, count(*) as c
         from list
         group by grade) l,
        (select grade, count(*) as cc
         from list
         group by grade) ll
   where l.c = ll.cc and
         l.grade <> ll.grade and
         l.grade < ll.grade;
         
