#!/usr/bin/python

import random

f = open("BAKERY-modify.sql", "w")

locations = [
   ('OK', ['Enid','Edmond', 'Oklahoma City']),
   ('TX', ['Dumas', 'Borger', 'Dalhart']),
   ('NM', ['Clayton']),
   ('KS', ['Liberal','Hugoton']),
   ('CO', ['Springfield']),
]


f.write('''rem kevin shibata
rem kkshibat@calpoly.edu

alter table customers
   add (town varchar2(40),
       state char(2)); 
''')
i = 1
for i in range(1,21):
   location = random.choice(locations)
   state = location[0]
   town =  random.choice(location[1])
   f.write(
'''update customers
   set town = "%s",
      state = "%s"
   where Id = %d;
''' % (town, state, i))
