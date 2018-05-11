create table test8_01(dname varchar2(30), avg_ds_score numeric(5, 1), avg_os_score numeric(5, 1))

insert into test8_01(dname)
select distinct dname
from pub.student
where dname is not null

update test8_01 o
set avg_ds_score=(
	select round(avg(max(score)))
	from pub.student natural join pub.student_course
	where dname=o.dname
	and cid=300002
	group by sid
)

update test8_01 o
set avg_os_score=(
	select round(avg(max(score)))
	from pub.student natural join pub.student_course
	where dname=o.dname
	and cid=300005
	group by sid
)



create table test8_02(sid char(12), name varchar2(10), dname varchar2(30), ds_score numeric(5, 1), os_score numeric(5, 1))

insert into test8_02(sid, name, dname)
select sid, name, dname
from pub.STUDENT o
where dname='计算机科学与技术学院'
and exists(
select *
from pub.STUDENT_COURSE i
where i.SID=o.sid
and i.CID=300002
)
and exists(
select *
from pub.STUDENT_COURSE i
where i.SID=o.sid
and i.CID=300005
)

update test8_02 o
set ds_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300002
)

update test8_02 o
set os_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300005
)



create table test8_03(sid char(12), name varchar2(10), dname varchar2(30), ds_score numeric(5, 1), os_score numeric(5, 1))

insert into test8_03(sid, name, dname)
select sid, name, dname
from pub.STUDENT o
where dname='计算机科学与技术学院'
and (
	exists(
		select *
		from pub.STUDENT_COURSE i
		where i.SID=o.sid
		and i.CID=300002
	)
	or exists(
		select *
		from pub.STUDENT_COURSE i
		where i.SID=o.sid
		and i.CID=300005
	)
)

update test8_03 o
set ds_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300002
)

update test8_03 o
set os_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300005
)



create table test8_04(sid char(12), name varchar2(10), dname varchar2(30), ds_score numeric(5, 1), os_score numeric(5, 1))

insert into test8_04(sid, name, dname)
select sid, name, dname
from pub.STUDENT o
where dname='计算机科学与技术学院'

update test8_04 o
set ds_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300002
)

update test8_04 o
set os_score=(
	select max(score)
	from pub.STUDENT_COURSE t
	where t.SID=o.sid
	and t.CID=300005
)
