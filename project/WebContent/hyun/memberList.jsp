<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 명단</title>
<link rel="stylesheet" type="text/css" href="../common.css">
</head>
<body>

	<!-- 리스트 페이지 블록이 안나뉨.... -->
	<div class="columnMain">
		<h2>회원 정보</h2>
		<div class="contents">
			<table class="tbTy1">
				<colgroup>
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="17%">
					<col width="20%">
					<col width="25%">
					<col width="8%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">학번</th>
						<th scope="col">id</th>
						<th scope="col">이름</th>
						<th scope="col">별명</th>
						<th scope="col">전공</th>
						<th scope="col">메일</th>
						<th scope="col">주소</th>
						<!-- <th scope="col">등급</th> -->
						<!-- <th scope="col">수정</th> -->
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
						request.setCharacterEncoding("utf-8");
						MemberDao md = MemberDao.getInstance();
						int totCnt = md.getTotalCnt();

						String pageNum = request.getParameter("pageNum");
						if (pageNum == null || pageNum.equals("")) {
							pageNum = "1";
						}
						int currentPage = Integer.parseInt(pageNum);
						int pageSize = 10;
						int blockSize = 10;
						int startRow = (currentPage - 1) * pageSize + 1;
						int endRow = startRow + pageSize - 1;
						int startNum = totCnt - startRow + 1;

						List<Member> list = md.list(startRow,endRow);

						if (list == null) {
							out.println("회원 정보가 없습니다.");
						} else {
							for (int i = 0; i < list.size(); i++) {
					%>


					<tr>
						<td width="8%" align="center"><%=list.get(i).getSnum()%></td>
						<td width="10%" align="center"><%=list.get(i).getId()%></td>
						<td width="10%" align="center"><%=list.get(i).getName()%></td>
						<td width="10%" align="center"><%=list.get(i).getWriter()%></td>
						<td width="10%" align="center"><%=list.get(i).getMajor()%></td>
						<td width="20%" align="center"><%=list.get(i).getEmail()%></td>
						<td width="18%" align="center">(<%=list.get(i).getPost1()%>-<%=list.get(i).getPost2()%>)
							<%=list.get(i).getJibeon()%> <%=list.get(i).getAddr()%></td>
						<%-- 			<td width="8%" align="center"><%=list.get(i).getGrade()%></td> --%>
						<%-- 	<td width="8%" align="center"><a href="memberUpdate.jsp?id=<%=list.get(i).getId()%>">수정</a></td> --%>
						<td width="5%" align="center"><a
							href="memberDelete.jsp?id=<%=list.get(i).getId()%>">삭제</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<%
			}
		%>
		<div style="text-align: center;">
			<p class="paging">
				<%
					int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
					int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
					int endPage = startPage + blockSize - 1;
					if (endPage > pageCnt)
						endPage = pageCnt;
					if (startPage > blockSize) {
						out.println("<a href='memberList.jsp?pageNum="
								+ (startPage - blockSize) + "'>[이전]</a>");
					}

					for (int i = startPage; i <= endPage; i++) {
						out.println("<a href='memberList.jsp?pageNum=" + i + "'>[" + i
								+ "]</a>");
					}

					if (endPage < pageCnt) {
						out.println("<a href='memberList.jsp?pageNum="
								+ (startPage + blockSize) + "'>[다음]</a>");
					}
				%>
			
		</div>
	</div>
</body>
</html>