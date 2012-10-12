rem kevin shibata
rem kkshibat@calpoly.edu

alter table costomers
   add (town varchar2(40),
       state char(2)); 
update costomers
   set town = "Borger",
      state = "TX"
   where Id = 1;
update costomers
   set town = "Clayton",
      state = "NM"
   where Id = 2;
update costomers
   set town = "Oklahoma City",
      state = "OK"
   where Id = 3;
update costomers
   set town = "Liberal",
      state = "KS"
   where Id = 4;
update costomers
   set town = "Dumas",
      state = "TX"
   where Id = 5;
update costomers
   set town = "Clayton",
      state = "NM"
   where Id = 6;
update costomers
   set town = "Edmond",
      state = "OK"
   where Id = 7;
update costomers
   set town = "Hugoton",
      state = "KS"
   where Id = 8;
update costomers
   set town = "Liberal",
      state = "KS"
   where Id = 9;
update costomers
   set town = "Springfield",
      state = "CO"
   where Id = 10;
update costomers
   set town = "Liberal",
      state = "KS"
   where Id = 11;
update costomers
   set town = "Clayton",
      state = "NM"
   where Id = 12;
update costomers
   set town = "Dalhart",
      state = "TX"
   where Id = 13;
update costomers
   set town = "Edmond",
      state = "OK"
   where Id = 14;
update costomers
   set town = "Edmond",
      state = "OK"
   where Id = 15;
update costomers
   set town = "Edmond",
      state = "OK"
   where Id = 16;
update costomers
   set town = "Springfield",
      state = "CO"
   where Id = 17;
update costomers
   set town = "Springfield",
      state = "CO"
   where Id = 18;
update costomers
   set town = "Dalhart",
      state = "TX"
   where Id = 19;
update costomers
   set town = "Liberal",
      state = "KS"
   where Id = 20;

select * from costumers;
