create table test4_01 as
select * 
from pub.STUDENT_41;

alter table test4_01
add (sum_score number(10, 2));

update test4_01 o
set o.sum_score=
(
select sum(score) sum_score
from pub.STUDENT_COURSE 
where sid=o.sid
);



create table test4_02 as
select * 
from pub.STUDENT_41;

alter table test4_02
add (avg_score number(5, 1));

update test4_02 o
set o.avg_score=
(
select avg(score) avg_score
from pub.STUDENT_COURSE
where sid=o.sid
);



create table test4_03 as
select * 
from pub.STUDENT_41;

alter table test4_03
add (sum_credit number(5, 1));

update test4_03 o
set o.sum_credit=
(
select sum(credit) sum_credit
from pub.STUDENT_COURSE natural join pub.course
where sid=o.sid
and score>=60
);



create table test4_04 as
select * 
from pub.STUDENT_41;

update test4_04 o
set dname=
(
case
when (select did from pub.DEPARTMENT d where d.DNAME=o.dname) is not null then (select did from pub.DEPARTMENT d where d.DNAME=o.dname)
else o.DNAME
end
)


create table test4_05 as
select * 
from pub.STUDENT_41;

alter table test4_05
add sum_score number(10, 0)
add avg_score number(5, 1)
add sum_credit number(5, 0)
add did varchar2(2);

update test4_05 o
set o.sum_score=
(
select sum(score) sum_score
from pub.STUDENT_COURSE 
where sid=o.sid
),
o.avg_score=
(
select round(avg(score), 1) avg_score
from pub.STUDENT_COURSE
where sid=o.sid
),
o.sum_credit=
(
select sum(credit) sum_credit
from pub.STUDENT_COURSE natural join pub.course
where sid=o.sid
and score>=60
),
o.did=
(
case
when (select did from pub.DEPARTMENT c where c.DNAME=o.dname) is not null then to_char((select did from pub.DEPARTMENT c where c.DNAME=o.dname))
when (select did from pub.DEPARTMENT_41 d where d.DNAME=o.dname) is not null then to_char((select did from pub.DEPARTMENT_41 d where d.DNAME=o.dname))
else '00'
end
);



create table test4_06 as
select * from pub.STUDENT_42

update test4_06 o
set o.name=
(
select distinct replace(name, ' ', '')
from test4_06 i
where i.NAME=o.name
)



create table test4_07 as
select * from pub.STUDENT_42

update test4_07 o
set o.sex=
(
select distinct replace(i.sex, ' ', '')
from test4_07 i
where i.sid=o.sid
)

update test4_07 o
set o.sex='女'
where o.SEX='女性'

update test4_07 o
set o.sex='男'
where o.SEX='男性'



create table test4_08 as
select * from pub.STUDENT_42

update test4_08 o
set class=
(
select replace(i.class, '级', '')
from test4_08 i
where i.SID=o.sid
)



create table test4_09 as
select * from pub.STUDENT_42

update test4_09 o
set o.AGE=2012-
(
select to_char(i.birthday, 'yyyy')
from test4_09 i
where i.SID=o.sid
)
where o.AGE is null



create table test4_10 as
select * from pub.STUDENT_42

update test4_10 o
set o.name=
(
select distinct replace(name, ' ', '')
from test4_10 i
where i.sid=o.sid
),
o.dname=
(
select replace(i.dname, ' ', '')
from test4_10 i
where i.sid=o.sid
),
o.sex=
(
select distinct replace(i.sex, ' ', '')
from test4_10 i
where i.sid=o.sid
),
class=
(
select replace(i.class, '级', '')
from test4_10 i
where i.SID=o.sid
)

update test4_10 o
set o.AGE=2012-
(
select to_char(i.birthday, 'yyyy')
from test4_10 i
where i.SID=o.sid
)
where o.AGE is null

update test4_10 o
set o.sex='男'
where o.SEX='男性'

update test4_10 o
set o.sex='女'
where o.SEX='女性'