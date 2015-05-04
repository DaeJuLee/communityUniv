<%@page import="miniproject_jj.QnAReplyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="miniproject_jj.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="qrd" class="miniproject_jj.QnAReplyBoard"></jsp:useBean>
	<jsp:setProperty property="*" name="qrd" />
	<%
		//String bnum = request.getParameter("bnum");
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qb = QnABoardDAO.getInstance();
		int result = qb.insertReply(qrd);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("댓글달기 성공");
		location.href = "homeMainPage.jsp?pgm=../jinju/QnA/QnASelect.jsp?bnum=" + <%=qrd.getBnum()%> + "&pageNum="
				+ <%=pageNum%>;
		histroy.back();
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("댓글달기 실패");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>