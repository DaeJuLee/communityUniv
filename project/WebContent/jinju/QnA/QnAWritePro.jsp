<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA WritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="qboard" class="miniproject_jj.QnABoard"></jsp:useBean>
	<jsp:setProperty property="*" name="qboard" />
	<%
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO pbd = QnABoardDAO.getInstance();
		qboard.setHits(0);
		qboard.setIp(request.getRemoteAddr());
		int result = pbd.insert(qboard);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("입력 완료했습니다");  
		location.href="QnAList.jsp?pageNum="+<%=pageNum%>;
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("다시 작성해주세요");  
		location.href="QnAWriteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>";
	</script>
	<%
		}
	%>

</body>
</html>