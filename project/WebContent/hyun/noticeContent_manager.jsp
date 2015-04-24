<%@page import="pro.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
<link rel="stylesheet" type="text/css" href="../jinju/css/common.css">
</head>
<body>
	<div class="columnMain">
		<h2>공지사항 상세내역</h2>
		<!-- 관리자용 공지사항 내역 -->
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			NoticeDao nd = NoticeDao.getInstance();
			nd.hits(bnum);
			Notice notice = nd.select(bnum);
		%>

		<!-- 공지사항 세부내역 출력부분 -->

		<div class="contents">
			<table class="tbTy1 detaLeft">
				<tbody>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>번호</th>
					<td><%=notice.getBnum()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=notice.getTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=notice.getWriter()%></td>
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
					<th>내용</th>
					<td><%=notice.getContent()%></td>
				</tr>
			</table>

			<div class="btnArea">
				<span class="btnR"> <input type="button" value="수정"
					class="btnTy3"
					onclick="location.href='noticeUpdateForm.jsp?bnum=<%=notice.getBnum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="삭제" class="btnTy2"
					onclick="location.href='noticeDeleteForm.jsp?bnum=<%=notice.getBnum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="목록" class="btnTy3"
					onclick="location.href='noticeList_manager.jsp?pageNum=<%=pageNum%>'">
				</span>
			</div>
		</div>
	</div>
</body>
</html>