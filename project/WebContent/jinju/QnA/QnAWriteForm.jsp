<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 글작성</title>
</head>
<body>
	<%
		int bnum = 0, ref = 0, re_level = 0, re_step = 0;
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null)
			pageNum = "1";
		
		if (request.getParameter("bnum") != null) {
			bnum = Integer.parseInt(request.getParameter("bnum"));
			QnABoardDAO qbd = QnABoardDAO.getInstance();
			QnABoard qboard = qbd.select(bnum);
			ref = qboard.getRef();
			re_level = qboard.getRe_level();
			re_step = qboard.getRe_step();
		}
	%>
	<form action="QnAWritePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="bnum" value="<%=bnum%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="re_level" value="<%=re_level%>"> 
		<input type="hidden" name="re_step" value="<%=re_step%>">
		
		<table>
			<caption>
				<h2>QnA 글쓰기</h2>
			</caption>
			<tr>
				<td>제목</td>
				<td>
						<%
						if (bnum > 0) {
						%> 
							<input type="text" name="title" value="[답변] " required="required"> 
						<%
 						} else {
						%> 
						 <input type="text" name="title" required="required"> 
						<%
 						}
 						%>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" required="required"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="bpass" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" name="content" required="required"></textarea></td>
			</tr>
		
			<tr>
				<td colspan  = "2"><input type="submit" value="확인">
				<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>