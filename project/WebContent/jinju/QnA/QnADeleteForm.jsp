<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 삭제</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
	%>
	
	<h2>삭제하려면 암호를 입력하세요</h2>
	<form action="QnADeletePro.jsp">
		<input type="hidden" name="bnum" value="<%=bnum%>"> 
		암호 : <input type="password" name="bpass"><p>
		<input type="submit" value="확인">
	</form>

</body>
</html>