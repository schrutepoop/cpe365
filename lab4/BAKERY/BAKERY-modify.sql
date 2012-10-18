rem kevin shibata
rem kkshibat@calpoly.edu

alter table customers
   add (town varchar2(40),
       state char(2)); 
update customers
   set town = 'Edmond',
      state = 'OK'
   where Id = 1;
update customers
   set town = 'Dumas',
      state = 'TX'
   where Id = 2;
update customers
   set town = 'Springfield',
      state = 'CO'
   where Id = 3;
update customers
   set town = 'Dumas',
      state = 'TX'
   where Id = 4;
update customers
   set town = 'Springfield',
      state = 'CO'
   where Id = 5;
update customers
   set town = 'Springfield',
      state = 'CO'
   where Id = 6;
update customers
   set town = 'Borger',
      state = 'TX'
   where Id = 7;
update customers
   set town = 'Liberal',
      state = 'KS'
   where Id = 8;
update customers
   set town = 'Liberal',
      state = 'KS'
   where Id = 9;
update customers
   set town = 'Clayton',
      state = 'NM'
   where Id = 10;
update customers
   set town = 'Dalhart',
      state = 'TX'
   where Id = 11;
update customers
   set town = 'Springfield',
      state = 'CO'
   where Id = 12;
update customers
   set town = 'Clayton',
      state = 'NM'
   where Id = 13;
update customers
   set town = 'Clayton',
      state = 'NM'
   where Id = 14;
update customers
   set town = 'Dalhart',
      state = 'TX'
   where Id = 15;
update customers
   set town = 'Clayton',
      state = 'NM'
   where Id = 16;
update customers
   set town = 'Edmond',
      state = 'OK'
   where Id = 17;
update customers
   set town = 'Clayton',
      state = 'NM'
   where Id = 18;
update customers
   set town = 'Liberal',
      state = 'KS'
   where Id = 19;
update customers
   set town = 'Hugoton',
      state = 'KS'
   where Id = 20;
