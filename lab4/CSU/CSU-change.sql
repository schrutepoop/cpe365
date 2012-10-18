rem kevinshibata
rem kkhshibat@calpoly.edu

delete from Enrollments
  where not( (Campus = 20 and TotalEnrollment_AY > 15000) or
             (Year >= 1959 and Year <= 1961) or
             (Campus <> 17 and TotalEnrollment_AY > 29000) or
             (Campus <> 2  and TotalEnrollment_AY < 400)
           );

select * from Enrollments;

