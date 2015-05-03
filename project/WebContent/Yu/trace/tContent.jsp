<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>
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
	request.setCharacterEncoding("utf-8");
	String fileName=request.getParameter("fileName");
	TraBoardDao bd = TraBoardDao.getInstance();
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String pageNum = request.getParameter("pageNum");
	int  ref = 0, re2_level = 0, re2_step = 0;
	bd.hits(bnum);
	TraBoard tboard = bd.select(bnum);
	if (pageNum == null) pageNum = "1";
	if ( bnum != 0) {		
		ref = tboard.getRef();
		re2_level = tboard.getRe2_level();
		re2_step = tboard.getRe2_step();
	}
%>
	<h2>족보게시판 상세내역</h2>
	<table>
		<tr>
			<td colspan="2" class="jiin">No.<%=tboard.getBnum() + "&nbsp" + "&nbsp" + 
						tboard.getCategory()+ "&nbsp" + tboard.getTitle()%></td>
		</tr>
		<tr>
			<td class="yu"><%=tboard.getWriter()%></td>
			<td class="nn">작성일:<%=tboard.getS_date() +"&nbsp&nbsp&nbsp"+ "조회수: "
					+ tboard.getHits()%></td>
		</tr>
		<tr>
			<td>
					첨부파일:<a href="filedown.jsp?fileName=<%=fileName %>"><%=fileName %></a>
			</td></tr>
		<tr>	
			<td colspan="2" height="500px" valign="top"><%=tboard.getContent()%></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="수정" onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/tupdateForm.jsp?bnum=<%=tboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/tdeleteForm.jsp?bnum=<%=tboard.getBnum()%>'">
			<input type="button" value="목록" onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp?pageNum=<%=pageNum%>'"></td>
		</tr></table>
</body>
</html>