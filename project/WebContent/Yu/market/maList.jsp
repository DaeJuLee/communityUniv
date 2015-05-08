<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<%
		if(id.equals("not") || id == "not"){//회원이 아닌경우
	%>
	<script type="text/javascript">
		alert("회원들만 사용할 수 있습니다.");
		location.href = "../combinePage/homeMainPage.jsp";
	</script>
	<%
		} else {
	%>
	<h2>장터 게시판</h2>
	<table>
		<tr>
			<span><a href="homeMainPage.jsp?pgm=../Yu/market/mwriteForm.jsp" >글쓰기</a></span>
		</tr>
	</table>
	<table>
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			MaBoardDao mbd = MaBoardDao.getInstance();
			int totCnt = mbd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<MaBoard> list = mbd.list(startRow, endRow);
			if (totCnt > 0) {
				for (int i = 0; i < list.size(); i++) {
					out.println("<tr><td>" + startNum-- + "</td>");
					out.println("<td>" + list.get(i).getCategory() + "</td>");
					int width = list.get(i).getRe2_level() * 10;
					out.println("<td class=left width=200>");
					if (list.get(i).getHits() > 20) {
						out.println("<img src='../images/hot.gif'>");
					}
					if (list.get(i).getRe2_level() > 0) {
						out.println("<img src='../images/level.gif' width="
								+ width + ">" + "<img src='../images/re.gif'>");
					}
					out.println("<a href='homeMainPage.jsp?pgm=../Yu/market/mContent.jsp?bnum="
							+ list.get(i).getBnum() + "&pageNum=" + currentPage+
							 "'>" + list.get(i).getTitle() + "</a></td>");

					out.println("<td>" + list.get(i).getWriter() + "</td>");
					out.println("<td>" + list.get(i).getS_date() + "</td>");
					
					
					if (id.equals("admin") || id == "admin") {
						/*out.println("<td><input type = 'checkbox' name = 'list'"+
						"value =" + list.get(i).getBnum() +
						 "</td>"); */
						 //글삭제시 checkbox이용 할려 했으나.. 일단 삭제 부터..
						 out.println("<td><a href = '../../adminPage/marketListDelete.jsp?bnum="+
								 	list.get(i).getBnum() +"'>게시글 삭제");
						 out.println("</a></td>");
						} else {
							out.println("<td>" + list.get(i).getHits()
									+ "</td></tr>");
						}
				}
			} else {
				out.println("<tr><td colspan=7>데이터가 없네</td></tr>");
			}
		%>
	</table>
	<div style="text-align: center;">
		<%
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if (endPage > pageCnt)
				endPage = pageCnt;
			if (startPage > blockSize) {
				out.println("<a href='maList.jsp?pageNum="
						+ (startPage - blockSize) + "'>[이전]</a>");
			}

			for (int i = startPage; i <= endPage; i++) {
				out.println("<a href='maList.jsp?pageNum=" + i + "'>[" + i
						+ "]</a>");
			}

			if (endPage < pageCnt) {
				out.println("<a href='maList.jsp?pageNum="
						+ (startPage + blockSize) + "'>[다음]</a>");
			}
		%>
	</div>
	<%
			if (id.equals("admin") || id == "admin") {
		%>
		<!-- <div>
			<span class="locationDelete"> <a href="../../adminPage/freeListDelete.jsp"
				class="btnTy3">글삭제</a>
			</span>
		</div> -->
		<%
			}
		%>

		<%
			}//회원구분 if/else에서 else 끝에 마무리 괄호
		%>
</body>
</html>