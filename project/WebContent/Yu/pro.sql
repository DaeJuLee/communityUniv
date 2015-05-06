create table member (
	snum number(10) primary key,
	id varchar2(10) not null,
	pass varchar2(14) not null,
	grade number(4) not null,
	writer varchar2(10) not null,
	email varchar2(40) not null
);
drop table member;
drop table board;	
create table board (
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
--자유게시판▼--
create table board (
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
select * from member;
select * from board;
--족보게시판▼--
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
--장터 게시판 ▼--
create table maBoard (
	bnum number primary key,
	title varchar2(50) ,
	s_date date not null,
	writer varchar2(20) ,
	content varchar2(500) ,
	hits number(5) default 0,
	bpass varchar2(14) not null,
	fileName varchar2(120) ,
	fileSize number ,
	re2_step number ,
	re2_level number ,
	ip varchar2(20) ,
	ref number ,
	category varchar2(20) 
);
--자유게시판 댓글 ▼--
create table fReplyComment(
	reply_code number primary key,
	bnum number,
	re_step number,
	re_level number,
	content varchar2(255),
	r_date date not null
);
--족보게시판 댓글 ▼--
create table tReplyComment(
	reply_code number primary key,
	bnum number,
	re_step number,
	re_level number,
	content varchar2(255),
	r_date date not null
);
--장터게시판 댓글 ▼--
create table mReplyComment(
	reply_code number primary key,
	bnum number,
	re_step number,
	re_level number,
	content varchar2(255),
	r_date date not null
);