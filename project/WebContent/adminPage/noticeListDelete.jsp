<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "admin.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	AdminDao ad = AdminDao.getInstance();
	int result = ad.deleteNoticeBoard(bnum);
	if(result > 0){
%>
	<script type="text/javascript">
		alert("게시판 삭제 성공");
		location.href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("게시판 삭제 실패");
		location.href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp";
	</script>
<%
	}
%>
</body>
</html>