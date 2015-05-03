<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../common.css">
</head>
<body>
	<div class="columnMain">
		<h2>게시판 상세내역</h2>

		<%
			BoardDao bd = BoardDao.getInstance();
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			int ref = 0, re2_level = 0, re2_step = 0;
			bd.hits(bnum);
			Board board = bd.select(bnum);
			if (pageNum == null)
				pageNum = "1";
			if (bnum != 0) {
				ref = board.getRef();
				re2_level = board.getRe2_level();
				re2_step = board.getRe2_step();
			}
		%>
		<div class="contents">
			<table class="tbTy1 detaLeft">
				<tbody>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>번호</th>
					<td><%=board.getBnum()%></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><%=board.getCategory()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=board.getTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=board.getWriter()%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=board.getS_date()%></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%=board.getHits()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=board.getContent()%></td>
				</tr>
				</table>

				<div class="btnArea">
					<span class="btnR"> <input type="button" value="수정" class = "btnTy3"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/free/fupdateForm.jsp?bnum=<%=board.getBnum()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="삭제" class = "btnTy2"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/free/fdeleteForm.jsp?bnum=<%=board.getBnum()%>'">
						<input type="button" value="목록" class = "btnTy3"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/free/freeList.jsp?pageNum=<%=pageNum%>'">
					</span>
				</div>


	<form>
		<table class="tbTy1 detaLeft">
			<tbody>
					
			<tr>
				<td colspan="2">
					<textarea cols="100%"></textarea>
				
					<div class="btnArea">
						<span class="btnR">
							<input type="button" value="확인" class="btnTy3">
						</span>
					</div>
				</td>
			</tr>
		</table>
		
	</form>
	
	</div>
	</div>

</body>
</html>