rem kevin shibata
rem kkshibat@ora10g

set linesize 400
set pagesize 200

rem query 1

select count(*) as "Stays over 4 nights",
       avg(res.checkout - res.checkin) as "Avg stay"
   from rooms r, reservations res
   where r.roomid = res.room
         and res.adults = 1
         and res.kids = 1
         and r.roomname = 'Harbinger but bequest'
         and res.checkout > (res.checkin + 4);

rem query 2

select r.roomname, 
       sum((res.checkout - res.checkin) * res.rate) as "Total revenu",
       avg((res.checkout - res.checkin) * res.rate) as "AVG revenu"
   from rooms r, reservations res
   where r.roomid = res.room
         and ( to_char(res.checkin,'MON') = 'JUL' or
              to_char(res.checkin,'MON') = 'JUN' or
              to_char(res.checkin,'MON') = 'AUG')
   group by r.roomname
   order by "Total revenu" desc;

rem query 3

select count(*) as "Total Sunday reservations"
   from rooms r, reservations res
   where r.roomid = res.room
         and to_char(res.checkin, 'DY') = 'SUN'
   order by "Total Sunday reservations";

rem query 4

select res.lastename, res.firstname, sum(res.checkout - res.checkin)
   from reservations res
   group by res.lastename, res.firstname
   having count(*) >= 3
   order by res.lastename;

rem query 5

select count(*) as "Number of one nighters"
   from rooms r, reservations res
   where r.roomid = res.room
         and r.maxoccupancy = 2
         and res.adults = 2
         and res.kids = 0
         and (res.checkout - res.checkin) = 1;

rem query 6

select r.roomname, abs(max(res.rate - r.baseprice)) as "markup price",
       abs(max((res.rate / r.baseprice)-1)) as "markup percent",
       abs(min(res.rate - r.baseprice)) as "markdown price",
       abs(min((res.rate / r.baseprice) -1)) as "markdown percent"
   from rooms r, reservations res
   where r.roomid = res.room
   group by r.roomname
   order by "markup price" desc;
   

rem query 7

select r.roomname, max((res.checkout - res.checkin) * res.rate) as "max rev",
          sum(res.checkout - res.checkin) as "Number of days",
          min((res.checkout - res.checkin) * res.rate) as "min rev"
   from rooms r, reservations res
   where res.room = r.roomid
   group by r.roomname
   order by "Number of days" desc;
