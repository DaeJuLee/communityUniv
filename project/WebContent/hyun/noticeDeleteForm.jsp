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
	String bnum = request.getParameter("bnum");

%>
<form action="noticeDeletePro.jsp?bnum=<%=bnum%>">
	<input type = "hidden" name = "bnum" value="<%=bnum %>">
	공지를 삭제하시겠습니까?<p>
	<input type = "submit" value = "확인">
	
</form>
</body>
</html>