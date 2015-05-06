<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 삭제</title>
<!-- <link rel="stylesheet" type="text/css" href="../common.css"> -->
</head>
<body>
<div class = "columnMain">
<h2> 공지 글 삭제</h2>

<span>공지를 삭제하시겠습니까?</span>
<br>
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
	%>
	<div class = "contents">
	<form action="noticeDeletePro.jsp?bnum=<%=bnum%>">
		<input type="hidden" name="bnum" value="<%=bnum%>">
			<input type="submit" value="확인" class = "btnTy3">
	</form>
	</div>
	</div>
</body>
</html>