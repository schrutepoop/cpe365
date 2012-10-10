rem Kevin Shibata
rem kkshibat@calpoly.edu

create table list (
   LastName varchar2(64),
   FirstName varchar2(64),
   Grade integer,
   classroom integer,
   PRIMARY KEY(LastName, FirstName, Grade, classroom)
);

create table teachers (
   LastName varchar(64),
   FirstName varchar(64),
   Classroom integer PRIMARY KEY
);

