rem kevin shibata
rem kkshibat@calpoly.edu

rem query 1

select distinct air.airline, air.abbreviation
   from airlines air, flights f
   where f.sourceairport = 'NDV'
         and f.airline = air.id
   order by air.airline;

rem query 2

select distinct a.airline, a.abbreviation
   from airlines a, flights f
   where f.destairport = 'CVO'
         and f.airline = a.id
   order by a.airline;

rem query 3

(select distinct air.airline, air.abbreviation
   from airlines air, flights f1
   where f1.sourceairport = 'NDV'
         and f1.airline = air.id)
intersect
(select distinct a.airline, a.abbreviation
   from airlines a, flights f2
   where f2.destairport = 'CVO'
         and f2.airline = a.id);

rem query 4

select distinct a.airline, a.abbreviation 
   from airlines a, flights f
   where     f.sourceairport = 'NDV'
         and f.destairport = 'CVO'
         and f.airline = a.id
   order by a.airline;

rem query 5

select distinct port1.airportname, port1.airportcode
   from flights f1, flights f2,airports100 port1
   where     f1.flightno = f2.flightno
         and f1.sourceairport = 'NDV'
         and f1.sourceairport <> port1.airportcode
   order by port1.airportcode;

select *from airports100 a where a.airportcode = 'NDV';

select * from flights f where f.destairport = 'NDV';

select * from flights f where f.flightno = 1023;
