<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemberDao md = MemberDao.getInstance();
		int check = md.check(id, pass);
		if (check == 1) {
			session.setAttribute("id", id);
			response.sendRedirect("homeMainPage.jsp");
		} else if (check == 0) {
	%>
	<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		} else if (check == -1) {
	%>
	<script type="text/javascript">
		alert("아이디가 맞지 않습니다..");
		history.go(-1);
	</script>
	<%
		} 
	%>

</body>
</html>