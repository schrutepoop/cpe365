rem Kevin Shibata
rem kkshibat@calpoly.edu

create table continents (
   ContID integer PRIMARY KEY,
   Continent varchar2(64)
);

create table countries (
   CountryId integer PRIMARY KEY,
   CountryName varchar2(64),
   Continent integer REFERENCES continents
);
create table CarMakers (
   Id integer PRIMARY KEY,
   Maker varchar2(64),
   FullName varchar2(64),
   Country integer REFERENCES countries
);

create table modelList (
   ModelId integer PRIMARY KEY,
   Maker integer REFERENCES CarMakers,
   Model varchar2(64) UNIQUE
);

create table CarName (
   MakeId integer PRIMARY KEY, 
   Model varchar2(64) REFERENCES modelList(Model),
   MakeDescription varchar2(64)
);

create table carData (
   Id integer REFERENCES CarName, 
   MPG integer,
   Cylinders integer,
   Edispl integer, 
   Horsepower integer, 
   Weight integer,
   Accelerate integer,
   year integer
);

 
