rem kevin shibata
rem kkshibat@calpoly.edu

rem query 1

select cm.fullname
   from countries c, carmakers cm
   where c.countryname = 'japan'
         and c.countryid = cm.country
   order by cm.fullname;

rem query 2

select distinct ml.model
   from carmakers cm, modellist ml
   where cm.maker = 'gm'
         and cm.id = ml.maker
   order by ml.model;

rem query 3

select distinct cn.makedescription, cd.year
   from carname cn, modellist ml, cardata cd
   where cn.model = 'cadillac'
         and ml.model = 'cadillac'
         and cn.makeid = cd.id
   order by cd.year;

rem query 4

select distinct cn.makedescription, cd.year
   from carmakers cm, cardata cd, carname cn, modellist ml
   where cm.fullname = 'Renault'
         and cm.id = ml.maker
         and cn.makeid = cd.id
         and (cd.year >= 1971 and cd.year <=1977)
         and ml.model = cn.model
   order by cd.year;

rem query 5

select distinct cm.fullname, cm.maker
   from carmakers cm, cardata cd, carname cn, modellist ml
   where cm.id = ml.maker
         and cn.makeid = cd.id
         and ml.model = cn.model
         and cd.year = 1971
         and cd.horsepower > 115
         and cd.edispl > 300
   order by cm.fullname;

rem query 6 

select distinct cn.makedescription, cd.weight, cd.accelerate
   from carmakers cm, cardata cd, carname cn, modellist ml
   where cm.id = ml.maker
         and cn.makeid = cd.id
         and ml.model = cn.model
         and (cd.year < 1990 and cd.year  >1979)
         and cd.cylinders = 6
         and cd.weight < 3000
   order by cd.weight desc;

rem query 7

select distinct cn2.makedescription, cd2.year, cd2.horsepower, cm.maker, country.countryname
   from carmakers cm, cardata cd, carname cn, modellist ml, carname cn2, 
         cardata cd2, countries country
   where cm.id = ml.maker
         and cn.makeid = cd.id
         and ml.model = cn.model
         and cn.makedescription = 'dodge d200'
         and cd.year = 1970
         and cn2.makeid = cd2.id
         and  country.countryid = cm.country
         and cd2.horsepower > cd.horsepower
   order by cd2.horsepower;

rem query 8
   
select distinct cm.fullname, country.countryname
   from carmakers cm, cardata cd, carname cn, modellist ml, countries country, continents cont
   where cont.continent <> 'europe'
         and cont.contid = country.continent
         and country.countryid = cm.country
         and cm.id = ml.maker
         and cn.makeid = cd.id
         and ml.model = cn.model
         and cd.weight < 2000
         and (cd.year <= 1981 and cd.year >= 1979)
   order by cm.fullname;
