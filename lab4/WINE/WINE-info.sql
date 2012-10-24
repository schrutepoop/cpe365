rem kevin shibata
rem kkshibat@calpoly.edu

rem queary 1

select distinct a.appelation
   from appelations a
   where a.country = 'San Luis Obispo'
         and isava = 'Yes'
   order by a.appelation;

rem queary 2

select distinct a.appelation, a.country as county, a.isava
   from appelations a
   where a.area = 'Central Coast'
         and a.country <> 'San Luis Obispo'
   order by county, a.appelation, a.area;

rem queary 3

select distinct a2.appelation, a2.country as county
   from appelations a1, appelations a2
   where a1.appelation = 'Shenandoah Valley'
         and a1.area = a2.area
         and a2.appelation <> 'Livermore Valley'
         and a2.appelation <> a1.appelation
         and a2.isava = 'Yes';
      
rem query 4

select distinct g.grape
   from grapes g, wine w
   where     w.year = 2009
         and w.grape = g.grape
         and g.color = 'Red'
   order by g.grape;

rem query 5

select distinct a.appelation, a.country as county
   from  appelations a, wine w
   where     a.country = 'Sonoma'
         and w.grape = 'Grenache'
         and a.appelation = w.appelation
   order by a.appelation;

rem query 6

select distinct w.year
   from appelations a, wine w
   where     a.country = 'Napa'
         and a.appelation = w.appelation
         and w.grape = 'Chardonnay'
         and w.score > 94
   order by w.year;

rem query 7
select w.winery, w.name, w.year, w.score, w.price
   from wine w 
   where w.grape = 'Pinot Noir'
         and w.score > 94
   order by w.cases;
