1.Display the department names in the lower case but the initial must be in uppercase.

SQL> select initcap(lower(dept_name)) as name from department;

NAME
--------------------
Biology
Comp. Sci.
Elec. Eng.
Finance
History
Music
Physics

7 rows selected.

2.Determine the ‘ename’, ‘job’, ‘sal’ rename the title as Job-sal the output must be Job-Sal as SMITH [CLERK] RS.2000.

SQL> select ename||'['||job||'Rs.'||sal||']' as job_sal from emp;

JOB_SAL
----------------------------------------------------------------
SMITH[CLERKRs.800]
ALLEN[SALESMANRs.1600]
WARD[SALESMANRs.1250]
JONES[MANAGERRs.2975]
MARTIN[SALESMANRs.1250]
BLAKE[MANAGERRs.2850]
CLARK[MANAGERRs.2450]
SCOTT[ANALYSTRs.3000]
KING[PRESIDENTRs.5000]
TURNER[SALESMANRs.1500]
ADAMS[CLERKRs.1100]

JOB_SAL
----------------------------------------------------------------
JAMES[CLERKRs.950]
FORD[ANALYSTRs.3000]
MILLER[CLERKRs.1300]

14 rows selected.

3.For each department, Count the number of times S occurs in department names.

SQL> ed
Wrote file afiedt.buf

  1* select dname,(length(dname)-length(replace(lower(dname),'s'))) from dept
SQL> /

DNAME          (LENGTH(DNAME)-LENGTH(REPLACE(LOWER(DNAME),'S')))
-------------- -------------------------------------------------
ACCOUNTING                                                     0
RESEARCH                                                       1
SALES                                                          2
OPERATIONS                                                     1

4.Write a query to display the department name which does not contain any employees.

SQL> select distinct dname from dept where deptno not in (select deptno from emp);

DNAME
--------------
OPERATIONS
CSE
IT

5.Write a query to display all employee details where employee was joined in year date wise 1980 and 1990 and 2nd week of every month.

SQL> select * from emp where to_char(hiredate,'YYYY') between 1980 and 1990 and to_char(hiredate,'w')=2;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

6.Write an SQL statement to convert the current date to new date picture ex: MONDAY 10th June 2005 10:30.00 PM.

SQL> ed
Wrote file afiedt.buf

  1* select to_char(sysdate,'DAY DDth MONTH YYYY:HH:MI:SS Am') as Current_Time from dual
SQL> /

CURRENT_TIME
-----------------------------------------
FRIDAY    02ND SEPTEMBER 2022:08:20:02 Pm

7.Write a query to display all employee details who joined last Wednesday of a month and experience should be greater than 20 months.

select * from emp where hiredate in(select hiredate from emp where ((sysdate-hiredate)*12>20 and to_char(hiredate,'Day')='Wednesday'));
SQL> /

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20

8.Write a query to calculate the service of employees rounded to years.

SQL> select ename,round((sysdate-hiredate)/365) from emp;

ENAME      ROUND((SYSDATE-HIREDATE)/365)
---------- -----------------------------
SMITH                                 42
ALLEN                                 42
WARD                                  42
JONES                                 41
MARTIN                                41
BLAKE                                 41
CLARK                                 41
SCOTT                                 35
KING                                  41
TURNER                                41
ADAMS                                 35

ENAME      ROUND((SYSDATE-HIREDATE)/365)
---------- -----------------------------
JAMES                                 41
FORD                                  41
MILLER                                41

14 rows selected.

10.Display all employee names, employee number, department names &amp; salary grades for all employees who are working in department 30.

SQL> ed
Wrote file afiedt.buf

  1* select e.ename,e.empno,d.dname,e.sal from emp e,dept d where e.deptno=30 and e.deptno=d.deptno
SQL> /

ENAME           EMPNO DNAME                 SAL
---------- ---------- -------------- ----------
ALLEN            7499 SALES                1600
WARD             7521 SALES                1250
MARTIN           7654 SALES                1250
BLAKE            7698 SALES                2850
TURNER           7844 SALES                1500
JAMES            7900 SALES                 950

6 rows selected.

11.Display the time of day.

SQL> select to_char(sysdate,'hh:mm:ss') from dual;

TO_CHAR(
--------
08:09:03

12.Find all employees who earn a salary greater than the average salary of their departments.

SQL> select ename,sal from emp e,(select deptno,avg(sal) as avg_sal from emp group by deptno) e1 where e.deptno=e1.deptno and e.sal>e1.avg_sal;

ENAME             SAL
---------- ----------
BLAKE            2850
ALLEN            1600
FORD             3000
SCOTT            3000
JONES            2975
KING             5000

6 rows selected.

13.Write a query to find the name of the manager and number of sub-ordinates.

SQL> ed
Wrote file afiedt.buf

  1* select ename,c from emp e,(select mgr,count(mgr) c from emp e1 group by mgr) s where e.empno=s.
SQL> /

ENAME               C
---------- ----------
JONES               2
BLAKE               5
CLARK               1
SCOTT               1
KING                3
FORD                1

6 rows selected.

14.Write a query to find out the manager having Maximum number of sub-ordinates.

SQL> ed
Wrote file afiedt.buf

  1* select ename,c from emp e,(select mgr,count(mgr) c from emp group by mgr having count(mgr)>=all
SQL> /

ENAME               C
---------- ----------
BLAKE               5

                                
15.Write a query to find out the top three earners.

SQL> select ename,empno,sal from emp where rownum<=3 order by sal desc;

ENAME           EMPNO        SAL
---------- ---------- ----------
KING             7839       5000
BLAKE            7698       2850
CLARK            7782       2450
                                

16.Write a query to find out the employees who have joined before their managers.

SQL> select e1.ename from emp e1 full outer join emp e on (e.deptno=e1.deptno) where (e.job='MANAGER
' and e1.hiredate<e.hiredate);

ENAME
----------
SMITH
ALLEN
WARD


17.Write a query to find out the year, where most people join in the company displays the year and No. of Employees.

select count(*),to_char(hiredate,'YYYY') from emp group by to_char(hiredate,'YYYY')
having (count(*))=(select max(count(*)) from emp e group by to_char(hiredate,'YYYY'));

SQL> /

  COUNT(*) TO_C
---------- ----
        10 1981


18.Write a query which will return the DAY of the week.(ie. MONDAY), for any date entered in the format: DD.MM.YY.

select to_char(to_date(&y_of_date,'dd-mm-yyyy'),'Day') from dual;

SQL> /
Enter value for y_of_date: '18-06-2003'
old   1: select to_char(to_date(&y_of_date,'dd-mm-yyyy'),'Day') from dual
new   1: select to_char(to_date('18-06-2003','dd-mm-yyyy'),'Day') from dual

TO_CHAR(T
---------
Wednesday
