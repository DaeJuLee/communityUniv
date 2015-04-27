<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA Select</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

</head>
<body>
	
	<div class="columnMain">
	<h2>QnA 상세내역</h2>
		
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		qbd.hits(bnum);
		QnABoard qboard = qbd.select(bnum);
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
			<td><%=qboard.getBnum()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=qboard.getTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=qboard.getWriter()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=qboard.getS_date()%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=qboard.getHits()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre><%=qboard.getContent()%></pre></td>
		</tr>
	</table>

	<div class="btnArea">
		<span class="btnR">
			<input type="button" value="수정" class="btnTy3" onclick="location.href='QnAUpdateForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btnTy2" onclick="location.href='QnADeleteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="목록" class="btnTy3" onclick="location.href='QnAList.jsp?pageNum=<%=pageNum%>'">
			<input type="button" value="답변작성" class="btnTy2" onclick="location.href='QnAWriteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
		</span>
	</div>

	</div>
	</div>

</body>
</html>