rem Kevin Shibata
rem kkshibat@calpoly.edu

create table appelations (
   No integer,
   Appelation varchar2(20) PRIMARY KEY,
   Country varchar2(20),
   State varchar2(20),
   Area varchar2(20),
   isAVA varchar2(3)
);

create table grapes (
   Id integer,
   Grape varchar2(20) PRIMARY KEY,
   Color varchar2(20)
);

create table wine(
   No integer PRIMARY KEY,  
   Grape varchar2(20) REFERENCES Grape,
   Winery varchar2(20),
   Appelation varchar(20) REFERENCES appelations,
   Name varchar2(20),
   Year Date,
   Price float,
   Score integer,
   Cases integer,
);

