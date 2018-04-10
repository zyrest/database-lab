/*
签到, 只能在实验室环境执行
*/
UPDATE dbsign SET sign=1;

/*
查询签到
*/
SELECT * FROM dbsign;

/*
验证当前 sql 语句, 再点击 commit 提交
*/
UPDATE dbtest SET test=1;

/*
查成绩
*/
SELECT * FROM dbscore;

/*
查班级排行榜
*/
SELECT * FROM dbrank;

/*
删除某张错误的表
*/
DROP TABLE wrong_table;