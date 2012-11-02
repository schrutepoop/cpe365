rem Kevin Shibata
rem kkshibat@calpoly.edu

create table airlines (
   Id integer PRIMARY KEY,
   Airline varchar2(64) NOT NULL,
   Abbreviation varchar2(64) NOT NULL,
   Country varchar2(64) NOT NULL
);

create table airports100(
   City varchar2(64) NOT NULL,
   Airportcode char(3) PRIMARY KEY,
   AirportName varchar2(64) NOT NULL,
   Country varchar2(64) NOT NULL,
   CountryAbbrev varchar2(64) NOT NULL
);

create table flights (
   Airline integer REFERENCES airlines,
   FlightNo integer NOT NULL,
   SourceAirport char(3) REFERENCES airports100,
   DestAirport char(3) REFERENCES airports100,
   PRIMARY KEY (Airline, FlightNo)
);

