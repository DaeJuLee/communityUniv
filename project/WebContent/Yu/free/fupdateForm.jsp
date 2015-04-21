<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>

</head><body>
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(bnum);
	%>

	<form action="fupdatePro.jsp" method="post">
		<input type="hidden" name="bnum" value="<%=board.getBnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1">
			<caption>
				<h2>글 수정</h2>
			</caption>
			<tr>
				<td>번호</td>
				<td><%=board.getBnum()%></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="category">
			           <option value="[맛집]">[맛집]</option>
			           <option value="[패션]">[패션]</option>
			           <option value="[교수/수업]">[교수/수업]</option>
			           <option value="[주거]">[주거]</option>
			           <option value="[생활팁]">[생활팁]</option>
			           <option value="[기타]">[기타]</option>
     			  </select>
			</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"
					value="<%=board.getTitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=board.getWriter()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="bpass" required="required"
					value="<%=board.getBpass()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
						<textarea rows="10" cols="40"  name="content" required="required"><%=board.getContent()%></textarea>
					</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>