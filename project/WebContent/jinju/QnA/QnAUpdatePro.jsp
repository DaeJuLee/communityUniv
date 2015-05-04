<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA updatePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="qboard" class="miniproject_jj.QnABoard"></jsp:useBean>
	<jsp:setProperty property="*" name="qboard" />
	<%
		String pageNum = request.getParameter("pageNum");
		
		qboard.setIp(request.getRemoteAddr());
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		int result =qbd.update(qboard);
	
		if (result > 0) {%>
			<script type="text/javascript">
				alert("수정완료하였습니다.");
				location.href="homeMainPage.jsp?pgm=../jinju/QnA/QnAList.jsp";
			</script>
		<%} else {
	%>
	<script type="text/javascript">
		alert("수정에 실패하셨습니다.");
		location.href="homeMainPage.jsp?pgm=../jinju/QnA/QnAUpdateForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>";
	</script>
	<%
		}
	%>

</body>
</html>