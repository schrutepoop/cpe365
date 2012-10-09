#!/usr/bin/python

import random

f = open("BAKERY-modify.sql", "w")

locations = [
   ('OK', ['city4','cit5','shit']),
   ('TX', ['city1', 'city2', 'city3']),
   ('NM', ['cool','yeahhh','what']),
   ('KS', ['stanley','wtf', 'omg']),
   ('CO', ['starbuck','is','over']),
]


f.write('''rem kevin shibata
rem kkshibat@calpoly.edu

alter table costomers
   add (town varchar2(40),
       state char(2)); 
''')

for i in range(20):
   location = random.choice(locations)
   state = location[0]
   town =  random.choice(location[1])
   f.write(
'''update costomers
   set town = "%s",
      state = "%s"
   where Id = %d;
''' % (town, state, i))
