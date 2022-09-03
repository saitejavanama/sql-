SQL> ed
Wrote file afiedt.buf

  1* select to_char(sysdate,'hh:mm:ss') as now from dual
SQL> /

NOW
--------
09:09:50

SQL> select to_char(sysdate,'day') from dual;

TO_CHAR(S
---------
saturday

SQL> select to_date(sysdate) from dual;

TO_DATE(S
---------
03-SEP-22
