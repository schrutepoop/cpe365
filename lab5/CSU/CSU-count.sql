rem kevin shibata
rem kkshibat@calpoly.edu

set pagesize 50
set lineszie 1000

rem query 1

select min(d.degrees) as "Min amount granted", 
       max(d.degrees) as "Max amount granted",
       avg(d.degrees) as "Avg amount granted"
   from degrees d, campuses c
   where d.campus = c.id
   group by d.year 
   having d.year = 2000;

rem query 2

select count(e1.year) as "Number of years"
   from enrollments e1, campuses c1, enrollments e2, campuses c2
   where e1.campus = c1.id and e2.campus = c2.id
         and e1.year = e2.year
         and e1.totalenrollment_ay > e2.totalenrollment_ay
   group by c1.campus, c2.campus
   having c1.campus = 'California Polytechnic State University-San Luis Obispo'
          and c2.campus = 'Fresno State University';

rem query 3

select min(year) as "The First CSU!"
   from campuses c;

rem query 4

select sum(2012 - min(year)) / count(*) as "Avg of a CSU"
   from campuses
   group by campus;

rem query 5

select sum(fees.campusfee) as "Total", c.campus
   from csufees fees, campuses c
   where c.id = fees.campus
   and fees.year >=2000 and fees.year <= 2005
   group by c.campus
   having avg(fees.campusfee) > 2500
   order by "Total";

rem query 6

select c.campus, min(e.totalenrollment_ay) as min, 
       max(e.totalenrollment_ay) as max,
       avg(e.totalenrollment_ay) as avg
   from campuses c, enrollments e
   where e.campus = c.id
   group by c.campus
   having count(e.year) > 60
   order by avg;

rem query 7

select c.campus, sum(d.degrees) as "sum of degrees"
   from campuses c, degrees d
   where c.id = d.campus
         and d.year >= 1995 and d.year <= 2004
   group by c.campus
   order by "sum of degrees";

rem query 8

select c.campus, count(d.discipline) as "num of disciplines"
   from disciplineEnrollemnts d, disciplines disc, campuses c
   where disc.id = d.discipline
         and c.id = d.campus
         and d.graduate > 0
   group by c.campus
   order by c.campus;

rem query 9

select c.county, count(c.campus) as "num of campuses",
       sum(e.fte_ay) as "total enrollment",
       avg(f.faculty) as "avg faculty enrollment"
   from campuses c, enrollments e, faculty f
   where c.id = e.campus
         and c.id = f.campus
         and f.year = 2004
         and e.year = 2004
   group by c.county
   having count(c.campus) > 1;

rem query 10

select disc.name, count(d.campus) as "Num of campuses that offer"
   from disciplineenrollemnts d, disciplines disc 
   where d.discipline = disc.id
        and d.year = 2004
        and d.graduate > 0
   group by disc.name
   order by "Num of campuses that offer";
   
