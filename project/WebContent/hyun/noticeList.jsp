<%@page import="pro.Notice"%>
<%@page import="pro.NoticeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="../jinju/css/common.css">
<!-- 관리자용 공지사항 목록 -->
\
</head>
<body>
	<div class="columnMain">
		<h2>공지사항</h2>
		<p class="location">
			<span><a href="noticeWriteForm.jsp" class="btnTy3">공지쓰기</a></span>
		</p>
		<div class="contents">
		<!-- 공지사항 목록 출력 부분 -->
			<table class="tbTy1">
				<colgroup>
					<col width="15%">
					<col width="40%">
					<col width="15%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						NoticeDao nd = NoticeDao.getInstance();
						int totCnt = nd.getTotalCnt();
						String pageNum = request.getParameter("pageNum");
						if (pageNum == null || pageNum.equals("")) {
							pageNum = "1";
						}
						int currentPage = Integer.parseInt(pageNum);
						int pageSize = 10, blockSize = 10;
						int startRow = (currentPage - 1) * pageSize + 1;
						int endRow = startRow + pageSize - 1;
						int startNum = totCnt - startRow + 1;
						List<Notice> list = nd.list(startRow, endRow);
						if (totCnt > 0) {
							for (int i = 0; i < list.size(); i++) {
								out.println("<tr><td>" + startNum-- + "</td>");
								out.println("<td class=left width=200>");
								out.println("<a href=noticeContent_manager.jsp?bnum="
										+ list.get(i).getBnum() + "&pageNum=" + currentPage
										+ ">" + list.get(i).getTitle() + "</a></td>");
								out.println("<td>" + list.get(i).getWriter() + "</td>");
								out.println("<td>" + list.get(i).getS_date() + "</td>");
								out.println("<td>" + list.get(i).getHits() + "</td></tr>");
							}
						} else {
							out.println("<tr><td colspan=7>데이터가 없습니다.</td></tr>");
						}
					%>
				</tbody>
			</table>
		</div>

<!-- 페이지 넘버 설정하는 부분 -->

		<div style="text-align: center;">
			<p class="paging">
				<%
					int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
					int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
					int endPage = startPage + blockSize - 1;
					if (endPage > pageCnt) {
						endPage = pageCnt;
					}
					if (startPage > blockSize) {
						out.println("<a href=noticeList_manager.jsp?pageNum="
								+ (startPage - blockSize) + ">[이전]</a>");

					}
					for (int i = startPage; i < endPage; i++) {
						out.println("<a href = noticeList_manager.jsp?pageNum=" + i + ">[" + i
								+ "]</a>");
					}
					if (endPage < pageCnt) {
						out.println("<a href=noticeList_manager.jsp?pageNum="
								+ (startPage + blockSize) + ">[다음]</a>");
					}
				%>
			
		</div>
	</div>
</body>
</html>
