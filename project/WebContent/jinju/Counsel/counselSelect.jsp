<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counsel Select</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

</head>
<body>

	<div class="columnMain">
	<h2>고민상담 상세내역</h2>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		cbd.hits(bnum);
		CounselBoard cboard = cbd.select(bnum);
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
			<td><%=cboard.getBnum()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=cboard.getTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>*****<input type="hidden" value="<%=cboard.getWriter()%>"></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=cboard.getS_date()%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=cboard.getHits()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre><%=cboard.getContent()%></pre></td>
		</tr>
	</table>
		
	<div class="btnArea">
		<span class="btnR">
			<input type="button" class="btnTy3" value="수정" onclick="location.href='counselUpdateForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy2" value="답변작성" onclick="location.href='counselWriteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy3" value="삭제" onclick="location.href='counselDeleteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy2" value="목록" onclick="location.href='counselList.jsp?pageNum=<%=pageNum%>'">
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