
create table continents (
   ContID integer PRIMARY KEY,
   Continent varchar2(20)
);

create table countries (
   CountryId integer PRIMARY KEY,
   CountryName varchar2(20),
   Continent integer REFERENCES continents
);
create table CarMakers (
   Id integer PRIMARY KEY,
   Maker varchar2(20),
   FullName varchar2(30),
   Country integer REFERENCES countries
);

create table modelList (
   ModelId integer PRIMARY KEY,
   Maker integer REFERENCES CarMakers,
   Model varchar2(30) UNIQUE
);

create table CarName (
   MakeId integer PRIMARY KEY, 
   Model varchar2(30) REFERENCES modelList(Model),
   MakeDescription varchar2(50)
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

 
