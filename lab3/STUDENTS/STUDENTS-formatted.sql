rem kevin shibata
rem kkshibat@calpoly.edu


set linesize 2000;
set pagesize 10000;
set colsep '||'

column sfirstname heading "Student: First name";
column slastname heading "Student: Last name";
column lastname heading "";
column firstname heading "Teacher";

break on lastname on firstname skip 1 nodup;

select S.SlastName, S.sfirstName, T.firstname, T.lastname
  from list S, teachers T 
  where S.classroom = T.classroom
  order by T.LastName;
