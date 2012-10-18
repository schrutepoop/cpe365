rem kevin shibata
rem kkshibat@calpoly.edu

delete from flights
   where not(Airline = 4 or Airline = 8);

select *from flights;

update flights
   set Flightno = Flightno + 10000
   where (Airline = 8 and mod(flightno,2) = 0);

update flights
   set Flightno = Flightno + 1
   where flightno > 10000;

update flights
   set Flightno = Flightno - 1
   where (airline = 8 and Flightno < 10000);

update flights
   set Flightno = Flightno - 10000
   where (airline = 8 and Flightno > 10000);

select * from flights;

update flights
   set Flightno = Flightno + 2000
   where (Airline = 4);

update flights
   set Airline = 4
   where Airline = 8;

delete from airlines
   where airline = 'JetBlue Airways';

select * from flights;
  
select * from Airlines;

