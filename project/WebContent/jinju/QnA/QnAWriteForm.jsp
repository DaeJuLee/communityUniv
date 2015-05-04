<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 글작성</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

</head>
<body>

	<div class="columnMain">
	<h2>QnA 글쓰기</h2>
		
	<%
		int bnum = 0, ref = 0, re_level = 0, re_step = 0;
		String writer = request.getParameter("writer");
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
	<form action="homeMainPage.jsp?pgm=../jinju/QnA/QnAWritePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="bnum" value="<%=bnum%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="re_level" value="<%=re_level%>"> 
		<input type="hidden" name="re_step" value="<%=re_step%>">

		<div class="contents">
		<table class="tbTy1 detaLeft">
			<tbody>
			
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			
			<tr>
				<th scope="row">제목</th>
				<td>
						<%
						if (bnum > 0) {
						%> 
							<input type="text" name="title" value="[답변] " required="required" class="intTy" style="width:88%;"> 
						<%
 						} else {
						%> 
						 <input type="text" name="title" required="required" class="intTy" style="width:88%;"> 
						<%
 						}
 						%>
				</td>
			</tr>
			<tr>
				<th scope="row">작성자</th><!-- 작성자명을 세션과 연동해서 할 것... -->
				<td><%=writer %></td>
			</tr>
			<tr>
				<th scope="row">암호</th>
				<td><input type="password" name="bpass" required="required" class="intTy" style="width:88%;"></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td><textarea rows="10" cols="30" name="content" required="required" style="width:465px; height:100px;"></textarea></td>
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