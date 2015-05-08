<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bd" class="project.MaReplyBoard"></jsp:useBean>
	<jsp:setProperty property="*" name="bd" />
	<%
		String pageNum = request.getParameter("pageNum");
		MaBoardDao md = MaBoardDao.getInstance();
		int result = md.insertReply(bd);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("댓글달기 성공");
		location.href = "homeMainPage.jsp?pgm=../Yu/market/mContent.jsp?bnum=" + <%=bd.getBnum()%> + "&pageNum="+ <%=pageNum%>;
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