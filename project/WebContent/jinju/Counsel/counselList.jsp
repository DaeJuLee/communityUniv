<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 게시판</title>

<link rel="stylesheet" type="text/css" href="../css/common.css">

</head>
<body>
	<div class="columnMain">
	<h2>고민상담 게시판</h2>
	
	<p class="location">
		<span><a href= "counselWriteForm.jsp" class="btnTy3">글쓰기</a></span>	
	</p>
	
	<div class="contents">	
	<table class = "tbTy1">
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="40%">
			<col width="10%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">분류</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
		</thead>
	<tbody>
	
		<%
			CounselBoardDAO cbd = CounselBoardDAO.getInstance();
			int totCnt = cbd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
		
			List<CounselBoard> list = cbd.list(startRow, endRow);
		
			if (totCnt > 0) {
				for (int i = 0; i < list.size(); i++) {
					out.println("<tr><td>" + startNum-- + "</td>");
					out.println("<td>"+list.get(i).getCategory()+"</td>");
				
					int width = list.get(i).getRe_level() * 10;
					out.println("<td class=left width=200>");
				
					if (list.get(i).getHits() > 20) {
						out.println("<img src='images/hot.gif'>");
					}
					if (list.get(i).getRe_level() > 0) {
						out.println("<img src='images/level.gif' width="+ width + ">" + "<img src='images/re.gif'>");
					}
					out.println("<a href='counselSelect.jsp?bnum="+ list.get(i).getBnum() + "&pageNum=" + currentPage + "'>" + list.get(i).getTitle() + "</a></td>");
					out.println("<td>*****" + "</td>");
				
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
		
		<div style="text-align: center;">
			<p class="paging">
			<%
				int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
				int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
				int endPage = startPage + blockSize - 1;
		
				if (endPage > pageCnt)			endPage = pageCnt;
			
				if (startPage > blockSize) {
					out.println("<a href='counselList.jsp?pageNum=" + (startPage - blockSize) + "'>[이전]</a>");
				}
	
				for (int i = startPage; i <= endPage; i++) {
					out.println("<a href='counselList.jsp?pageNum=" + i + "'>[" + i + "]</a>");
				}
	
				if (endPage < pageCnt) {
					out.println("<a href='counselList.jsp?pageNum="	+ (startPage + blockSize) + "'>[다음]</a>");
				}
			%>
		</div>
		<input type = "hidden" >


</body>
</html>