<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA deletePro</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String bpass = request.getParameter("bpass");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
	
		int result = qbd.delete(bnum, bpass);
		if (result > 0) {
			/* response.sendRedirect("QnAList.jsp"); */%>
			<script type="text/javascript">
				alert("삭제완료했습니다.");
				location.href="homeMainPage.jsp?pgm=../jinju/QnA/QnAList.jsp";
			</script>
		<%
		} else {
		%>
	<script type="text/javascript">
		alert("패스워드를 틀렸습니다.");
		location.href="homeMainPage.jsp?pgm=../jinju/QnA/QnADeleteForm.jsp?bnum=<%=bnum%>";
	</script>
	<%
		}
	%>

</body>
</html>