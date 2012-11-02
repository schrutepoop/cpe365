rem kevin shibata
rem kkshibat@ora10g

set linesize 1000
set pagesize 100

rem query 1

select avg(edispl) as Average, min(edispl) as smallest, max(edispl) as Largest
   from cardata 
   where cylinders = 6 
         and accelerate < 15  
         and year >= 1970 
         and year <=1979;

rem query 2

select cm.maker, max(cd.mpg) as "Best MPG"
   from countries country, cardata cd, modellist ml, carname cn, carmakers cm
   where country.countryid = cm.country
         and ml.maker = cm.id
         and cn.model = ml.model
         and cd.id = cn.makeid
         and cd.mpg is not NULL
   group by country.countryname, cm.maker
   having country.countryname = 'france'
   order by "Best MPG";

rem query 3

select min(cd.weight) as "Weight of the smallest car"
      from countries country, cardata cd, 
           modellist ml, carname cn, carmakers cm, continents cont
   where country.countryid = cm.country
         and ml.maker = cm.id
         and cn.model = ml.model
         and cd.id = cn.makeid
         and country.continent = cont.contid
   group by cont.continent
   having cont.continent = 'europe';

rem query 4

select cm.maker, count(*) as "Number of cars"
   from countries country, cardata cd, 
        modellist ml, carname cn, carmakers cm
   where country.countryid = cm.country
         and ml.maker = cm.id
         and cn.model = ml.model
         and cd.id = cn.makeid
         and cd.cylinders <> 4
         and cd.accelerate < 14
         and country.countryname = 'usa'
   group by  cm.maker 
   order by "Number of cars" desc;

rem query 5

select  sum(cd.weight) as "Weight of the pile"
   from countries country, cardata cd,
        modellist ml, carname cn, carmakers cm
   where country.countryid = cm.country
         and ml.maker = cm.id
         and cn.model = ml.model
         and cd.id = cn.makeid
         and country.countryname <> 'usa' 
         and cd.year >= 1971 
         and cd.year <=1977;

rem query 6

select cd.year, max(cd.mpg) as "Max MPG", 
       min(cd.mpg) as "Min MPG", 
       avg(cd.mpg) as "Avg MPG"
   from cardata cd, carname cn, modellist ml, carmakers cm
   where cd.id = cn.makeid and cn.model = ml.model and ml.maker = cm.id
   group by cd.year, cm.maker
   having cm.maker = 'toyota' and count(ml.model) > 2
   order by cd.year asc;
