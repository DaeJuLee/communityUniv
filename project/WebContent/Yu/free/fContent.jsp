<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {	width: 80%;}
.jiin {	text-align: left; }
h2 {text-align: center;}
.yu{ text-align: left;  width: 10%; }
.nn{ text-align: right; width: 90%;}
.r{ border-top: thick;}
</style>
</head>
<body>
<%
	BoardDao bd = BoardDao.getInstance();
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String pageNum = request.getParameter("pageNum");
	int  ref = 0, re2_level = 0, re2_step = 0;
	bd.hits(bnum);
	Board board = bd.select(bnum);
	if (pageNum == null) pageNum = "1";
	if ( bnum != 0) {		
		ref = board.getRef();
		re2_level = board.getRe2_level();
		re2_step = board.getRe2_step();
	}
%>
	<h2>게시판 상세내역</h2>
	<table>
		<tr>
			<td colspan="2" class="jiin">No.<%=board.getBnum() + "&nbsp" + "&nbsp" + 
						board.getCategory()+ "&nbsp" + board.getTitle()%></td>
		</tr>
		<tr>
			<td class="yu"><%=board.getWriter()%></td>
			<td class="nn">작성일:<%=board.getS_date() +"&nbsp&nbsp&nbsp"+ "조회수: "
					+ board.getHits()%></td>
		</tr>
		<tr>
			<td colspan="2" height="500px" valign="top"><%=board.getContent()%></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="수정" onclick="location.href='fupdateForm.jsp?bnum=<%=board.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" onclick="location.href='fdeleteForm.jsp?bnum=<%=board.getBnum()%>'">
			<input type="button" value="목록" onclick="location.href='freeList.jsp?pageNum=<%=pageNum%>'"></td>
		</tr></table>
<table width="300" >
<form action="fRwritePro.jsp?pageNum=<%=pageNum%>" method="post">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re2_level" value="<%=re2_level%>">
	<input type="hidden" name="re2_step" value="<%=re2_step%>">
 	<tr><td class="r">댓글쓰기<input type="text" name=writer value="<%=board.getWriter() %>">
 		<textarea name="content" rows="8" cols="53" ></textarea></td>
	<td><input type = "button" value = "등록" onclick="location.href='fRwritePro.jsp?bnum=<%=board.getBnum()%>'" ></td>
</tr>
</form>
</table>
</body>
</html>