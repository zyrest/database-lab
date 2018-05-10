create or replace view test6_01 as
select sid, name, dname
from pub.STUDENT
where age<20
and dname='物理学院'
order by sid

create or replace view test6_02 as
select sid, name, sum(score) sum_score
from pub.STUDENT natural join pub.STUDENT_COURSE
where class=2009
and dname='软件学院'
group by sid, name

create or replace view test6_03 as
select s.sid, s.name, sc.score
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.class=2010
and s.dname='计算机科学与技术学院'
and c.NAME='操作系统'

create or replace view test6_04 as
select s.sid, s.name
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and c.NAME='数据库系统'
and sc.SCORE>90

create or replace view test6_05 as
select s.SID, c.CID, c.NAME, sc.SCORE
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.NAME='李龙'

create or replace view test6_06 as
select sid, name
from pub.STUDENT o
where not exists
(
(
select cid
from pub.COURSE
)
minus
(
select c.CID
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.sid=o.sid
)
)

create or replace view test6_07 as
select sid, name
from pub.STUDENT o
where not exists
(
(
select cid
from pub.COURSE
)
minus
(
select c.CID
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and s.sid=o.sid
and sc.score>=60
)
)

create or replace view test6_08 as
select cid, name
from pub.COURSE o
where exists
(
select * 
from pub.COURSE i
where i.CID=o.fcid
and i.CREDIT=2
)

create or replace view test6_09 as
select s.SID, s.NAME, sum(c.credit) sum_credit
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid
and sc.CID=c.cid
and sc.SCORE>=60
and s.CLASS=2010
and s.DNAME='化学与化工学院'
group by s.SID, s.NAME

create or replace view test6_10 as
select cid, name
from pub.COURSE o
where exists
(
select * 
from pub.COURSE i
where i.CID=o.fcid
and exists
(
select *
from pub.COURSE ii
where ii.CID=i.fcid
)
)