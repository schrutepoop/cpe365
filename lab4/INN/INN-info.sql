rem kevin shibata
rem kkshibat@calpoly.edu

rem query 1

select distinct r.roomid, r.roomname, r.maxoccupancy, r.basePrice
   from rooms r
   where r.decor <> 'traditional'
   order by r.baseprice;

rem query 2
  
select distinct res.lastename, res.checkin, res.checkout, (res.adults + res.kids) as number_of_guest, 
                  res.rate
   from rooms r, reservations res 
   where     res.checkin >= TO_DATE('1-Aug-2010','DD-MON-YYYY') 
         and res.checkout <= TO_DATE('31-Aug-2010','DD-MON-YYYY')
         and r.roomname = 'Frugal not apropos'
         and r.roomid = res.room
  order by res.checkin;

rem query 3

select distinct r.roomname, r.beds, res.checkin, res.checkout, (res.adults + res.kids) as number_of_guest
   from rooms r, reservations res
   where     res.checkin <= TO_DATE('21-Jan-2010','DD-MON-YYYY')
         and res.checkout > TO_DATE('21-Jan-2010','DD-MON-YYYY')
         and res.room = r.roomid
   order by r.roomname;

rem query 4

(select distinct r2.roomid, r2.roomname, r2.baseprice
   from rooms r2, reservations res2
   where res2.room = r2.roomid)
minus 
((select distinct r1.roomid, r1.roomname, r1.baseprice
   from rooms r1, reservations res1
   where      res1.checkin <= TO_DATE('20-Sep-2010','DD-MON-YYYY')
         and res1.checkout > TO_DATE('20-Sep-2010','DD-MON-YYYY')
         and res1.room = r1.roomid)
union
(select distinct r.roomid, r.roomname, r.baseprice
   from rooms r, reservations res
   where      res.checkin <= TO_DATE('19-Sep-2010','DD-MON-YYYY')
          and res.checkout > TO_DATE('19-Sep-2010','DD-MON-YYYY')
          and res.room = r.roomid));
rem query 5

(select distinct res1.lastename, res1.firstname
   from reservations res1, reservations res2
   where     res1.lastename = res2.lastename
         and res1.firstname = res2.firstname
         and res1.code <> res2.code)
intersect
(select distinct res.lastename, res.firstname
   from reservations res
   where  res.checkout <= '31-Jul-2010'
         and res.checkin >= '1-Jul-2010');
   
