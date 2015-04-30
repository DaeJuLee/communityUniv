<%@page import="pro.Member"%>
<%@page import="pro.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	Member member = new Member();
	for(int i = 1; i < 153; i++){
		member.setSnum(i);
		member.setName("유지인"+i);
		member.setId("you"+i);
		member.setPass("you"+i);
		member.setWriter("you"+i);
		member.setPost1(i);
		member.setPost2(i);
		member.setAddr("서울특별시 중구");
		member.setJibeon("123-"+i);
		member.setEmail("you"+i+"@g.g");
		member.setMajor("경제학과");
		md.insert(member);
	}
%>
입력성공
</body>
</html>