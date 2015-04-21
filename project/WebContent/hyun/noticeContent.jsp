<%@page import="pro.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
</head>
<body>
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		NoticeDao nd = NoticeDao.getInstance();
		nd.hits(bnum);
		Notice notice = nd.select(bnum);
	%>
	<table border="1">
	<caption>
		<h2>공지사항 상세내역</h2>
	</caption>
	<tr>
		<td>번호</td>
		<td><%=notice.getBnum()%></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=notice.getTitle()%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=notice.getWriter()%></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=notice.getS_date() %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=notice.getHits()%></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=notice.getContent()%></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="수정"
			onclick="location.href='noticeUpdateForm.jsp?bnum=<%=notice.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제"
			onclick="location.href='noticeDeleteForm.jsp?bnum=<%=notice.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="목록"
			onclick="location.href='noticeList.jsp?pageNum=<%=pageNum%>'"></td>
	</tr>
	</table>
</body>
</html>