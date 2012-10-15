rem kevin shibata
rem kkshibata@calpoly.edu

select TO_CHAR(Time, "[[ HH:MI -->SS]]") AS Time, 
       TO_CHAR(Pace, "== MI,SS ==")
   *from marathon
   where state = 'CT';
 
   
