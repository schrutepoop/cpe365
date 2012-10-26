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

rem query 8

select w.name, w.year, (w.cases * w.price) as Revenu
   from wine w
   where     w.winery = 'Kosta Browne'
         and w.grape = 'Pinot Noir'
         and w.price is not NULL
         and w.name is not null
         and w.cases is not null
   order by revenu;

rem query 9

select w1.grape, w1.winery, w1.score, (w1.cases * w1.price) as revenu
   from wine w1, wine w2, appelations a1
   where     a1.country = 'Napa'
         and a1.appelation = w1.appelation
         and w1.year = 2006
         and w2.year = 2006
         and w2.winery = 'Rosenblum'
         and w2.appelation = 'Paso Robles'
         and (w1.cases * w1.price) > (w2.cases * w2.price)
   order by revenu;

rem query 10

select distinct w2.name
   from wine w1, wine w2 
   where     w1.year = w2.year
         and w1.winery = 'Tor'
         and w1.grape = 'Chardonnay'
         and w2.score > w1.score
         and w2.cases > w1.cases
   order by w2.name;
