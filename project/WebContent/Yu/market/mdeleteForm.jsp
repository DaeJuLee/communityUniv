<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장터 삭제</title>
</head>
<body>
	<div class="columnMain">
	<h2>장터 글 삭제</h2>
		<span>삭제하려면 비밀번호를 입력하세요</span>
		<br>
	<%
		String bnum = request.getParameter("bnum");
	%>

		<div class="contents">	
	<form action="homeMainPage.jsp">

			<input type="hidden" name="pgm" value="../Yu/market/mdeletePro.jsp">
					글번호 :	<%=bnum%><p>
			<input type="hidden" name="bnum" value="<%=bnum%>"> 비밀번호 : <input
				type="password" name="bpass"> <input type="submit"
				value="확인" class = "btnTy3">
	</form>
	</div>
	</div>
</body>
</html>