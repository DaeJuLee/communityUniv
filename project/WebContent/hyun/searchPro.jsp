<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		int snum = Integer.parseInt(request.getParameter("snum"));
		String email = request.getParameter("email");

		MemberDao md = MemberDao.getInstance();
		String result = md.findMember(id, snum, email, name);
	
		if (result != null && (id == null || id.equals(""))) {
	%>
	<script type="text/javascript">
		alert("아이디를 보냈습니다. 메일을 확인하세요");
		location.href = "../hyun/asendidPro.jsp?id=<%=result%>&receiver=<%=email%>";
	</script>
	<%
		} else if (result != null && (name == null || name.equals(""))) {
	%>
	<script type="text/javascript">
		alert("비밀번호를 보냈습니다. 메일을 확인하세요.");
		location.href = "../hyun/asendpassPro.jsp?pass=<%=result%>&receiver=<%=email%>";
	</script>
	<%
		} else if (result == null && (id == null || id.equals(""))) {
	%>
	<script type="text/javascript">
		alert("정보를 잘못 입력하셨습니다.");
		location.href = "../combinePage/homeMainPage.jsp?pgm=../hyun/searchMember.jsp";
	</script>
	<%
		} else if (result == null && (name == null || name.equals(""))) {
	%>
	<script type="text/javascript">
		alert("정보를 잘못 입력하셨습니다.");
		location.href = "../combinePage/homeMainPage.jsp?pgm=../hyun/searchMember.jsp";
	</script>
	<%
		}
	%>

</body>
</html>