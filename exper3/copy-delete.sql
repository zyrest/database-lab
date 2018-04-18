create table test3_01 as
select *
from pub.STUDENT_31
where regexp_like(sid, '^[0-9]*$');

create table test3_02 as
select *
from pub.STUDENT_31
where age=(2012-extract(year from birthday))

create table test3_03 as
select *
from pub.STUDENT_31
where sex='男'
or sex='女'
or sex is null

create table test3_04 as
select *
from pub.STUDENT_31
where dname is not null
and length(dname)>=3
and dname not like '% %'

create table test3_05 as
select *
from pub.STUDENT_31
where regexp_like(class, '^[0-9]*$')

create table test3_06 as
select *
from pub.STUDENT_31
where dname is not null
and lenth(name)>=2
and age=(2012-extract(year from birthday))
and regexp_like(class, '^[0-9]*$')
and regexp_like(sid, '^[0-9]*$')
and length(dname)>=3
and (sex='男' or sex='女' or sex is null)
and name not like '% %' 
and dname not like '% %'

create table test3_07 as
select *
from pub.STUDENT_course_32 o
where exists(
select sid
from pub.STUDENT i
where i.SID=o.sid
)

create table test3_08 as
select *
from pub.STUDENT_course_32 o
where exists(
select sid
from pub.teacher_course i
where i.TID=o.tid
and i.CID=o.cid
)

create table test3_09 as
select *
from pub.STUDENT_course_32 o
where score>=0
and score<=100

create table test3_10 as
select *
from pub.STUDENT_course_32 o
where score>=0
and score<=100
and exists(
select sid
from pub.STUDENT i
where i.SID=o.sid
)
and exists(
select cid
from pub.COURSE c
where c.CID=o.cid
)
and exists(
select tid
from pub.TEACHER t
where t.tid=o.tid
)
and exists(
select sid
from pub.teacher_course tc
where tc.TID=o.tid
and tc.CID=o.cid
)
