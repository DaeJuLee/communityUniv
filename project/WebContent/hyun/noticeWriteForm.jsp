<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지작성</title>
</head>
<body>
	<%
		int bnum = 0;
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.select(bnum);
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		String number = request.getParameter("bnum");
		if (number == null || number.equals("")) {
			bnum = 0;
		} else {
			bnum = Integer.parseInt(number);
			
		}
	%>
	<form action="noticeWritePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="bnum" value="<%=bnum%>">
		<table>
			<caption>
				<h2>게시판 글쓰기</h2>
			</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=notice.getWriter() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" name="content"
						required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>