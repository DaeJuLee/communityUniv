<%@page import="pro.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="notice" class = "pro.Notice"/>
<jsp:setProperty property="*" name="notice"/>
<%
	String pageNum = request.getParameter("pageNum");
	NoticeDao nd = NoticeDao.getInstance();
	int result = nd.update(notice);
	if(result > 0) { 
	response.sendRedirect("noticeList.jsp?pageNum="+pageNum);
	%>
	<script type="text/javascript">
		alert("공지사항 내용 수정 완료");
	</script>
	<%
	}else{
	%>
	<script type="text/javascript">
		alert("공지사항 내용 수정 실패");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>