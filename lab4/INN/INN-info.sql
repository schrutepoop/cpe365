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

rem query 6

select distinct r.roomname, res1.rate, 
      to_number(to_char(res1.checkout,'DD')) 
         - to_number(to_char(res1.checkin, 'DD'))
      as Days_spent,
      (to_number(to_char(res1.checkout,'DD')) 
         - to_number(to_char(res1.checkin, 'DD'))) 
         * res1.rate 
      as Total_money_paid
   from rooms r, reservations res1
   where     res1.checkin = '1-Feb-2010'
         and r.roomid = res1.room
   order by days_spent;

rem query 7

select distinct res2.lastename, res2.firstname
   from reservations res1, reservations res2
   where     res1.LasteName = 'LEDOUX'
         and res1.Firstname = 'LENA'
         and res2.lastename <> res1.lastename
         and res2.firstname <> res1.firstname
         and ((res1.checkin <= res2.checkin and res1.checkout >= res2.checkout)
              or res1.checkin > res2.checkin and res1.checkout < res2.checkout )
   order by res2.lastename;

rem query 8

select distinct res.lastename, res.firstname, r.roomname, 
            (res.adults + res.kids) as total_guests, res.checkin, res.checkout
   from rooms r, reservations res
   where      r.decor = 'rustic'
          and r.roomid = res.room
          and res.checkin <= TO_DATE('31-Oct-2010','DD-MON-YYYY')
          and res.checkout > TO_DATE('31-Oct-2010','DD-MON-YYYY')
   order by res.checkin;

rem query 9

select distinct res.code, r.roomname, res.checkin, res.checkout, res.kids
   from  rooms r, reservations res
   where     r.roomid = res.room
         and (res.checkin >= '1-Apr-2010' and res.checkin <= '30-Apr-2010')
         and (res.checkout >= '1-Apr-2010' and res.checkout <= '30-Apr-2010')
         and res.adults = 2  
         and res.kids = 2
   order by res.checkin;

rem query 10

select distinct r.roomname, res.lastename, res.firstname, 
   to_number(to_char(res.checkout,'DD'))
         - to_number(to_char(res.checkin, 'DD'))
      as Days_spent,
      (to_number(to_char(res.checkout,'DD'))
         - to_number(to_char(res.checkin, 'DD')))
         * res.rate
      as Total_money_paid
   from rooms r, reservations res
   where    (res.checkin = '7-Apr-2010' 
         or res.checkin = '14-Apr-2010'
         or res.checkin = '21-Apr-2010'
         or res.checkin = '28-Apr-2010')
         and r.roomid = res.room
   order by total_money_paid;
