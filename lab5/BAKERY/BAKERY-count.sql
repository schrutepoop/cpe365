rem kevin shibata
rem kkshibat@ora10g

set linesize 1000
set pagesize 100

rem query 1

select count(*) as "Number of diferent purchases"
   from receipts r
   group by r.dop
   having r.dop = '25-Oct-2007';

rem query 2

select flavor, avg(price) as "Average price", count(food) as "Number of different pastries"
   from goods
   group by flavor
   having count(food) > 3
   order by "Average price" asc;

rem query 3

select sum(sum(g.price)) as "Total mount of Money"
   from receipts r, items i, goods g
   where r.recieptnumber = i.receipt
         and i.item = g.id
   group by r.dop
   having r.dop >= '10-Oct-2007' and r.dop <= '15-Oct-2007';

rem query 4

select c.lastname, c.fristname as firstname, sum(g.price) as "Total amount paid"
   from receipts r, items i, goods g, customers c
   where r.recieptnumber = i.receipt
         and r.customerid = c.id
         and i.item = g.id
   group by r.dop, c.lastname, c.fristname
   having r.dop = '31-Oct-2007'
   order by "Total amount paid" desc;

rem query 5

select i.receipt, r.dop, count(i.item), max(g.price), min(g.price)
   from receipts r, items i, goods g, customers c
   where r.recieptnumber = i.receipt
         and r.customerid = c.id
         and i.item = g.id
   group by r.dop, i.receipt, c.lastname, c.fristname
   having c.fristname = 'MELLIE' and c.lastname = 'MCMAHAN'
   order by r.dop;

rem query 6

select count(*) as "Number of chocolate pasteries"
   from goods g
   where g.food <> 'Cake'
   group by g.flavor
   having g.flavor = 'Chocolate';

rem query 7

select sum(count(i.item)) as "Number of Strawberry Cakes"
   from goods g, receipts r, items i
   where r.recieptnumber = i.receipt
         and i.item = g.id
   group by r.dop, g.flavor, g.food
   having r.dop  >= '1-Oct-2007' and r.dop <= '31-Oct-2007'
          and g.flavor = 'Strawberry' and g.food = 'Cake';

rem query 8

select c.lastname, c.fristname, 
       count(distinct r.recieptnumber) as "Total of purchases",
       count(i.item) as "Total individual items",
       sum(g.price)
   from customers c, items i, receipts r, goods g
   where r.recieptnumber = i.receipt
         and r.customerid = c.id
         and i.item = g.id
   group by c.lastname, c.fristname
   order by "Total of purchases" desc;

