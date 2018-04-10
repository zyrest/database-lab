CREATE TABLE test1_student (
	sid char(12) NOT NULL, 
	name varchar2(10) NOT NULL, 
	sex char(2), 
	age int, 
	birthday date, 
	dname varchar2(30), 
	class varchar2(10)
);

CREATE TABLE test1_teacher (
	tid char(6) NOT NULL, 
	name varchar2(10) NOT NULL, 
	sex char(2), 
	age int, 
	dname varchar2(30)
);

CREATE TABLE test1_course (
	cid char(6) NOT NULL, 
	name varchar2(40) NOT NULL, 
	fcid char(6), 
	credit number(4,1)
);

CREATE TABLE test1_student_course (
	sid char(12) NOT NULL, 
	cid char(6) NOT NULL, 
	score number(5,1), 
	tid char(6)
);

CREATE TABLE test1_teacher_course (
	tid char(6) NOT NULL, 
	cid char(6) NOT NULL
);

/*
插入每个表相关数据
INSERT INTO table VALUES(xxx, xxx, xxx)
*/
INSERT INTO test1_student VALUES(200800020101, '王欣', '女', 19, to_date('19940202','yyyymmdd'), '计算机学院', '2010');
INSERT INTO test1_student VALUES(200800020102, '李华', '女', 20, to_date('19950303','yyyymmdd'), '软件学院', '2009');
INSERT INTO test1_student VALUES(200800020103, '赵岩', '男', 21, to_date('19960404','yyyymmdd'), '软件学院', '2009');

INSERT INTO test1_teacher VALUES(100101, '张老师', '男', 44, '计算机学院');
INSERT INTO test1_teacher VALUES(100102, '李老师', '女', 45, '软件学院');
INSERT INTO test1_teacher VALUES(100103, '马老师', '男', 46, '计算机学院');

INSERT INTO test1_course VALUES(300001, '数据结构', NULL, 2);
INSERT INTO test1_course VALUES(300002, '数据库', 300001, 2.5);
INSERT INTO test1_course VALUES(300003, '操作系统', 300001, 4);

INSERT INTO test1_student_course VALUES(200800020101, 300001, 91.5, 100101);
INSERT INTO test1_student_course VALUES(200800020101, 300002, 92.6, 100102);
INSERT INTO test1_student_course VALUES(200800020101, 300003, 93.7, 100103);

INSERT INTO test1_teacher_course VALUES(100101, 300001);
INSERT INTO test1_teacher_course VALUES(100102, 300002);
INSERT INTO test1_teacher_course VALUES(100103, 300003);