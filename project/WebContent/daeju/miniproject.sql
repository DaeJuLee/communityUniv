create table qboard(
	bnum number,
	writer varchar2(50), 
	title varchar2(255), 
	s_date date,
	content varchar2(255),
	hits number default 0,
	bpass varchar2(255),
	fileName varchar2(255),
	fileSize number,
	re_step number,
	re_level number,
	ref number,
	ip varchar2(255)
);
 --QnA 테이블

create sequence qboard_seq;
select * from qboard;
select * from cboard;

create table cboard(
	bnum number,
	writer varchar2(50), 
	title varchar2(255),
	s_date date,
	content varchar2(255),
	content2 varchar2(255),
	hits number default 0,
	bpass varchar2(255),
	fileName varchar2(255),
	fileSize number,
	re_step number,
	re_level number,
	re2_step number,
	re2_level number,
	ref number,
	ip varchar2(255),
	category varchar2(255)
);
	--counsel 고민상담 테이블
 
create sequence cboard_seq;
select * from cboard;

drop table qboard;
drop table cboard;

-- replayComment 테이블 추가
-- column ip를 추가할 계획임.
create table replyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
r_date varchar2(255)
);

select * from REPLYCOMMENT;

drop table replycomment;

delete from REPLYCOMMENT where reply_code = 300;