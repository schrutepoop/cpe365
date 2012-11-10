rem kevin shibata
rem kkshibat@calpoly.edu

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

select c.dop, c.revenu
   from (select dop, sum(g.price) as revenu
         from goods g, receipts r, items i
         where g.id = i.item and
               r.recieptnumber = i.receipt
         group by r.dop) c,
         (select max(sum(g.price)) as max
         from goods g, receipts r, items i
         where g.id = i.item and
               r.recieptnumber = i.receipt
         group by r.dop) cc,
        (select 
         from customers c, goods g, receipts r, items i
         where c.id = r.customerid and
               r.recieptnumber = i.receipt and
               i.item = g.id
   where cc.max = c.revenu;
