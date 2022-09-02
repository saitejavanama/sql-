alter table course add primarykey course_id;
alter table student add primarykey student_id;
alter table student add foreignkey course_id references course course_id;
alter table course add unique course_name;
alter table student modify student_name varchar(10) not null;
select id from grade where id>5 and id<10;
alter table course modify department set default 'CSE';
