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
		out.println("result : " + result + "\t");
		out.println("id : " + id + "\t");
		out.println("email : " + email + "\t");
		if (result != null && (id == null||id.equals(""))) {
	%>
	<script type="text/javascript">
		 var result ='<%=result%>';
		 alert(result);
		 alert("id입니다. 우측상단 확인하세요");
		location.href = "../combinePage/homeMainPage.jsp";
	</script>
	<%
		} else if (result != null && ( name == null || name.equals(""))) {
	%>
	<script type="text/javascript">
		alert("비밀번호는 " + result + "입니다.");
		location.href ="../combinePage/homeMainPage.jsp";
	</script>
	<%
		} else if (result == null && ( id == null || id.equals(""))) {
	%>
	<script type="text/javascript">
		alert("id 찾기를 실패하셨습니다.");
		location.href = "searchMember.jsp";
	</script>
	<%
		} else if (result == null && ( name == null || name.equals(""))) {
	%>
	<script type="text/javascript">
		alert("비밀번호 찾기를 실패하셨습니다.");
		location.href = "searchMember.jsp";
	</script>
	<%
		}
	%>

</body>
</html>