--회원
create table member (
	snum number(10) primary key,
	name varchar2(20) not null,
	id varchar2(10) not null,
	pass varchar2(14) not null,
	writer varchar2(10) not null,
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
--------------------------------------------------------------------------------
--공지
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
--교수
create table professor (
	pcode varchar2(10) primary key,	
	pname varchar2(10) not null
);
select * from professor;
--------------------------------------------------------------------------------
--과목
create table subject(
	scode varchar2(20) primary key, --scode는 시간 + 요일 + 교수코드 짬뽕
	sname varchar2(20) not null,
	stime varchar2(15) not null,
	sday varchar2(15) not null, --추가  요일 구별
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
--sub들은 과목코드들이 들어갈 항목이다.
select * from timeTable;
--------------------------------------------------------------------------------
--자유게시판 보드 ▼--
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
--title not null로 한거로 하자 아래 테이블 생성
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
--장터
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
--maBoard?



















