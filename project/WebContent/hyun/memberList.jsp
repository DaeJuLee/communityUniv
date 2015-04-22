<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- 리스트 페이지 블록이 안나뉨.... -->

	<h3>회원 정보</h3>
	<table border="1" width="100%" align="center">
		<tr>
			<th>학번</th>
			<th>id</th>
			<th>이름</th>
			<th>별명</th>
			<th>학적상태</th>
			<th>메일</th>
			<th>주소</th>
			<th>등급</th>
		</tr>
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

			List<Member> list = md.list();

			if (list == null) {
				out.println("회원 정보가 없습니다.");
			} else {
				for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td width="8%" align="center"><%=list.get(i).getSnum()%></td>
			<td width="12%" align="center"><%=list.get(i).getId()%></td>
			<td width="12%" align="center"><%=list.get(i).getName()%></td>
			<td width="12%" align="center"><%=list.get(i).getWriter()%></td>
			<td width="8%" align="center"><%=list.get(i).getStatement()%></td>
			<td width="19%" align="center"><%=list.get(i).getEmail()%></td>
			<td width="19%" align="center">(<%=list.get(i).getPost1()%>-<%=list.get(i).getPost2()%>)
				<%=list.get(i).getJibeon()%> <%=list.get(i).getAddr()%> <%=list.get(i).getAddr2()%></td>
			<td width="8%" align="center"><%=list.get(i).getGrade()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	<div style="text-align: center;">
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
</body>
</html>