rem kevin shibata
rem kkshibat@ora10g

set linesize 200
set pagesize 200

rem query 1

select count(*) as "Total number", max(w.price) as "Highest price",
       min(w.price) as "Lowest price", avg(w.price) as "avg price"
   from grapes g, wine w
   where w.grape = g.grape
         and g.color = 'Red'
         and w.score >= 96;

rem query 2

select w.score, max(w.price) as "Highest price", min(w.price) "Cheapest price",
       avg(w.price) as "Avg price", count(w.name) "number wines", 
sum(w.cases) as "Total cases"
   from wine w
   where w.score > 88
   group by w.score
   order by w.score;

rem query 3

select w.year, count(*) as "Number of wines"
   from appelations a, wine w, grapes g
   where a.appelation = w.appelation
         and w.grape = g.grape
         and a.country = 'Santa Barbara'
         and w.score > 90
         and g.color = 'White'
   group by w.year
   order by w.year;

rem query 4

select a.appelation, a.country, count(*) as "Number of wines",
       avg(w.price) as "avg price bottle",
       sum(w.cases * 12) as "total bottles produced"
   from wine w, appelations a
   where w.appelation = a.appelation 
         and w.grape = 'Pinot Noir'
         and year = 2008
   group by a.appelation, a.country
   having count(*) > 2
   order by "Number of wines" desc;

rem query 5

select a.appelation, sum(w.cases * 12 * w.price) as "sales volume"
   from appelations a, wine w
   where a.appelation = w.appelation
         and a.country  = 'Sonoma'
   group by a.appelation
   order by "sales volume" desc;
