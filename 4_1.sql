1.Find the maximum and average capacity of buildings in the university.

SQL> select max(capacity),avg(capacity) from  classroom;

MAX(CAPACITY) AVG(CAPACITY)
------------- -------------
          500         162.5
          
2.Display the least budget of the departments.

SQL> select min(budget) from department;

MIN(BUDGET)
-----------
      50000
      
3.Find the total number of courses and credits offered by Biology department.

SQL> select count(*),sum(credits) from course where dept_name='Biology';

  COUNT(*) SUM(CREDITS)
---------- ------------
         3           11
         
4.Find the average salary of instructors in the Computer Science department.


  1* select avg(salary) from instructor where dept_name='Comp. Sci.'
  2  /

AVG(SALARY)
-----------
 77333.3333
 
5.Find the total number of instructors who teach a course in the Spring 2010 semester.

SQL> select count(*) from teaches where semester='Spring' and year=2010;

  COUNT(*)
----------
         7
         
6.Find the average salary in each department.

SQL> select dept_name,avg(salary) from instructor group by dept_name;

DEPT_NAME            AVG(SALARY)
-------------------- -----------
Elec. Eng.                 80000
Physics                    91000
Comp. Sci.            77333.3333
Finance                    85000
Biology                    72000
Music                      40000
History                    61000

7 rows selected.

7.Find the number of instructors in each department who teach a course in the Spring 2010 semester.

select dept_name,count(teaches.id) from instructor,teaches where instructor.id=teaches.id and semester='Spring' and year=2010 group by dept_name;

SQL> /

DEPT_NAME            COUNT(TEACHES.ID)
-------------------- -----------------
Comp. Sci.                           4
Finance                              1
History                              1
Music                                1


8.Find the department name and average salary of the department for only those departments where the average salary of the instructors is more than $42,000.

SQL> select dept_name,avg(salary) from instructor group by dept_name having avg(salary)>42000;

DEPT_NAME            AVG(SALARY)
-------------------- -----------
Elec. Eng.                 80000
Physics                    91000
Comp. Sci.            77333.3333
Finance                    85000
Biology                    72000
History                    61000

6 rows selected.

9.For each course section offered in 2009, find the average total credits (tot_cred) of all students enrolled in the section, if the section had at least 2 students.

SQL> select t.sec_id,avg(credits) from course c,takes t,section s where t.sec_id=s.sec_id and s.course_id=c.course_id group by t.sec_id having count(distinct t.id)>2;

SEC_ID   AVG(CREDITS)
-------- ------------
1               3.375
2                 3.5

10.For each department, find the maximum salary of instructors in that department. You may assume that every department has at least one instructor.

SQL> select dept_name,max(salary) from instructor group by dept_name;

DEPT_NAME            MAX(SALARY)
-------------------- -----------
Elec. Eng.                 80000
Physics                    95000
Comp. Sci.                 92000
Finance                    90000
Biology                    72000
Music                      40000
History                    62000

7 rows selected.

11.For the student with ID 12345 (or any other value), show the total number 
of credits scored for all courses (taken by that student). Don't display the 
tot_creds value from the student table, you should use SQL aggregation on courses taken by the student.

SQL> select sum(credits) from takes t,course c where id='12345' and t.course_id=c.course_id;

SUM(CREDITS)
------------
          14

          
12.Display the total credits for each of the students, along with the ID of the student; don't bother about the name of the student. (Don't display the 
tot_creds value from the student table, you should use SQL aggregation on courses taken by the student. For students who have not registered for any 
course, tot_creds should be 0)

SQL>  select id,sum(credits) from takes t,course c where t.course_id=c.course_id group by id;

ID    SUM(CREDITS)
----- ------------
00128            7
12345           14
19991            3
23121            3
44553            4
45678           11
54321            8
55739            3
76543            7
76653            3
98765            7

ID    SUM(CREDITS)
----- ------------
98988            8

12 rows selected.
