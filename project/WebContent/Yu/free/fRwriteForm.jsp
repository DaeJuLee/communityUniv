<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>

</head><body>
<%	
	BoardDao bd = BoardDao.getInstance();
	int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
	Board board = bd.select(bnum);
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) pageNum = "1";
	if (request.getParameter("bnum") != null) {
		bnum = Integer.parseInt(request.getParameter("bnum"));
		
		ref = board.getRef();
		re2_level = board.getRe2_level();
		re2_step = board.getRe2_step();
	}
%>
<div align="center">
<form action="fRwritePro.jsp?pageNum=<%=pageNum%>" method="post">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re2_level" value="<%=re2_level%>">
	<input type="hidden" name="re2_step" value="<%=re2_step%>">
<table width="300" >
  <tr><td>작성자</td>
  <td><%=board.getWriter() %></td>
  <td>내 용</td><td>
     <textarea name="content" rows="5" cols="10"></textarea></td>
  </tr>
<tr>      
 <td colspan=2 " align="left"> 
  <input type="submit" value="확인">  
  <input type="reset" value="다시작성">
</td></tr></table></form></div> 
</body></html>

