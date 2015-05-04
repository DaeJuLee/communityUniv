<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counsel WritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="cboard" class="miniproject_jj.CounselBoard"></jsp:useBean>
	<jsp:setProperty property="*" name="cboard" />
	<%
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		cboard.setHits(0);
		int result = cbd.insert(cboard);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("입력 완료했습니다");  
		location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselList.jsp?pageNum="+<%=pageNum%>;
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("다시 작성해주세요");  
		location.href="homeMainPage.jsp?pgm=../jinju/Counsel/counselWriteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>";
	</script>
	<%
		}
	%>


</body>
</html>