<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 UpdatePro</title>
</head>
<body>

	<%
			request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="cboard" class="miniproject_jj.CounselBoard"></jsp:useBean>
	<jsp:setProperty property="*" name="cboard" />
	<%
		String pageNum = request.getParameter("pageNum");
			cboard.setIp(request.getRemoteAddr());
			CounselBoardDAO cbd = CounselBoardDAO.getInstance();
			int result =cbd.update(cboard);
		
			if (result > 0) {
	%>
		<script type="text/javascript">
		alert("수정완료");
		location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselSelect.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>";
		</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("수정에 실패하셨습니다.");
		location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselUpdateForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>";
	</script>
	<%
		}
	%>

</body>
</html>