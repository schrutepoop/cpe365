rem Kevin Shibata
rem kkshibat@calpoly.edu

create table customers(
   Id integer PRIMARY KEY,
   LastName varchar2(20),
   FristName varchar2(20)
);

create table goods (
   Id varchar2(20) PRIMARY KEY,
   Flavor varchar2(20),
   Food varchar2(20),
   Price float
);

create table receipts (
   RecieptNumber integer PRIMARY KEY,
   DOP date,
   CustomerId integer REFERENCES Customers
);

create table items (
   Receipt integer REFERENCES receipts,
   Oridanl integer CHECK (Oridanl >=1) CHECK (Oridanl <=5), 
   Item varchar2(20),
   PRIMARY KEY (Receipt, Oridanl)
);

