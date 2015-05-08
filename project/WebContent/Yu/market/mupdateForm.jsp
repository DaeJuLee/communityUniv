<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<style type="text/css">
table {
	width: 80%;
}
</style>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/Yu/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/Yu/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"></script>
</head><body>
	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		MaBoardDao mbd = MaBoardDao.getInstance();
		MaBoard mboard = mbd.select(bnum);
	%>

	<form action="homeMainPage.jsp?pgm=../Yu/market/mupdatePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bnum" value="<%=mboard.getBnum()%>"> 
		<input type="hidden" name="pageNum" value="<%=pageNum%>"> 
		<table>
			<caption>글 수정</caption>
			<tr>
				<td>번호</td>
				<td><%=mboard.getBnum()%></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="category">
			           <option value="[삽니다]">[삽니다]</option>
			           <option value="[팝니다]">[팝니다]</option>
     			  </select>
			</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"
					value="<%=mboard.getTitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=mboard.getWriter()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="bpass" required="required"
					value="<%=mboard.getBpass()%>"></td>
			</tr>
			<tr>
			 <td>내용</td><td>
						<textarea rows="10" cols="80" id="textAreaContent" name="content" required="required"><%=mboard.getContent()%></textarea>
					</td>
			</tr>
			<tr>
				<td ><input type="submit" value="수정완료" onclick="submitContents(this.form)"></td>
			</tr>
		</table>
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
</script></form>
</body>
</html>