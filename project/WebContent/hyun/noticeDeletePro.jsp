<%@page import="pro.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="notice" class="pro.Notice"></jsp:useBean>
	<jsp:setProperty property="*" name="notice" />
	<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	NoticeDao nd = NoticeDao.getInstance();
	int result = nd.delete(bnum);

	if(result>0) {
	response.sendRedirect("noticeList.jsp");
		
	}else{
		%>
	<script type="text/javascript">
		alert("에러입니다.");
		location.href = "noticeDeleteForm.jsp?bnum=<%=bnum%>";
		</script>
	<%
	} 
		
		%>
</body>
</html>