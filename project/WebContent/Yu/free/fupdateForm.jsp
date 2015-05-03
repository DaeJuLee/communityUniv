<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="../../common.css">
</head>
<body>
	<div class="columnMain">
		<h2>글 수정</h2>
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(bnum);
		%>

		<form action="homeMainPage.jsp?pgm=../Yu/free/fupdatePro.jsp" method="post">
			<input type="hidden" name="bnum" value="<%=board.getBnum()%>">
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
						<td><%=board.getBnum()%></td>
					</tr>

					<tr>
						<th scope="row">분류</th>
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
						<td><input type="text" name="title" required="required"
							class="intTy" style="width: 88%;" value="<%=board.getTitle()%>"></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><%=board.getWriter()%></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" name="bpass" required="required"
							class="intTy" style="width: 88%;" value="<%=board.getBpass()%>"></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><textarea rows="10" cols="40" name="content"
								required="required" class="intTy"
								style="width: 165px; height: 100px;"><%=board.getContent()%></textarea></td>
					</tr>
					</tbody>
				</table>
				
				<div class="btnArea">
					<span class="btnR"> <input type="submit" value="수정완료"
						class="btnTy3"> <input type="reset" value="다시작성"
						class="btnTy2">
					</span>
				</div>

			</div>
		</form>
		</div>
</body>
</html>