<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String contextPath = request.getContextPath();
%>
<body>
	<ul>
		<li><a href="homeMainPage.jsp?pgm=../hyun/noticeList.jsp">공지사항</a></li>
		<li><a href="homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp">족보공유</a></li>
		<li><a href="homeMainPage.jsp?pgm=../Yu/free/freeList.jsp">자유게시판</a></li>
		<li><a href="homeMainPage.jsp?pgm=../jinju/Counsel/counselList.jsp">고민상담</a></li>
		<li><a href="homeMainPage.jsp?pgm=../Yu/market/maList.jsp">장 터</a></li>
		<li><a href="homeMainPage.jsp?pgm=../timeTable/timetablehome.jsp">시간표제작</a></li>
		<li><a href="homeMainPage.jsp?pgm=../jinju/QnA/QnAList.jsp">Q&A</a></li>
		<li><a href="homeMainPage.jsp?pgm=../hyun/memberInfo.jsp">myPage</a></li>
	</ul>
</body>
</html>