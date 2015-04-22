create table member (
	snum number(10) primary key,
	name varchar2(20) not null,
	id varchar2(10) not null,
	pass varchar2(14) not null,
	statement number(4) not null,
	grade number(4) not null,
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

create table univMember (
	uname varchar2(10),
	major number not null,
	unum number not null,
	email varchar2(40) not null
);
	
create table notice (
	bnum number primary key,
	title varchar2(50) not null,
	s_date date not null,
	writer varchar2(20),
	content varchar2(500) not null,
	hits number(5) default 0,
	ref number not null
);

create table professor (
	pcode varchar2(10) primary key,	
	pname varchar2(10) not null,
);

create table subject(
	scode number primary key,
	sname varchar2(20) not null,
	stime varchar2(15) not null,
	pcode varchar2(10) not null,
);

create table timeTable(
	snum number(10),
	scode number,
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

create table board (
	bnum number primary key,
	title varchar2(50) not null,
	s_date date not null,
	writer varchar2(20) ,
	content varchar2(500) not null,
	hits number(5) default 0,
	bpass varchar2(14) ,
	fileName varchar2(100),
	fileSize number,
	re2_step number not null,
	re2_level number not null,
	ip varchar2(20) not null,
	ref number not null,
	category varchar(20)
);

drop table board;
drop table member;
select * from notice;
select * from member;
