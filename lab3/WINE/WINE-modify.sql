rem kevin shibata
rem kkshibat@calpoly.edu

alter table wine
   add (bestfrom integer,
      bestto integer);

rem doing white wines first  
update wine
   set bestfrom = Year + 2,
       besto = Year + 5
   where (Grape = 'Chardonnay' or Grape = 'Marsanne' or Grape = 'Muscat' or
Grape = 'Riesling' or Grape = 'Roussanne' or Grape = 'Sauvignon Blanc' or Grape
= 'Viognier');

rem one of the white reds
update wine 
   set bestfrom = Year + 5,
       besto = Year + 14
   where Grape = 'Cabernet Sauvingnon';

rem the rest of the red wines
update wine 
   set bestfrom = Year + 3,
       besto = Year + 10
   where (Grape = 'Barbera' or Grape = 'Cabernet Frank' or Grape = 'Grenache' or
         Grape = 'Malbec' or Grape = 'Merlot' or Grape = 'Mourvedre' or Grape =
         'Petite Sirah' or Grape = 'Pinot Noir' or Grape = 'Sangiovese' or Grape
         = 'Syrah' or Grape = 'Tempranillo' or Grape = 'Zinfandel');

rem where the scores are the score is 88 points or below
update wine
   set bestfrom = Year + 1,
       besto = Year + 2
   where Score <= 88;

