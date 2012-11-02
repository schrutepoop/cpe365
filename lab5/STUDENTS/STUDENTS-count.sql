rem kevin shibata
rem kkshibat@calpoly.edu

set linesize 200
set pagesize 100

rem query 1

select count(*) as Number_second_graders
   from list
   where grade = 2
   group by grade;

rem query 2

select count(distinct classroom) as "Number of classrooms"
   from list l
   where l.grade = 3
   group by grade;

rem query 3

select count(*) as "Total number of Students"
   from list l, list l2
   where l.classroom = l2.classroom
         and l.slastname = 'PINNELL'
         and l.sfirstname = 'ROBBY';

rem query 4

select count(*) as "Number of Students"
   from list l, teachers t
   where t.firstname = 'OTHA'
         and t.lastname = 'MOYER'
         and l.classroom = t.classroom
   group by t.classroom;

rem query 5

select t.lastname, t.firstname
   from list l, teachers t
   where t.classroom = l.classroom
   group by t.lastname, t.firstname
   having count(*) >= 4 and count(*) <= 6
   order by t.lastname;

rem query 6

select distinct grade, count(distinct classroom) as "Number of classrooms", 
       count(distinct slastname) as "Number of students"
   from list
   group by grade
   order by "Number of classrooms" desc, grade asc;
