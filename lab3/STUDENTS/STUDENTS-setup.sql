rem Kevin Shibata
rem kkshibat@calpoly.edu

create table list (
   SlastName varchar2(25),
   sfirstName varchar2(25),
   Grade integer,
   classroom integer,
   PRIMARY KEY(LastName, FirstName, Grade, classroom)
);

create table teachers (
   LastName varchar(25),
   FirstName varchar(25),
   Classroom integer PRIMARY KEY
);

