<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 삭제</title>

<link rel="stylesheet" type="text/css" href="../css/common.css">

</head>
<body>

	<div class="columnMain">
		<h2>QnA 글 삭제</h2>
		<span><p>삭제하려면 암호를 입력하세요<p></p></span>
		<br>
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
		%>
		<div class="contents">	
			<form action="QnADeletePro.jsp">
				
				글 번호 : <%=bnum %> <input type="hidden" name="bnum" value="<%=bnum%>"><p>
				암호 : <input type="password" name="bpass"><p>
				<input type="submit" value="확인">
			</form>
		</div>
	</div>

</body>
</html>