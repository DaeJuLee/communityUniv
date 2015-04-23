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
 --QnA ���̺�

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
	--counsel ���λ�� ���̺�
 
create sequence cboard_seq;
select * from cboard;

drop table qboard;
drop table cboard;

-- replayComment ���̺� �߰�
-- column ip�� �߰��� ��ȹ��.
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

select * from (select rownum rn ,a.* from (select * from replyComment where bnum = 3 order by re_step) a );
select * from (select rownum rn ,a.* from (select * from replyComment order by re_step desc) a ) where bnum = 3;