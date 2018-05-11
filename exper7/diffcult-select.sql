create table test7_01 as
select substr(name, 2) First_name, count(*) frequency
from pub.STUDENT
group by substr(name, 2)



create table test7_02 as
with letter_tablet as
(
(
select substr(name, 2, 1) sub_name
from pub.STUDENT
)
union all
(
select substr(name, 3, 1) sub_name
from pub.STUDENT
)
)
select sub_name letter, count(*) frequency
from letter_tablet
group by sub_name
having sub_name is not null



create table test7_03(dname varchar2(30), class varchar2(10), P_count1 int, P_count2 int, P_count int)

insert into test7_03(dname, class)
select s.dname, s.class
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
group by s.dname, s.class
having s.dname is not null
and s.class is not null

update test7_03 o
set p_count1=
(
select count(*)
from pub.student i
where i.dname=o.dname
and i.class=o.class
and (
select sum(c.credit)
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.sid=i.sid
and sc.score>=60
)>=10.0
)

update test7_03
set p_count=
(
select count(*)
from pub.student i
where i.dname=o.dname
and i.class=o.class
)

update test7_03
set p_count2=p_count-p_count1



create table test7_04(dname varchar2(30), class varchar2(10), P_count1 int, P_count2 int, P_count int)

insert into test7_04(dname, class)
select s.dname, s.class
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
group by s.dname, s.class
having s.dname is not null
and s.class is not null

update test7_04 o
set p_count1=
(
select count(*)
from pub.student i
where i.dname=o.dname
and i.class=o.class
and (
select sum(c.credit)
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.sid=i.sid
and sc.score>=60
)>=10.0
)
where o.CLASS>2008

update test7_04 o
set p_count1=
(
select count(*)
from pub.student i
where i.dname=o.dname
and i.class=o.class
and (
select sum(c.credit)
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.sid=i.sid
and sc.score>=60
)>=8.0
)
where o.CLASS<=2008

update test7_04 o
set p_count=
(
select count(*)
from pub.student i
where i.dname=o.dname
and i.class=o.class
)

update test7_04 
set p_count2=p_count-p_count1