rem Kevin Shibata
rem kkshibat@calpoly.edu

create table Rooms (
   RoomId char(3) PRIMARY KEY;
   RoomName varchar2(20),
   Beds integer,
   bedType varchar(10),
   maxOccupancy integer,
   BasePrice integer,
   Decor varchar2(20),
);

create table Reservatons (
   Code integer,
   Room char(3) REFERENCES Rooms,
   CheckIn date,
   CheckOut date,
   Rate float,
   LasteName varchar2(20),
   FirstName varchar2(20),
   Adults integer,
   Kids integer,
   PRIMARY KEY (adults, LastName, FirstName)
);
 
