<%@page import="pro.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>

<link rel="stylesheet" type="text/css" href="../jinju/css/common.css">

</head>
<body>
	<div class="columnMain">
		<h2>공지사항 수정</h2>
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			NoticeDao nd = NoticeDao.getInstance();
			Notice notice = nd.select(bnum);
		%>

		<form action="noticeUpdatePro.jsp" method="post">
			<input type="hidden" name="bnum" value="<%=notice.getBnum()%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<div class="contents">
			
			<!-- 공지사항 수정 폼 출력부분 -->
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>게시물 번호</th>
						<td><%=notice.getBnum()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"
							value="<%=notice.getTitle()%>" required="required" class="intTy"
							style="width: 88%;"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=notice.getS_date()%></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=notice.getHits()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=notice.getWriter()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="40" name="content"
								required="required" style="width: 465px; height: 100px;"><%=notice.getContent()%></textarea>
						</td>
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