<%@page import="pro.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String pageNum = request.getParameter("pageNum");
	NoticeDao nd = NoticeDao.getInstance(); 	
	Notice notice = nd.select(bnum);
%>

<form action="noticeUpdatePro.jsp" method="post">
<input type = "hidden" name = "bnum" value = "<%=notice.getBnum()%>">
<input type = "hidden" name = "pageNum" value = "<%=pageNum%>">
<table>
	<caption><h2>게시판 수정</h2></caption>
	<tr><td>게시물 번호</td><td><%=notice.getBnum() %></td></tr>
	<tr><td>제목</td><td><input type = "text" name = "title" value = "<%=notice.getTitle()%>" required="required"></td></tr>
	<tr><td>작성일</td><td><%=notice.getS_date() %></td></tr>
	<tr><td>조회수</td><td><%=notice.getHits() %></td></tr>
	<tr><td>작성자</td><td><%=notice.getWriter() %></td></tr>
	<tr><td>내용</td><td><pre><textarea rows="10" cols="40" name = "content" required="required"><%=notice.getContent() %></textarea></pre></td></tr>
	<tr><td colspan="2" align="center"><input type= "submit" value="수정완료">
	</td></tr>
</table>
</form>
</body>
</html>