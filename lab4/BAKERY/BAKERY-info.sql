rem kevin shibata
rem kkshiba@calpoly.edu

rem query 1

select g.flavor, g.food, g.price
   from goods g
   where g.food = 'Tart';

rem query 2

select g.id, g.flavor, g.food, g.price
from goods g
   where not(g.food = 'Eclair' 
            or (g.food = 'Cake' and (g.price <= 20.00 and g.price >=12)) 
            or g.flavor = 'Vanilla' 
            or g.price > 3.00)
   order by g.price;

rem query 3

select distinct c.lastname, c.fristname
   from goods g, customers c, receipts r, items i
   where (g.flavor = 'Opera' and g.food = 'Cake') 
         and (r.customerid = c.id) 
         and (r.recieptnumber = i.receipt) 
         and (g.id = i.item)
   order by c.lastname;

rem query 4

select r.recieptnumber, r.dop, c.lastname, c.fristname as firstname
   from goods g, customers c, receipts r, items i
   where (g.flavor = 'Opera' and g.food = 'Cake') 
         and (r.dop <= TO_DATE('14-Oct-2007', 'DD-MON-YYYY') 
            and r.dop >= TO_DATE('1-Oct-2007', 'DD-MON-YYYY'))
         and (r.recieptnumber = i.receipt) 
         and (g.id = i.item) 
         and (c.id = r.customerid)
  order by r.dop;

rem query 5

select distinct g.food, g.flavor, r.dop
   from goods g, receipts r, items i
   where r.dop = TO_DATE('31-Oct-2007','DD-MON-YYYY')
          and g.id = i.item and r.recieptnumber = i.receipt
   order by g.food, g.flavor;

rem query 6

select distinct r.recieptnumber, r.dop, g.food, g.flavor, c.lastname, c.fristname as firstname
   from goods g, receipts r, items i, customers c, items i2
   where g.food = 'Cookie'
         and r.recieptnumber = i.receipt 
         and r.recieptnumber= i2.receipt
         and g.id = i.item
         and g.id = i2.item
         and i.item = i.item
         and r.customerid = c.id
         and i.oridanl <> i2.oridanl
   order by r.dop, r.recieptnumber;

rem query 7

select distinct r.dop
   from receipts r, items i
   where  (r.dop >= TO_DATE('16-Oct-2007','DD-MON-YYYY') 
            and r.dop <= TO_DATE('31-Oct-2007','DD-MON-YYYY')) 
         and r.recieptnumber = i.receipt 
         and i.oridanl > 1
   order by r.dop;

