1.Find all possible combinations of instructors and the courses they teach.

SQL> select i.name,c.title from instructor i,course c where i.dept_name=c.dept_name;

NAME                 TITLE
-------------------- --------------------------------------------------
Crick                Intro. to Biology
Crick                Genetics
Crick                Computational Biology
Brandt               Intro. to Computer Science
Katz                 Intro. to Computer Science
Srinivasan           Intro. to Computer Science
Brandt               Game Design
Katz                 Game Design
Srinivasan           Game Design
Brandt               Robotics
Katz                 Robotics

NAME                 TITLE
-------------------- --------------------------------------------------
Srinivasan           Robotics
Brandt               Image Processing
Katz                 Image Processing
Srinivasan           Image Processing
Brandt               Database System Concepts
Katz                 Database System Concepts
Srinivasan           Database System Concepts
Kim                  Intro. to Digital Systems
Singh                Investment Banking
Wu                   Investment Banking
Califieri            World History

NAME                 TITLE
-------------------- --------------------------------------------------
El Said              World History
Mozart               Music Video Production
Gold                 Physical Principles
Einstein             Physical Principles

26 rows selected.

2.Retrieve the names of all instructors, along with their department names and department building name.

SQL> select name,instructor.dept_name,building from instructor,department where instructor.dept_name=department.dept_name;

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Srinivasan           Comp. Sci.           Taylor
Wu                   Finance              Painter
Mozart               Music                Packard
Einstein             Physics              Watson
El Said              History              Painter
Gold                 Physics              Watson
Katz                 Comp. Sci.           Taylor
Califieri            History              Painter
Singh                Finance              Painter
Crick                Biology              Watson
Brandt               Comp. Sci.           Taylor

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Kim                  Elec. Eng.           Taylor

12 rows selected.

3.Find the names of instructors who have taught at least one course.

SQL> select distinct name from instructor i,teaches t where i.id=t.id;

NAME
--------------------
Brandt
Kim
Katz

4.For the student with ID 12345 (or any other value), show all course_id and title of all courses registered for by the student.

SQL> select course_id,title from course,student where student.id=12345;

COURSE_I TITLE
-------- --------------------------------------------------
BIO-101  Intro. to Biology
BIO-301  Genetics
BIO-399  Computational Biology
CS-101   Intro. to Computer Science
CS-190   Game Design
CS-315   Robotics
CS-319   Image Processing
CS-347   Database System Concepts
EE-181   Intro. to Digital Systems
FIN-201  Investment Banking
HIS-351  World History

COURSE_I TITLE
-------- --------------------------------------------------
MU-199   Music Video Production
PHY-101  Physical Principles

13 rows selected.

5.Find instructor names and course identifiers for instructors in the Computer Science department.

SQL> select i.name,c.course_id from instructor i,course c where c.dept_name=i.dept_name and c.dept_name='Comp. Sci.';

NAME                 COURSE_I
-------------------- --------
Brandt               CS-101
Katz                 CS-101
Srinivasan           CS-101
Brandt               CS-190
Katz                 CS-190
Srinivasan           CS-190
Brandt               CS-315
Katz                 CS-315
Srinivasan           CS-315
Brandt               CS-319
Katz                 CS-319

NAME                 COURSE_I
-------------------- --------
Srinivasan           CS-319
Brandt               CS-347
Katz                 CS-347
Srinivasan           CS-347

15 rows selected.

6.For all instructors in the university who have taught some course, find their names and the course ID of all courses they taught.

SQL> select i.name,t.course_id from instructor i,teaches t where i.id=t.id;

NAME                 COURSE_I
-------------------- --------
Katz                 CS-101
Katz                 CS-319
Brandt               CS-190
Brandt               CS-190
Brandt               CS-319
Kim                  EE-181

6 rows selected.

7. Find the names of all instructors whose salary is greater than at least one instructor in the Biology department. Or Find the names of all instructors who earn 
more than the lowest paid instructor in the Biology department.

SQL> select i1.name from instructor i1,instructor i2 where i2.dept_name='Biology' and i1.salary>i2.salary;

NAME
--------------------
Wu
Einstein
Gold
Katz
Singh
Brandt
Kim

7 rows selected.

8.Find full details of instructors who teach at least one course.

SQL> select distinct i.* from instructor i,teaches t where i.id=t.id;

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
98345 Kim                  Elec. Eng.                80000
45565 Katz                 Comp. Sci.                75000
83821 Brandt               Comp. Sci.                92000

9.Find the instructor names and the courses they taught for all instructors in the Biology department who have taught some course.


10.Find the set of all courses taught either in Fall 2009 or in Spring 2010, or both.

SQL> select course_id from teaches where (semester,year) in (('Fall',2009),('Spring',2010));
COURSE_I
--------
CS-101
CS-315
CS-347
FIN-201
MU-199
PHY-101
HIS-351
CS-101
CS-319
CS-319

10 rows selected.

11.Find all courses taught in the Fall 2009 semester but not in the Spring 2010 semester.

select distinct course_id from teaches where semester='Fall' and year=2009 and course_id not in (select course_id from teaches where semester='Spring' and year=2010);

COURSE_I
--------
CS-347
PHY-10

12.Find the names of all students who have taken any Comp. Sci. course ever. (there should be no duplicate names)

SQL> select distinct name from student where dept_name='Comp. Sci.';

NAME
--------------------
Zhang
Brown
Shankar
Williams

13.Display the IDs of all instructors who have never taught a course. (Don’t write nested query)


