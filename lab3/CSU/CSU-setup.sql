rem kevin shibata
rem kkshibat@calpoly.edu

Create Table Campuses(
   Id INTEGER PRIMARY KEY,
   Campus VARCHAR2(64),
   Location VARCHAR2(64),
   Country VARCHAR2(64),
   Year INTEGER
);

Create Table CsuFees (
   Campus INTEGER REFERENCES Campuses,
   Year INTEGER,
   CampusFee INTEGER
); 

Create Table Degrees(
   Year INTEGER,
   Campus Integer References Campuses,
   Degrees INTEGER
);

Create Table Disciplines(
   Id INTEGER PRIMARY KEY,
   Name VARCHAR2(64)
);

Create Table DisciplineEnrollemnts(
   Campus INTEGER references Campuses,
   Discipline INTEGER references Disciplines,
   Year INTEGER,
   Undergraduate INTEGER,
   Graduate INTEGER
);
 
Create Table Enrollments (
   Campus integer references Campuses,
   Year INTEGER,
   TotalEnrollment_AY INTEGER,
   FTE_AY INTEGER
);

Create Table Faculty (
   Campus integer references Campuses,
   Year integer,
   Faculty integer 
);
