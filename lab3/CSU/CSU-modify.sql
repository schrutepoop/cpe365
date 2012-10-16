rem kevin shibata
rem kkshibat@calpoly.edu

alter table Campuses
   add (region varchar2(25),
       nickname varchar2(20));

update Campuses
   set region = 'Southern California'
   where (county = 'Ventura' or county = 'Los Angeles' or county = 'Orange'
    or county = 'San Diego' or county = 'Imperial' 
    or county = 'Riverside' or county = 'San Bernardino');

update Campuses
   set region = 'Central Coast'
   where (county = 'Santa Barbra' or county = 'San Luis Obispo' 
      or county = 'Monterey' or county = 'Santa Cruz'
      or county = 'San Benito');

update Campuses
   set region = 'Central Valley'
   where (county = 'Sacramento' or county = 'Kern' or county = 'Inyo' 
      or county = 'Fresno' or county = 'Santa Clara' or county = 'Kings' or county = 'Mariposa'
      or county = 'Mono' or county = 'Stanislaus' or county = 'San Joaquin' 
      or county = 'Solano' or county = 'Alpine');

update Campuses
   set region = 'Northern California'
   where (county = 'Sonoma' or county = 'Napa' or county = 'Yolo' 
      or county = 'El Dorado' or county = 'Butte' or county = 'Humboldt');

update Campuses
   set region = 'Bay Area'
   where (county = 'San Francisco' or county = 'Alameida' 
      or county = 'Contra Costa' or county = 'Marin' or county = 'San Mateo');

rem adding mascotts to the universites

update Campuses
   set nickname = 'roadrunners'
   where campus = 'California State University-Bakersfield';

update Campuses
   set nickname = 'Dolphins'
   where campus = 'California State University-Channel Islands';

update Campuses
   set nickname = 'Wildcats'
   where campus = 'California State University-Chico';

update Campuses
   set nickname = 'Toros'
   where campus = 'California State University-Dominguez Hills';

update Campuses
   set nickname = 'Pioneers'
   where campus = 'California State University-East Bay';

update Campuses
   set nickname = 'Bulldogs'
   where campus = 'Fresno State University';

update Campuses
   set nickname = 'Titans'
   where campus = 'California State University-Fullerton';

update Campuses
   set nickname = 'Lumberjacks'
   where campus = 'Humboldt State University';

update Campuses
   set nickname = '49ers'
   where campus = 'Long Beach State University';

update Campuses
   set nickname = 'Golden Eagles'
   where campus = 'California State University-Los Angeles';

update Campuses
   set nickname = 'Keelhaulers'
   where campus = 'California Maritime Academy';

update Campuses
   set nickname = 'Otters'
   where campus = 'California State University-Monterey Bay';

update Campuses
   set nickname = 'Matadors'
   where campus = 'California State University-Northridge';

update Campuses
   set nickname = 'Brancos'
   where campus = 'California State Polytechnic University-Pomona';

update Campuses
   set nickname = 'Hornets'
   where campus = 'California State University-Sacramento';

update Campuses
   set nickname = 'Coyotes'
   where campus = 'California State University-San Bernardino';

update Campuses
   set nickname = 'Aztecs'
   where campus = 'San Diego State University';

update Campuses
   set nickname = 'Gators'
   where campus = 'San Francisco State University';

update Campuses
   set nickname = 'Spartans'
   where campus = 'San Jose State University';

update Campuses
   set nickname = 'Mustangs'
   where campus = 'California Polytechnic State University-San Luis Obispo';

update Campuses
   set nickname = 'Cougars'
   where campus = 'California State University-San Marcos';

update Campuses
   set nickname = 'Seawolves'
   where campus = 'Sonoma State University';

update Campuses
   set nickname = 'Warriors'
   where campus = 'California State University-Stanislaus';

select * from Campuses;
