<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.MemberDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="pro.Member"></jsp:useBean>
	<jsp:setProperty property="*" name="member" />
	<%
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		int result = md.deleteM(id);

		if (result > 0) {
			//response.sendRedirect("homeMainPage.jsp?pgm=../hyun/memberList.jsp");
	%>
	<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href = "../combinePage/homeMainPage.jsp?pgm=../hyun/memberList.jsp";
	</script>

	<%
		} else {
	%>
	<script type="text/javascript">
		alert("삭제할 수 없습니다.");
		location.href = "../combinePage/homeMainPage.jsp?pgm=../hyun/memberList.jsp";
	</script>
	<%
		}
	%>
</body>
</html>
