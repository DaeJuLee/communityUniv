<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
</head><body>
<%	
	BoardDao bd = BoardDao.getInstance();
	String pageNum = request.getParameter("pageNum");
	int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
	Board board = bd.select(bnum);
	 if (pageNum == null) pageNum = "1";
	if (request.getParameter("bnum") != null) {
		bnum = Integer.parseInt(request.getParameter("bnum"));
		
		ref = board.getRef();
		re2_level = board.getRe2_level();
		re2_step = board.getRe2_step();
	} 
%>
<div align="center"><h2>자유게시판 글쓰기</h2>
<form action="fwritePro.jsp?pageNum=<%=pageNum%>" method="post">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	<%-- <input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re2_level" value="<%=re2_level%>">
	<input type="hidden" name="re2_step" value="<%=re2_step%>"> --%>
<table width="500px" border="1">
	<tr><td>분류 선택</td><td>
	 <select name="category">
           <option value="[맛집]">[맛집]</option>
           <option value="[패션]">[패션]</option>
           <option value="[교수/수업]">[교수/수업]</option>
           <option value="[주거]">[주거]</option>
           <option value="[생활팁]">[생활팁]</option>
           <option value="[기타]">[기타]</option>
       </select>
      <tr><td>제목</td><td>
     <input type="text" size="50" maxlength="50" 
     	name="title"></td>  </tr>  
  <tr><td>작성자</td>
  <td><%=board.getWriter() %></td>
  </tr>
  <tr><td>내 용</td><td>
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
 <tr><td>비밀번호</td><td>
       <input type="password" size="5" maxlength="10" name="bpass"></td>
  </tr>
<tr>      
 <td colspan=2 " align="center"> 
  <input type="submit" value="확인">  
  <input type="reset" value="다시작성">
</td></tr></table></form></div> 
</body></html>

