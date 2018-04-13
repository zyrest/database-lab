create table test2_01 as
(
(
select sid, name 
from pub.STUDENT
)
minus
(
select s.sid, s.name 
from pub.STUDENT natural join pub.STUDENT_COURSE 
)
)

create table test2_02 as
(
select distinct sid, name
from pub.STUDENT natural join pub.STUDENT_COURSE
where cid in 
(
select cid 
from pub.STUDENT_COURSE 
where sid=200900130417
)
)

create table test2_03 as
(
select s.sid, s.name
from pub.STUDENT s, pub.STUDENT_COURSE sc, pub.COURSE c
where s.SID=sc.sid and sc.CID=c.cid and c.FCID=300002
)

create table test2_04 as
(
select distinct s.sid, s.name
from pub.STUDENT s, pub.STUDENT_COURSE sc
where s.SID=sc.sid
and 300002 in
(
select cid
from pub.STUDENT_COURSE
where sid=s.sid
)
and 300005 in
(
select cid
from pub.STUDENT_COURSE
where sid=s.sid
)
)

create table test2_05 as
(
select sid, name, round(avg(score)) avg_score, sum(score) sum_score
from pub.STUDENT natural join pub.STUDENT_COURSE
where age=20
group by sid, name
)

create table test2_06 as
(
select cid, max(score) max_score
from pub.STUDENT_COURSE
group by cid
)

create table test2_07 as
(
select sid, name
from pub.STUDENT
where name not like '张%' and name not like '李%' and name not like '王%'
)

create table test2_08 as
(
select substr(name, 0, 1) second_name, count(*) p_count
from pub.STUDENT
group by substr(name, 0, 1)
)

create table test2_09 as
(
select sid, name, score
from pub.STUDENT natural join pub.STUDENT_COURSE
where cid=300003
)

create table test2_10 as
(
select sid, name
from pub.STUDENT natural join pub.STUDENT_COURSE
where score<60
group by sid, name, cid
having count(*)>=2
)