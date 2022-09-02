SQL> select name,salary,salary+0.01*salary as new_salary from instructor;

NAME                     SALARY NEW_SALARY
-------------------- ---------- ----------
Srinivasan                65000      65650
Wu                        90000      90900
Mozart                    40000      40400
Einstein                  95000      95950
El Said                   60000      60600
Gold                      87000      87870
Katz                      75000      75750
Califieri                 62000      62620
Singh                     80000      80800
Crick                     72000      72720
Brandt                    92000      92920

NAME                     SALARY NEW_SALARY
-------------------- ---------- ----------
Kim                       80000      80800

12 rows selected.
