rem kevin shibata
rem kkshibat@calpoly.edu

set linesize 1000;
set pagesize 100;
set feedback 1;

rem query 1

select l.slastname, l.sfirstname
   from list l
   where l.classroom = 104;

rem query 2

select l.sfirstname, l.slastname, t.firstname, t.lastname
   from list l, teachers t
   where l.grade = 6 and (l.classroom = t.classroom)
   order by t.lastname, l.slastname;

rem query 3

select l.sfirstname, l.slastname, l.grade
   from list l
   where l.slastname like 'T%' or l.sfirstname like 'T%'
   order by l.grade;

rem query 4

select distinct t.classroom
   from list l, teachers t
   where l.grade = 4 and (l.classroom = t.classroom)
   order by t.classroom;

rem query 5

select l.sfirstname, l.slastname
   from list l, teachers t
   where (t.lastname = 'COVIN' and t.firstname = 'JEROME') and (l.classroom = t.classroom)
   order by l.slastname;

rem query 6

select distinct t.classroom, l.grade 
   from list l, teachers t
   where l.classroom = t.classroom
   order by l.grade desc; 

rem query 7

select distinct t.firstname, t.lastname, l.grade
   from list l, teachers t
   where l.classroom = t.classroom
   order by t.lastname;

rem query 8

select distinct l.slastname, l.sfirstname
   from list l, teachers t
   where not(t.lastname = 'SUMPTION' and t.firstname = 'GEORGETTA') 
   and l.grade = 4 and (l.classroom = t.classroom)
   order by l.slastname;
