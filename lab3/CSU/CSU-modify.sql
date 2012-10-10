rem kevin shibata
rem kkshibat@calpoly.edu

alter table Campuses
   add (region varchar2(25),
       nickname varchar2(20));

update Campuses
   set region = 'Southern California',
   where (county  ),

update Campuses
   set region = 'Central Coast',
   where (county = 'Santa Barbra' or county = 'San Luis Obispo' 
      or county = 'Monterey' or county = 'Santa Cruz'
      or county = 'San Benito');

update Campuses
   set region = 'Central Valley',
   where county

update Campuses
   set region = 'Northern California',
   where

rem adding mascotts to the universites

update Campuses
   set nickname = 'roadrunners',
   where campus 'california State University-Bakersfield';

update Campuses
   set nickname = 'Dolphins',
   where campus 'california State University-Channel Islands';

update Campuses
   set nickname = 'Wildcats',
   where campus 'california State University-Chico';

update Campuses
   set nickname = 'Toros',
   where campus 'california State University-Domingues Hills';

update Campuses
   set nickname = 'Pioneers',
   where campus 'california State University-East Bay';

update Campuses
   set nickname = 'Bulldogs',
   where campus 'Fresno State University';

update Campuses
   set nickname = 'Titans',
   where campus 'california State University-Fullerton';

update Campuses
   set nickname = 'Lumberjacks',
   where campus 'Humboldt State University';

update Campuses
   set nickname = '49ers',
   where campus 'Long Beach State University';

update Campuses
   set nickname = 'Golden Eagles',
   where campus 'california State University-Los Angeles';

update Campuses
   set nickname = 'Keelhaulers',
   where campus 'california Maritime Academy';

update Campuses
   set nickname = 'Otters',
   where campus 'california State University-Montery Bay';

update Campuses
   set nickname = 'Matadors',
   where campus 'california State University-Northridge';

update Campuses
   set nickname = 'Brancos',
   where campus 'california State University-Pomona';

update Campuses
   set nickname = 'Hornets',
   where campus 'california State University-Sacramento';

update Campuses
   set nickname = 'Coyotes',
   where campus 'california State University-San Bernardino';

update Campuses
   set nickname = 'Aztecs',
   where campus 'San Diego State University';

update Campuses
   set nickname = 'Gators',
   where campus 'San Francisco State University';

update Campuses
   set nickname = 'Spartans',
   where campus 'San Jose State University';

update Campuses
   set nickname = 'Mustangs',
   where campus 'California Polytechnic State University-San Luis Obispo';

update Campuses
   set nickname = 'Cougars',
   where campus 'california State University-San Marcos';

update Campuses
   set nickname = 'Seawolves',
   where campus 'Sonoma State University';

update Campuses
   set nickname = 'Warriors',
   where campus 'california State University-Stanislaus';

select *from Campuses;
