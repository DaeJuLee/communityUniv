<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<%@ include file="../../memberCheck.jsp"%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
<style type="text/css">
table {
	width: 80%;
}
</style>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/Yu/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/Yu/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"></script>
</head><body>
<%	
	MaBoardDao mbd = MaBoardDao.getInstance();
	String pageNum = request.getParameter("pageNum");
	int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
	MaBoard mboard = mbd.select(bnum);
	 if (pageNum == null) pageNum = "1";
	if (request.getParameter("bnum") != null) {
		bnum = Integer.parseInt(request.getParameter("bnum"));
		
		ref = mboard.getRef();
		re2_level = mboard.getRe2_level();
		re2_step = mboard.getRe2_step();
	} 
%>
<div><h2>장터게시판 글쓰기</h2>
<form action="homeMainPage.jsp?pgm=../Yu/market/mwritePro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	<input type="hidden" name="pageNum" value = "<%=pageNum%>"> 
<table>
	<tr><td>분류 선택</td><td>
	 <select name="category">
           <option value="[삽니다]">[삽니다]</option>
		   <option value="[팝니다]">[팝니다]</option>
       </select>
      <tr><td>제목</td><td>
     <input type="text" size="50" maxlength="50" name="title"></td>  </tr>  
  <tr><td>작성자</td>
  <td><input type = "hidden"  name = "writer"  value="<%=writer %>"><%=writer %></td>
  </tr>
  <tr>
   <td>내용</td><td>
      <textarea style="width: 100%;" id="textAreaContent" cols="80" rows="10" name="content"></textarea></td>
  </tr>
 <tr><td>비밀번호</td><td>
       <input type="password" size="5" maxlength="10" name="bpass"></td>
  </tr>
<tr>      
 <td> 
  <input type="submit" value="확인" onclick="submitContents(this.form)">  
  <input type="reset" value="다시작성">
</td></tr></table>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "textAreaContent",
	    sSkinURI: "<%=request.getContextPath()%>/Yu/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});

function submitContents(elClickedObj) {
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
    try {
        elClickedObj.form.submit();
    } catch(e) {
    	
    }
}

function pasteHTML(filepath){
	var sHTML = '<img src="<%=request.getContextPath()%>/Yu/se2/images/'+filepath+'">';
    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]); 
}
</script></form></div> 
</body></html>

