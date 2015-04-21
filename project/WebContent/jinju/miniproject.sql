create table qboard(
	bnum number,
	writer varchar2(50), 
	title varchar2(255), 
	s_date date,
	content varchar2(255),
	hits number,
	bpass varchar2(255),
	fileName varchar2(255),
	fileSize number,
	re_step number,
	re_level number,
	ref number,
	ip varchar2(255)
);
 --QnA ���̺�
 
drop table qboard;
drop table cboard;

create sequence qboard_seq;
select * from qboard;
select * from cboard;

create table cboard(
	bnum number,
	writer varchar2(50), 
	title varchar2(255),
	s_date date,
	content varchar2(255),
	hits number,
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
	//counsel ��λ�� ���̺�
 
create sequence cboard_seq;
select * from cboard;