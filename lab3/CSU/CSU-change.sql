rem kevinshibata
rem kkhshibat@calpoly.edu

delete from Enrollments
   where ( not(Campus = 20 or TotalEnrollment_AY > 15000) 
   and (not(year >=1951 and year <= 1961)) 
   and (not(Campus = 17 or TotalEnrollment_AY > 2900))
   and (not(campus = 2 or TotalEnrollment_AY < 400));

seleft * from Enrollments;

