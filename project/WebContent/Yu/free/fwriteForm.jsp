<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
<link rel="stylesheet" type="text/css" href="../../common.css">
</head>
<body>
	<div class="columnMain">
		<h2>자유게시판 글쓰기</h2>
		<%
			BoardDao bd = BoardDao.getInstance();
			String pageNum = request.getParameter("pageNum");
			int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
			Board board = bd.select(bnum);
			if (pageNum == null)
				pageNum = "1";
			if (request.getParameter("bnum") != null) {
				bnum = Integer.parseInt(request.getParameter("bnum"));

				ref = board.getRef();
				re2_level = board.getRe2_level();
				re2_step = board.getRe2_step();
			}
		%>
		<form action="fwritePro.jsp?pageNum=<%=pageNum%>" method="post">
			<input type="hidden" name="bnum" value="<%=bnum%>">
			<%-- <input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re2_level" value="<%=re2_level%>">
	<input type="hidden" name="re2_step" value="<%=re2_step%>"> --%>
			<div class="contents">
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>분류 선택</th>
						<td><select name="category" class="intTy" style="width: 88%;">
								<option value="맛집">[맛집]</option>
								<option value="패션">[패션]</option>
								<option value="교수/수업">[교수/수업]</option>
								<option value="주거">[주거]</option>
								<option value="생활팁">[생활팁]</option>
								<option value="기타">[기타]</option>
						</select></td>
</tr>
<tr>
						<th scope="row">제목</th>
						<td><input type="text" size="50" maxlength="50" name="title"
							class="intTy" style="width: 88%;"></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><%=board.getWriter()%></td>
					</tr>
						<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" size="5" maxlength="10"
							name="bpass"></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><textarea rows="10" cols="30" name="content"
								required="required" style="width: 465px; height: 100px;"></textarea></td>
					</tr>
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