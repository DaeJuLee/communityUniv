<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 리플 Pro</title>
</head>
<body>

	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="cboard" class="miniproject_jj.CounselBoard"></jsp:useBean>
	<jsp:setProperty property="*" name="cboard" />
	
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();

		int result = cbd.reply(cboard);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("입력 완료햇습니다");  
		location.href="counselSelect.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("다시 작성해주세요");  
		location.href="counselReForm.jsp";
	</script>
	<%
		}
	%>
	

</body>
</html>