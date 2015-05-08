<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장터게시판 수정</title>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/Yu/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/Yu/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"></script>
</head>
<body>
	<div class="columnMain">
		<h2>장터 글 수정</h2>
		<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		MaBoardDao mbd = MaBoardDao.getInstance();
		MaBoard mboard = mbd.select(bnum);
	%>

		<form action="homeMainPage.jsp?pgm=../Yu/market/mupdatePro.jsp"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="bnum" value="<%=mboard.getBnum()%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">

			<div class="contents">
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th scope="row">번호</th>
						<td><%=mboard.getBnum()%></td>
					</tr>
					<tr>
						<th scope="row">분류</th>
						<td><select name="category">
								<option value="삽니다">[삽니다]</option>
								<option value="팝니다">[팝니다]</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td><input type="text" name="title" required="required"class="intTy" style="width: 88%;" 
							value="<%=mboard.getTitle()%>"></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><input type="hidden"  name="writer" value = "<%=mboard.getWriter()%>"><%=mboard.getWriter()%></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" name="bpass" required="required"class="intTy" style="width: 88%;" 
							value="<%=mboard.getBpass()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" id="textAreaContent"
								name="content" required="required"
								style="width: 600px; height: 100px;"><%=mboard.getContent()%></textarea>
						</td>
					</tr>
					</tbody>
				</table>
		<div class="btnArea">
			<span class="btnR">
					<input type="submit" value="수정완료"
						onclick="submitContents(this.form)" class = "btnTy3">
										<input type="reset" value="다시작성" class="btnTy2">
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
		</div>
		</form>
		</div>
</body>
</html>