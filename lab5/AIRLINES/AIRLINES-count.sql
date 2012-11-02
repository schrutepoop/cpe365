rem kevin shibata
rem kkshibat@calpoly.edu

set linesize 200
set pagesize 200

rem query 1

select count(*) as "number flights from AHD"
   from flights f
   where f.sourceairport = 'AHD';

rem query 2

select count(*) as "# direct flights"
   from flights f
   where (f.sourceairport = 'ATV'
         and f.destairport = 'ALE')
         or (f.sourceairport = 'ALE'
         and f.destairport = 'ATV');

rem query 3

select sourceairport, destairport
   from flights
   where sourceairport <> destairport
         and sourceairport < destairport
   group by sourceairport, destairport
   having count(*) > 2;

rem query 4

   select a.airportcode, a.airportname
   from flights f, airports100 a
   where f.sourceairport = a.airportcode
   group by a.airportcode, a.airportname
   having count(*) = 13;

rem query 5
   
select count(distinct f1.sourceairport) as "Airports that reach AHD"
   from flights f1, flights f2
   where f1.destairport = f2.sourceairport
         and f2.destairport = 'AHD'
         and f1.sourceairport <> 'AHD';

rem query 6

select count(*) from(
(select distinct f1.sourceairport
   from flights f1, flights f2
   where f1.destairport = f2.sourceairport
         and f2.destairport = 'AHD'
         and f1.sourceairport <> 'AHD')
union
(select f.sourceairport
   from flights f
   where f.destairport = 'AHD'));  

rem query 7

select distinct a.airline, count(distinct f.sourceairport)
   from airlines a, flights f
   where  a.id = f.airline
   group by a.airline
   having count(distinct f.sourceairport) >= 1;


