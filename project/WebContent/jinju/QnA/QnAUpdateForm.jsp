<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 수정</title>

<!-- <link rel="stylesheet" type="text/css" href="../../common.css"> -->

</head>
<body>
	
	<div class="columnMain">
	<h2>QnA 글 수정</h2>
	
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String writer = request.getParameter("writer");
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		QnABoard qboard = qbd.select(bnum);
	%>
	<form action="homeMainPage.jsp?pgm=../jinju/QnA/QnAUpdatePro.jsp" method="post">
		<input type="hidden" name="bnum" value="<%=qboard.getBnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		<div class="contents">
		<table class="tbTy1 detaLeft">
			<tbody>
			
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
		
			<tr>
				<th scope="row">번호</th>
				<td><%=qboard.getBnum()%></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="title" required="required" value="<%=qboard.getTitle()%>" class="intTy" style="width:88%;"></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td><%=qboard.getWriter() %></td>
			</tr>
			<tr>
				<th scope="row">암호</th>
				<td><input type="password" name="bpass" required="required" class="intTy" style="width:88%;" value = "<%=qboard.getBpass()%>"></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td><textarea rows="10" cols="30" name="content" required="required" style="width:465px; height:100px;"><%=qboard.getContent()%></textarea></td>
			</tr>
			
			</tbody>
		</table>
		
		<div class="btnArea">
			<span class="btnR">
				<input type="submit" value="확인" class="btnTy3">
				<input type="reset" value="다시작성" class="btnTy2">
			</span>
		</div>
		
		</div>
	</form>

	</div>

</body>
</html>