rem kevin shibata
rem kkshibat@calpoly.edu

rem updating the gpa tables
alter table list 
   add (
      gpa float check (gpa <=5.0 and gpa >= 0.0),
      busroute int check ( busroute = 0 or (busroute <= 55 and busroute >= 50 ));
update list
   set gpa = 4.0
   where Grade = 0;

update list 
   set gpa = 3.0
   where Grade classroom = 112;

update list 
   set gpa = 2.8
   where Grade = 1 and classroom <> 102;

update list 
   set gpa = 3.2
   where gpa is NULL;

rem upadating the bus routes

update list
   set busroute = 51
   where (FirstName = "ELTON" and LastName = "FULVIO") 
   or (FirstName = "ANIKA" and LastName = "YUEN")
   or (FirstName = "JANEE" and LastName = "DANESE");

update list 
   set busroute = 52
   where grade = 2 and grade = 1;

update lsit 
   set busroute = 53
   where Classroom = 112 and not (Firstname = "STORMY" and LastName = "KRISTENSEN");

update list 
   set busroute = 54
   where  (FirstName = "STORMY" and LastName = "KRISTENSEN");

update list
   set busroute = 0
   where busroute is null;

