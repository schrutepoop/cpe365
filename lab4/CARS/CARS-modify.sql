rem kevin shibata
rem kkshibat@calpoly.edu

alter table carData
   add(
      lpk float   
   );
update carData
   set lpk = 235.214 / mpg;

delete from carData
   where year <= 1979 and year >=1977;

select * from cardata;
   
