1.Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 110011

select t.sec_id,avg(credits) from course c,takes t,section s where t.sec_id=s.sec_id and s.course_id=c.course_id group by t.sec_id having count(distinct t.id)>2;

SEC_ID   AVG(CREDITS)
-------- ------------
1               3.375
2                 3.5

2.Find the names of all instructors whose salary is greater than at least one instructor in the Biology department.

select name from instructor where salary>(select salary from instructor where dept_name='Biology');
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

3.Find the departments that have the highest average salary.

SQL> select dept_name from instructor group by dept_name having avg(salary)=(select max(avg(salary) ) from instructor group by dept_name);

DEPT_NAME
--------------------
Physics

4.Find all the courses taught in the both the Fall 2009 and Spring 2010 semesters.

SQL> select distinct course_id from teaches where course_id in (select course_id from teaches where 
semester='Fall' and year=2009) and course_id in (select course_id from teaches where semester='Sprin
g' and year=2010);

COURSE_I
--------
CS-101

5.Find all the courses taught in the Fall 2009 semester but not in the Spring 2010 semester.

select course_id from teaches t1 where (semester,year)=('Fall',2009) and not
exists (select * from teaches t2 where t1.course_id=t2.course_id and (t2.semseter,t2.year)=('Spring',2010)

COURSE_I
--------
CS-347
PHY-101

6.Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester. (Write correlated nested Query).

SQL> (select course_id from teaches where semester='Fall' and year=2010) union (select course_id fro
m teaches where semester='Spring' and year=2010);

COURSE_I
--------
CS-101
CS-315
CS-347
MU-199
CS-319
FIN-201
HIS-351

7.Find all students who have taken all courses offered in the Biology department. (Write Correlated nested Query).



8.Find all courses that were offered at most once in 2009.

SQL> select course_id from teaches where year=2009 group by course_id having count(*)=1;

COURSE_I
--------
EE-181
CS-101
CS-347
BIO-101
PHY-101

9.Find all courses that were offered at least twice in 2009.


10.Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.

SQL> select dept_name,avg(salary) from instructor group by dept_name having avg(salary)>=42000;

DEPT_NAME            AVG(SALARY)
-------------------- -----------
Elec. Eng.                 80000
Physics                    91000
Comp. Sci.            77333.3333
Finance                    85000
Biology                    72000
History                    61000

6 rows selected.

11.Find the departments with the maximum budget.

SQL> select dept_name from department where budget=(select max(budget) from department);

DEPT_NAME
--------------------
Finance

12.Find the names of instructors who have not taught any course.

SQL> select name from instructor where id not in (select t.id from teaches t);

NAME
--------------------
Mozart
Einstein
El Said
Gold
Califieri
Singh
Crick

7 rows selected.

13.Find the IDs and names of all students who have not taken any course offering before Spring 2009.

SQL> select name,id from instructor where id in (select id from teaches where (year=2009 and semeste
r='Fall') or (year=2009));

NAME                 ID
-------------------- -----
Srinivasan           10101
Brandt               83821
Kim                  98345
...
...
...
...
...

8 rows selected.

14.Find the lowest, across all departments, of the per-department maximum salary computed.

SQL> select min(max(salary)) from instructor group by dept_name;

MIN(MAX(SALARY))
----------------
           40000


15.Display the IDs and names of the instructors who have taught all Comp. Sci. courses.

select distinct t.id from teaches t where t.id in (select t1.id from teaches t1 where (t1.course_id like '%CS%') 
group by t1.id having (count(t1.id)>=(select count(course_id from course where dept_name like '%Comp. %')))

SQL> no rows selected.
