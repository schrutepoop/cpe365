rem kevin shibata
rem kkshibata@calpoly.edu

set linesize 2000;
set pagesize 1000;
delete from marathon
   where not(state = 'CT');

select Place, TO_CHAR(Time, '[[ HH:MI -->SS]]') AS Time, 
       TO_CHAR(Pace, '== MI,SS ==') AS Pace, GroupPlace, 
       PartiGroup, age, sex, BiBnumber, FirstName, LastName,
       Town, State
   from marathon;

delete from marathon
   where not(sex = 'M' and (age >= 50 and age <= 59));

select Place, TO_CHAR(Time, 'HH:MI.SS') AS Time, 
       TO_CHAR(Pace, 'MI::SS') AS Pace, GroupPlace, 
       PartiGroup, age, sex, BiBnumber, FirstName, LastName,
       Town, State
   from marathon;

alter table marathon
   drop (GroupPlace, PartiGroup, age, sex);

select Place, TO_CHAR(Time, 'HH:MI:(SS)') AS Time, BiBnumber, FirstName, LastName,
       Town, State
   from marathon;

 
   
