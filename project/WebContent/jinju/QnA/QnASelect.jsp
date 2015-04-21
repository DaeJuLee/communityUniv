<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA Select</title>
</head>
<body>
	
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		qbd.hits(bnum);
		QnABoard qboard = qbd.select(bnum);
	%>
	<table border="1">
		<caption>
			<h2>게시판 상세내역</h2>
		</caption>
		<tr>
			<td>번호</td>
			<td><%=qboard.getBnum()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=qboard.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=qboard.getWriter()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=qboard.getS_date()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=qboard.getHits()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre><%=qboard.getContent()%></pre></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='QnAUpdateForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답변작성" onclick="location.href='QnAWriteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제" onclick="location.href='QnADeleteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="목록" onclick="location.href='QnAList.jsp?pageNum=<%=pageNum%>'">
		</tr>
	</table>
	
</body>
</html>