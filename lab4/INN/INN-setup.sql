rem Kevin Shibata
rem kkshibat@calpoly.edu

create table Rooms (
   RoomId char(3) PRIMARY KEY,
   RoomName varchar2(25),
   Beds integer,
   bedType varchar(10),
   maxOccupancy integer,
   BasePrice integer,
   Decor varchar2(20)
);

create table Reservations (
   Code integer PRIMARY KEY,
   Room char(3) REFERENCES Rooms,
   CheckIn date,
   CheckOut date,
   Rate float,
   LasteName varchar2(20),
   FirstName varchar2(20),
   Adults integer,
   Kids integer
);
 
