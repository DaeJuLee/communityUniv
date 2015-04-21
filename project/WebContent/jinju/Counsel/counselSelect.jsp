<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counsel Select</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		cbd.hits(bnum);
		CounselBoard cboard = cbd.select(bnum);
	%>
	<table border="1">
		<caption>
			<h2>게시판 상세내역</h2>
		</caption>
		<tr>
			<td>번호</td>
			<td><%=cboard.getBnum()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=cboard.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>*****<input type="hidden" value="<%=cboard.getWriter()%>"></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=cboard.getS_date()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=cboard.getHits()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre><%=cboard.getContent()%></pre></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='counselUpdateForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답변작성" onclick="location.href='counselWriteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제" onclick="location.href='counselDeleteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="목록" onclick="location.href='counselList.jsp?pageNum=<%=pageNum%>'"></td>
			</td>
		</tr>
	</table>


<!-- 댓글창 include 하기 -->


</body>
</html>