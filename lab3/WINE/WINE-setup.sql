rem Kevin Shibata
rem kkshibat@calpoly.edu

create table appelations (
   No integer,
   Appelation varchar2(45) PRIMARY KEY,
   Country varchar2(45),
   State varchar2(30),
   Area varchar2(30),
   isAVA varchar2(3)
);

create table grapes (
   Id integer,
   Grape varchar2(30) PRIMARY KEY,
   Color varchar2(20)
);

create table wine(
   No integer PRIMARY KEY,  
   Grape varchar2(30) REFERENCES grapes,
   Winery varchar2(45),
   Appelation varchar(45) REFERENCES appelations,
   Name varchar2(45),
   Year integer,
   Price float,
   Score integer,
   Cases integer
);

