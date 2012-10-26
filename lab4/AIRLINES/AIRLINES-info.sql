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

(select distinct air.airline as airlinename, air.abbreviation
   from airlines air, flights f1
   where f1.sourceairport = 'NDV'
         and f1.airline = air.id)
intersect
(select distinct a.airline, a.abbreviation
   from airlines a, flights f2
   where f2.destairport = 'CVO'
         and f2.airline = a.id)
   order by airlinename;

rem query 4

select distinct a.airline, a.abbreviation 
   from airlines a, flights f
   where     f.sourceairport = 'NDV'
         and f.destairport = 'CVO'
         and f.airline = a.id
   order by a.airline;

rem query 5

select distinct port1.airportname, port1.airportcode
   from flights f1,airports100 port1
   where     f1.sourceairport = 'NDV'
         and f1.destairport = port1.airportcode
   order by port1.airportcode;

rem queary 6

(select distinct port1.airportname, port1.airportcode as aircode
   from flights f1,airports100 port1
   where     f1.sourceairport <> 'NDV'
         and f1.destairport = port1.airportcode)
minus
(select distinct port1.airportname, port1.airportcode
   from flights f1,airports100 port1
   where     f1.sourceairport = 'NDV'
         and f1.destairport = port1.airportcode)
   order by aircode;

rem query 7

select distinct port1.airportname, port1.airportcode
   from  flights f1, flights f2, airports100 port1
   where     f1.sourceairport = 'NDV'
         and f2.destairport = 'KKI'
         and f1.destairport = f2.sourceairport
         and port1.airportcode = f2.sourceairport
   order by port1.airportcode;

rem query 8

select distinct a.airline, a.id
   from  flights f1, flights f2, airports100 port1, airlines a
   where     f1.sourceairport = 'NDV'
         and f2.destairport = 'KKI'
         and f1.destairport = f2.sourceairport
         and port1.airportcode = f2.sourceairport
         and a.id = f2.airline
   order by a.airline;

select distinct port1.airportname, port2.airportname
   from flights f1, flights f2, airports100 port1, 
        airlines a1, airlines a2, airports100 port2
   where    a1.abbreviation = 'Frontier'
        and a2.abbreviation = 'JetBlue'
        and f1.airline = a1.id
        and f2.airline = a2.id
        and f1.sourceairport = f2.sourceairport
        and f1.destairport = f2.destairport
        and port1.airportcode = f1.sourceairport
        and port2.airportcode = f2.destairport
        and port1.airportname > port2.airportname
   order by port1.airportname;


