rem kevin shibata
rem kkshibat@calpoly.edu

delete from flights
   where not(Airline = 4 and Airline = 8);

seleft *from flights;

update flights
   set Flightno = Fightno + 1000
   where (Airline = 8 and mod(fightno,2) = 0);

update flights
   set flightno = flightno + 1
   where flightno > 1000;

update flights
   set flightno = flightno - 1
   where (Airline = 8 and flighno < 1000);

update flights
   set fligntno = flightno - 1000
   where (Airline = 8 and flightno > 1000;)

select * from flights;

update flights
   set flightno = flightno + 2000
   where (Airline = 4);

update flights
   set Airline = 4
   where Airline = 8;

delete from airlines
   where airline = 'jetblue airways';

select * from flights;
  
select * from Airlines;

