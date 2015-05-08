<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장터 글작성</title>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/Yu/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/Yu/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"></script>
</head>
<body>

	<div class="columnMain">
		<h2>장터 글쓰기</h2>
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
		<form action="homeMainPage.jsp?pgm=../Yu/market/mwritePro.jsp"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="bnum" value="<%=bnum%>"> <input
				type="hidden" name="pageNum" value="<%=pageNum%>">
			<table class="tbTy1 detaLeft">
				<tbody>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th scope="row">분류</th>
					<td><select name="category">
							<option value="삽니다">[삽니다]</option>
							<option value="팝니다">[팝니다]</option>
					</select>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" size="50" maxlength="50" name="title"></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><input type="hidden" name="writer" value="<%=writer %>"><%=writer %></td>
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="password" size="5" maxlength="10"
						name="bpass"></td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td><textarea id="textAreaContent"
							rows="10" cols="30"name="content"  style="width:465px; height:100px;"></textarea></td>
				</tr>
</table>
		<div class="btnArea">
			<span class="btnR">
					<input type="submit" value="확인"
						onclick="submitContents(this.form)" class = "btnTy3"> <input type="reset"
						value="다시작성" class = "btnTy2">
						</span>
						</div>
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
	var sHTML = '<img src="<%=request.getContextPath()%>/Yu/se2/images/'	+ filepath + '">';
					oEditors.getById["textAreaContent"].exec("PASTE_HTML",
							[ sHTML ]);
				}
			</script>
		</form>
	</div>
</body>
</html>

