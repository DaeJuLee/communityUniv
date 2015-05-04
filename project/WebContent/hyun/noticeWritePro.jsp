<%@page import="pro.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice write pro</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="notice" class="pro.Notice"></jsp:useBean>
	<jsp:setProperty property="*" name="notice" />
	<%
		String pageNum = request.getParameter("pageNum");
	NoticeDao nd = NoticeDao.getInstance();
		notice.setHits(0);
		int result = nd.insert(notice);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("공지사항 입력 완료");
		location.href = "homeMainPage.jsp?pgm=../hyun/noticeList.jsp?pageNum="+<%=pageNum%>;
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("공지사항 입력 실패");
		location.href = "homeMainPage.jsp?pgm=../hyun/noticeWriteForm.jsp?bnum=<%=notice.getBnum()%>&pageNum="+<%=pageNum%>;
	</script>
	<%
		}
	%>
</body>
</html>