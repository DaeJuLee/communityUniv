create table univmember(
	unum number primary key,
	uname varchar2(40),
	major varchar2(40),
	email varchar2(40)
);
select * from UNIVMEMBER;
--회원정보
create table member (
	snum number(10) primary key,
	name varchar2(20) not null,
	id varchar2(10) not null,
	pass varchar2(14) not null,
	writer varchar2(40) not null,
	post1 number,
	post2 number,
	addr varchar2(250),
	addr2 varchar2(250),
	addr3 varchar2(250) ,
	jibeon varchar2(250),
	email varchar2(40) not null,
	major varchar2(40) not null
);
select * from member;
--drop table member;
--------------------------------------------------------------------------------
--공지사항
create table notice (
	bnum number primary key,
	title varchar2(50) not null,
	s_date date not null,
	writer varchar2(20),
	content varchar2(500) not null,
	hits number(5) default 0,
	ref number not null
);
select * from notice;
--------------------------------------------------------------------------------
--교수 테이블
create table professor (
	pcode varchar2(10) primary key,	
	pname varchar2(10) not null
);
select * from professor;
--------------------------------------------------------------------------------
--과목테이블
create table subject(
	scode varchar2(20) primary key, --scode = 시간 + 요일 +교수코드
	sname varchar2(20) not null,
	stime varchar2(15) not null,
	sday varchar2(15) not null, --추가 요일 구별
	pcode varchar2(10) not null,
	scategory varchar2(2) --전공, 교양
);
select * from subject;
--------------------------------------------------------------------------------
--시간표
create table timeTable(
	snum number(10),
	sub1 varchar2(20),
	sub2 varchar2(20),
	sub3 varchar2(20),
	sub4 varchar2(20),
	sub5 varchar2(20),
	sub6 varchar2(20),
	sub7 varchar2(20),
	sub8 varchar2(20),
	sub9 varchar2(20),
	sub10 varchar2(20)
)
--sub들은 과목코드들이 들어갈 항목
select * from timeTable;
--------------------------------------------------------------------------------
--자유게시판-
create table fboard (
	bnum number primary key,
	title varchar2(50) not null,
	s_date date not null,
	writer varchar2(20) not null,
	content varchar2(500) not null,
	hits number(5) default 0,
	bpass varchar2(14) not null,
	fileName varchar2(100),
	fileSize number,
	re_step number not null,
	re_level number not null,
	ip varchar2(20) not null,
	ref number not null
);
select * from fboard;
--drop table fboard;
--title null로 한거로 하자 아래 테이블 생성
create table fboard (
	bnum number primary key,
	title varchar2(50) ,
	s_date date not null,
	writer varchar2(20) ,
	content varchar2(500) ,
	hits number(5) default 0,
	bpass varchar2(14) ,
	fileName varchar2(100),
	fileSize number,
	re2_step number ,
	re2_level number ,
	ip varchar2(20) ,
	ref number ,
	category varchar(20)
);
--------------------------------------------------------------------------------
--qna
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
select * from QBOARD;
--------------------------------------------------------------------------------
--counsel
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
select * from cboard;
--------------------------------------------------------------------------------
--족보
create table traBoard (
	bnum number primary key,
	title varchar2(50) ,
	s_date date not null,
	writer varchar2(20) ,
	content varchar2(500) ,
	hits number(5) default 0,
	bpass varchar2(14) ,
	fileName varchar2(100),
	fileSize number,
	re2_step number ,
	re2_level number ,
	ip varchar2(20) ,
	ref number ,
	category varchar(20)
);
select * from traBoard;
--------------------------------------------------------------------------------
create table maBoard(
	bnum number, 
	title varchar(40),
	s_date date,
	writer varchar2(20),
	content varchar2(500),
	hits number,
	bpass varchar2(40),
	fileName varchar2(40),
	fileSize number,
	re2_step number,
	re2_level number,
	ip varchar2(40),
	ref number,
	category varchar2(30)
);
select * from maBoard;
--drop table maBoard;
--------------------------------------------------------------------------------
--자유게시판 리플
create table fReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
r_date date not null
);
select * from fReplyComment;
--------------------------------------------------------------------------------
--장터게시판 리플
create table mReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20),
r_date date not null
);
select * from MREPLYCOMMENT;
--drop table mReplycomment;
--------------------------------------------------------------------------------
--족보게시판 리플 5월 6일 수정 writer를 추가
create table tReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20), --추가
r_date date not null
);
select * from tReplyComment;
--drop table tReplyComment;
--------------------------------------------------------------------------------
--counsel게시판 리플
create table cReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
r_date date not null
);
--------------------------------------------------------------------------------
--Q&A게시판 리플
create table qReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
r_date date not null
);