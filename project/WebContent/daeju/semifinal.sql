create table univmember(
	unum number primary key,
	uname varchar2(40),
	major varchar2(40),
	email varchar2(40)
);
select * from UNIVMEMBER;
--drop table univmember;
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
--drop table member;
--------------------------------------------------------------------------------
--��������
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
--���� ���̺�
create table professor (
	pcode varchar2(10) primary key,	
	pname varchar2(10) not null
);
select * from professor;
--------------------------------------------------------------------------------
--�������̺� ���� ����ֱ� ����
create table subject(
	scode varchar2(20), --scode = �ð� + ���� +�����ڵ�
	sname varchar2(40) not null,
	stime varchar2(15) not null,
	sday varchar2(15) not null, --�߰� ���� ����
	pcode varchar2(10) not null,
	scategory varchar2(2) --����, ����
);
select * from subject;
--drop table subject;
--------------------------------------------------------------------------------
--�ð�ǥ
create table timeTable(
	snum number(10),
	writer varchar2(10),
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
);
--sub���� �����ڵ���� �� �׸�
select * from timeTable;
--drop table timeTable;
--5��7�� �߰�
create table weboutput(
	time number primary key,
	mon varchar2(40),
	thu varchar2(40),
	wed varchar2(40),
	tues varchar2(40),
	fri varchar2(40),
	sat varchar2(40)
);
select * from weboutput;
--drop table weboutput;
insert into weboutput(time) values(1);
insert into weboutput(time) values(2);
insert into weboutput(time) values(3);
insert into weboutput(time) values(4);
insert into weboutput(time) values(5);
insert into weboutput(time) values(6);
insert into weboutput(time) values(7);
insert into weboutput(time) values(8);
insert into weboutput(time) values(9);
insert into weboutput(time) values(10);
insert into weboutput(time) values(11);
insert into weboutput(time) values(12);
--drop table weboutput;
insert into weboutput(mon) values('mon') where time = 1;
--------------------------------------------------------------------------------
--�����Խ���-
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
--title null�� �Ѱŷ� ���� �Ʒ� ���̺� ����
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
	hits number default 0,
	bpass varchar2(255),
	fileName varchar2(255),
	fileSize number,
	re_step number,
	re_level number,
	ref number,
	ip varchar2(255),
	category varchar2(255)
);
select * from cboard;
--------------------------------------------------------------------------------
--����
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
--����
create table maBoard(
bnum number primary key,
title varchar2(20),
s_date date,
writer varchar2(10),
content varchar2(200),
hits number,
bpass varchar2(20),
fileName varchar2(20),
fileSize varchar2(20),
re2_step number,
re2_level number,
ip varchar2(20),
ref number,
category varchar2(20)
);
select * from maBoard;
--------------------------------------------------------------------------------
--�����Խ��� ����
create table fReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20), --�߰�
r_date date not null
);
select * from fReplyComment;
--drop table fReplyComment;
--------------------------------------------------------------------------------
--���ͰԽ��� ����
create table mReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20), --�߰�
r_date date not null
);
select * from mReplyComment;
--drop table mReplyComment;
--------------------------------------------------------------------------------
--�����Խ��� ���� 5�� 6�� ���� writer�� �߰�
create table tReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20), --�߰�
r_date date not null
);
select * from tReplyComment;
--drop table tReplyComment;
--------------------------------------------------------------------------------
--counsel�Խ��� ����
create table cReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20),
r_date date not null
);
select * from CREPLYCOMMENT;
--drop table CREPLYCOMMENT;
--------------------------------------------------------------------------------
--Q&A�Խ��� ����
create table qReplyComment(
reply_code number primary key,
bnum number,
re_step number,
re_level number,
content varchar2(255),
writer varchar2(20),
r_date date not null
);
select * from QREPLYCOMMENT;
--drop table qReplyComment;