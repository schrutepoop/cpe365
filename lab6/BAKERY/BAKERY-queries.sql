rem kevin shibata
rem kkshibat@calpoly.edu

set linesize 1000
set pagesize 50

rem query 1

(select lastname, fristname
   from customers)
minus
(select lastname, fristname
   from (select id
        from goods
        where (food = 'Meringue' and
              flavor = 'Chocolate') or
              food = 'Danish') g,
         items i, receipts r, customers c
   where i.item = g.id and
         i.receipt = r.recieptnumber and 
         c.id = r.customerid)
order by lastname;
         
rem query 2

select c.lastname, c.fristname, c.count, ccc.sum
   from (select lastname, fristname, count(*) as count
         from customers, receipts
         where id = customerid
         group by lastname, fristname) c,
        (select avg(count(*)) as avg 
         from customers, receipts
         where id = customerid
         group by lastname, fristname) cc,
        (select lastname, fristname, sum(g.price) as sum 
         from customers c, goods g, receipts r, items i
         where c.id = r.customerid and 
               i.receipt = r.recieptnumber and
               g.id = i.item
         group by lastname, fristname) ccc     
    where c.count > cc.avg and
          c.lastname = ccc.lastname and
          c.fristname = ccc.fristname
   order by ccc.sum desc;

rem query 3

select c.lastname, c.fristname, c.sum
   from (select lastname, fristname, sum(g.price) as sum    
         from customers c, goods g, receipts r, items i
         where c.id = r.customerid and
               i.receipt = r.recieptnumber and
               g.id = i.item and
               to_char(r.dop,'MON') = 'OCT'
         group by lastname, fristname) c,
        (select max(sum(g.price)) as max
         from customers c, goods g, receipts r, items i
         where c.id = r.customerid and
               i.receipt = r.recieptnumber and
               g.id = i.item and
               to_char(r.dop,'MON') = 'OCT'
         group by lastname, fristname) cc
   where c.sum = cc.max;         
          
rem query 4

select c.food, c.flavor, c.price
   from (select food, flavor, sum(price) as price
         from items, goods 
         where id = item
         group by food, flavor) c,
        (select min(sum(price)) as min
         from items, goods   
         where id = item
         group by food, flavor) cc
   where c.price = cc.min;

rem query 5

select c.food, c.flavor, c.count
   from (select food, flavor, count(*) as count
         from items, goods   
         where id = item
         group by food, flavor) c,
        (select max(count(*)) as max
         from items, goods
         where id = item
         group by food, flavor) cc
   where c.count = cc.max;

rem query 6

select c.dop, c.revenu
   from (select dop, sum(g.price) as revenu
         from goods g, receipts r, items i
         where g.id = i.item and
               r.recieptnumber = i.receipt and
               to_char(r.dop,'MON') = 'OCT'
         group by r.dop) c,
         (select min(sum(g.price)) as min
         from goods g, receipts r, items i
         where g.id = i.item and
               r.recieptnumber = i.receipt and
               to_char(r.dop,'MON') = 'OCT'
         group by r.dop) cc
   where cc.min = c.revenu;

rem query 7

select ccc.lastname, ccc.fristname, 
       count(distinct r5.recieptnumber) as pruchases, sum(g5.price) as sum
   from  (select cc.lastname, cc.fristname 
          from (select c4.lastname, c4.fristname
          from customers c4) cc
          minus   
          (select c1.lastname, c1.fristname
         from customers c1, goods g1, receipts r1, items i1
         where c1.id = r1.customerid and
               g1.id = i1.item and
               i1.receipt = r1.recieptnumber and
               r1.dop = (select r2.dop  
                  from goods g2, receipts r2, items i2
                  where g2.id = i2.item and
                        r2.recieptnumber = i2.receipt
                  group by r2.dop
                  having sum(g2.price) = (select max(sum(g3.price))
                                          from goods g3, receipts r3, items i3
                                          where g3.id = i3.item and
                                                r3.recieptnumber = i3.receipt
                                          group by r3.dop)))) ccc, customers c5, goods g5, receipts r5, items i5
   where ccc.lastname = c5.lastname and
         ccc.fristname = c5.fristname and
         c5.id = r5.customerid and
         g5.id = i5.item and
         i5.receipt = r5.recieptnumber
   group by ccc.lastname, ccc.fristname
   order by sum;

rem query 8

 
