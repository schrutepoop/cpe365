rem kevin shibata
rem kkshibat@ora10g

rem query 1

select distinct camp.county 
   from campuses camp
   order by camp.county;

rem query 2

select distinct camp2.county
   from campuses camp, campuses camp2
   where camp.county = camp2.county
         and camp.id <> camp2.id
   order by camp2.county;

rem query 3

select distinct deg.degrees, deg.year
   from campuses camp, degrees deg
   where camp.campus = 'California State University-East Bay'
        and deg.campus = camp.id
        and (deg.year >= 1997 and deg.year <=2002)
   order by deg.year;

rem query 4

select distinct deg1.year, deg1.degrees
   from campuses camp1, campuses camp2, degrees deg1, degrees deg2
   where camp1.campus = 'San Francisco State University'
         and camp2.campus = 'San Jose State University'
         and camp1.id = deg1.campus
         and camp2.id = deg2.campus
         and deg1.year = deg2.year
         and deg1.degrees < deg2.degrees
   order by deg1.year;

rem query 5

select distinct camp.campus, camp.county, (discenroll.undergraduate + discenroll.graduate) as enrollments
   from campuses camp, degrees deg, disciplines disc, disciplineenrollemnts discenroll
   where (camp.county = 'San Diego'or
            camp.county = 'Los Angeles' or
            camp.county = 'San Bernardino'or
            camp.county = 'Kern')
          and camp.id = deg.campus
          and deg.year = 2004
          and disc.name = 'Mathematics'
          and disc.id = discenroll.discipline
          and discenroll.year = 2004
          and discenroll.campus = camp.id
   order by enrollments;

rem query 6

select distinct camp.campus, (fees2.campusfee - fees1.campusfee) as Difference,
                (fees1.campusfee/fees2.campusfee) as ratio
   from enrollments enrolled, campuses camp, csufees fees1, csufees fees2
   where enrolled.totalenrollment_ay > 20000
         and enrolled.year = 2004
         and enrolled.campus = camp.id
         and fees1.campus = camp.id
         and fees2.campus = camp.id
         and enrolled.campus = fees1.campus
         and enrolled.campus = fees2.campus
         and fees1.year = 1996
         and fees2.year = 2004
   order by ratio desc;

rem query 7

select distinct disc.name, discenroll1.graduate as pomona_grads, discenroll2.graduate as san_luis_grads
   from enrollments enroll, campuses camp1, campuses camp2, DisciplineEnrollemnts discenroll1, 
         DisciplineEnrollemnts discenroll2, disciplines disc
   where enroll.year = 2004
        and camp1.campus = 'California State Polytechnic University-Pomona'
        and camp2.campus = 'California Polytechnic State University-San Luis Obispo'
        and camp1.id = discenroll1.campus
        and camp2.id = discenroll2.campus
        and discenroll1.discipline = disc.id
        and discenroll2.discipline = disc.id
        and discenroll1.graduate < discenroll2.graduate
        and discenroll1.year = 2004
        and discenroll2.year = 2004
   order by disc.name;

rem quear 8

select distinct camp.campus, f1.year, f2.year, f3.year, f1.faculty, f2.faculty, f3.faculty
   from campuses camp, faculty f1, faculty f2, faculty f3
   where    camp.id = f1.campus
        and camp.id = f2.campus
        and camp.id = f3.campus
        and f2.year = f1.year + 1   
        and f3.year = f2.year +1
        and f2.faculty > f1.faculty
        and f3.faculty > f2.faculty
   order by camp.campus;

rem queary 9

select distinct camp.campus, enroll.fte_ay, f.faculty,(enroll.fte_ay / f.faculty) as ratio
   from campuses camp, faculty f, enrollments enroll
   where   f.year = 2004
       and enroll.year = 2004
       and camp.id = enroll.campus
       and camp.id = f.campus
       and enroll.fte_ay < 12000
   order by ratio  asc;

rem queary 10

select distinct camp.campus, disc1.name, discenroll1.graduate, disc2.name, discenroll2.graduate
   from campuses camp, disciplineEnrollemnts discenroll1, 
        disciplineEnrollemnts discenroll2, disciplines disc1, disciplines disc2
   where     discenroll1.year = 2004
         and discenroll2.year = 2004
         and discenroll1.discipline = disc1.id
         and disc1.name = 'Engineering'
         and discenroll2.discipline = disc2.id
         and disc2.name = 'Education'
         and discenroll1.graduate > discenroll2.graduate
         and discenroll1.campus = camp.id
         and discenroll2.campus = camp.id
   order by camp.campus;

