<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 수정</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		QnABoard qboard = qbd.select(bnum);
	%>
	<form action="QnAUpdatePro.jsp" method="post">
		<input type="hidden" name="bnum" value="<%=qboard.getBnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1">
			<caption>
				<h2>QnA 수정</h2>
			</caption>
			<tr>
				<td>번호</td>
				<td><%=qboard.getBnum()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"
					value="<%=qboard.getTitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" required="required"
					value="<%=qboard.getWriter()%>"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="bpass" required="required"
					value="<%=qboard.getBpass()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>
						<textarea rows="10" cols="40" name="content" required="required"><%=qboard.getContent()%></textarea>
					</pre></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>

</body>
</html>