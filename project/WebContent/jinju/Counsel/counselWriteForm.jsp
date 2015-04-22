<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 글쓰기</title>
</head>
<body>

	<%
		int bnum = 0, ref = 0, re_level = 0, re_step = 0;
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null)
			pageNum = "1";
		
		if (request.getParameter("bnum") != null) {
			bnum = Integer.parseInt(request.getParameter("bnum"));
			CounselBoardDAO cbd = CounselBoardDAO.getInstance();
			CounselBoard cboard = cbd.select(bnum);
			ref = cboard.getRef();
			re_level = cboard.getRe_level();
			re_step = cboard.getRe_step();
		}
	%>
	<form action="counselWritePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="bnum" value="<%=bnum%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="re_level" value="<%=re_level%>"> 
		<input type="hidden" name="re_step" value="<%=re_step%>">
		
		<table>
			<caption>
				<h2>고민상담 글쓰기</h2>
			</caption>
			<tr>
				<td>분류 선택</td>
				<td>
				 <select name="category"><!-- 대주 option value에 숫자 기입 -->
			           <option value="1">[군대]</option>
			           <option value="2">[연애]</option>
			           <option value="3">[진로]</option>
			           <option value="4">[친구]</option>
			           <option value="5">[학업]</option>
			           <option value="6">[기타]</option>
			       </select>
			     </td>
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