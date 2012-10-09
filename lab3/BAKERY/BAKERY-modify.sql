rem kevin shibata
rem kkshibat@calpoly.edu

alter table costomers
   add (town varchar2(40),
       state char(2)); 
update costomers
   set town = "is",
      state = "CO"
   where Id = 0;
update costomers
   set town = "omg",
      state = "KS"
   where Id = 1;
update costomers
   set town = "stanley",
      state = "KS"
   where Id = 2;
update costomers
   set town = "is",
      state = "CO"
   where Id = 3;
update costomers
   set town = "city1",
      state = "TX"
   where Id = 4;
update costomers
   set town = "omg",
      state = "KS"
   where Id = 5;
update costomers
   set town = "starbuck",
      state = "CO"
   where Id = 6;
update costomers
   set town = "city4",
      state = "OK"
   where Id = 7;
update costomers
   set town = "starbuck",
      state = "CO"
   where Id = 8;
update costomers
   set town = "cit5",
      state = "OK"
   where Id = 9;
update costomers
   set town = "over",
      state = "CO"
   where Id = 10;
update costomers
   set town = "what",
      state = "NM"
   where Id = 11;
update costomers
   set town = "is",
      state = "CO"
   where Id = 12;
update costomers
   set town = "starbuck",
      state = "CO"
   where Id = 13;
update costomers
   set town = "yeahhh",
      state = "NM"
   where Id = 14;
update costomers
   set town = "cit5",
      state = "OK"
   where Id = 15;
update costomers
   set town = "is",
      state = "CO"
   where Id = 16;
update costomers
   set town = "city2",
      state = "TX"
   where Id = 17;
update costomers
   set town = "stanley",
      state = "KS"
   where Id = 18;
update costomers
   set town = "wtf",
      state = "KS"
   where Id = 19;
