<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 deletePro</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String bpass = request.getParameter("bpass");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
	
		int result = cbd.delete(bnum, bpass);
		if (result > 0) {
		%>
			<script type="text/javascript">
				alert("삭제 완료");
				location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselList.jsp";
			</script>
		<%
		} else {
		%>
	<script type="text/javascript">
		alert("패스워드를 틀렸습니다.");
		location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselDeleteForm.jsp?bnum=<%=bnum%>";
	</script>
	<%
		}
	%>

</body>
</html>