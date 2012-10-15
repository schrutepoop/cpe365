rem Kevin Shibata
rem kkshibat@calpoly.edu

create table list (
   LastName varchar2(30),
   FirstName varchar2(30),
   Grade integer,
   classroom integer,
   PRIMARY KEY(LastName, FirstName, Grade, classroom)
);

create table teachers (
   LastName varchar(30),
   FirstName varchar(30),
   Classroom integer PRIMARY KEY
);

