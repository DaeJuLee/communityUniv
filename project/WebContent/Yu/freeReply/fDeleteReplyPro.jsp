<%@page import="project.BoardReplyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		BoardDao bd = BoardDao.getInstance();
		int result = bd.deleteReply(bnum, re_step);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("댓글삭제  성공");
		location.href = "homeMainPage.jsp?pgm=../Yu/free/fContent.jsp?bnum=" + <%=bnum%> + "&pageNum="+ <%=pageNum%>;
		histroy.back();
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("댓글삭제 실패");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>