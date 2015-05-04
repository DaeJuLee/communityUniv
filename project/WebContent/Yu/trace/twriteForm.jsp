<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
<script type="text/javascript">
function chk() {
	if (frm.file.value == null || frm.file.value == '') {
		alert("반드시 파일을 첨부하세요!"); 
		frm.file.focus();
		return false;		
		}
	return true;
}
</script>
</head><body>
<%	
	
	TraBoardDao bd = TraBoardDao.getInstance();
	String pageNum = request.getParameter("pageNum");
	String fileName = request.getParameter("fileName");
	int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
	TraBoard tboard = bd.select(bnum);
	 if (pageNum == null) pageNum = "1";
	if (request.getParameter("bnum") != null) {
		bnum = Integer.parseInt(request.getParameter("bnum"));
		
		ref = tboard.getRef();
		re2_level = tboard.getRe2_level();
		re2_step = tboard.getRe2_step();
	} 
%>
<div align="center"><h2>족보게시판 글쓰기</h2>
<form action="twritePro.jsp" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table  border="1">
	<tr><td>분류 선택</td><td>
	 <select name="category">
           <option value="[교양]">[교양]</option>
           <option value="[전공]">[전공]</option>
           <option value="[기타]">[기타]</option>
       </select>
      <tr><td>제목</td><td>
     <input type="text" size="50" maxlength="50" name="title" 
     			placeholder="년도/학기/수업명/교수이름/(중간/기말)"></td>  </tr>  
  <tr><td>작성자</td>
  <td><%=tboard.getWriter() %><input type="hidden" name="writer" value="<%=tboard.getWriter() %>"> </td>
  </tr>
 <tr><td>파일첨부</td>
		<td><input type="file" name="file" id="file"></td>
  </tr>
  <tr><td>내 용</td>
  <td><textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
 <tr><td>비밀번호</td><td>
       <input type="password" size="5" maxlength="10" name="bpass"></td>
  </tr>
<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" value="확인">  
  <input type="reset" value="다시작성">
</td></tr></table>
</form></div> 
</body></html>

