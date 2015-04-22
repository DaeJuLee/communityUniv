<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 수정</title>
</head>
<body>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		CounselBoard cboard = cbd.select(bnum);
	%>
	<form action="counselUpdatePro.jsp" method="post">
		<input type="hidden" name="bnum" value="<%=cboard.getBnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1">
			<caption>
				<h2>고민상담 수정</h2>
			</caption>
			<tr>
				<td>번호</td>
				<td><%=cboard.getBnum()%></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="category">
			           <option value="군대">[군대]</option>
			           <option value="연애">[연애]</option>
			           <option value="진로">[진로]</option>
			           <option value="친구">[친구]</option>
			           <option value="학업">[학업]</option>
			           <option value="기타">[기타]</option>
     			  </select>
			</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"
					value="<%=cboard.getTitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" required="required"
					value="<%=cboard.getWriter()%>"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="bpass" required="required"
					value="<%=cboard.getBpass()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>
						<textarea rows="10" cols="40" name="content" required="required"><%=cboard.getContent()%></textarea>
					</pre></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>


</body>
</html>