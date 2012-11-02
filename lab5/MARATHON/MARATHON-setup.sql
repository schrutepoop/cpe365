rem Kevin Shibata
rem kkshiba@caloply.edu

create table marathon (
   Place integer PRIMARY KEY,
   Time date,
   Pace date,
   GroupPlace integer,
   PartiGroup varchar2(15),
   Age integer,
   sex char(1),
   BIBNumber integer,
   FirstName varchar2(15),
   LastName varchar2(15),
   Town varchar2(15),
   State char(2),
   UNIQUE(GroupPlace, partigroup, sex)
);
