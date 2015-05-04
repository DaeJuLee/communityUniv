<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 삭제</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

</head>
<body>

	<div class="columnMain">
		<h2>고민상담 글 삭제</h2>
			<span>삭제하려면 비밀번호를 입력하세요</span>
			<br>
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
		%>
	
		<div class="contents">	
			<form action="homeMainPage.jsp">
				글 번호 : <%=bnum %><p>
				<input type="hidden" name = "pgm" value = "../jinju/Counsel/counselDeletePro.jsp">
				<input type="hidden" name="bnum" value="<%=bnum%>"> 
				암호 : <input type="text" name="bpass">
				<input type="submit" value="확인" class="btnTy3">
			</form>
		</div>
	</div>

</body>
</html>