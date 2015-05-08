<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<script type="text/javascript">
function chk(){
	if(frm.file.value == null || frm.file.value == ''){
		alert("반드시 파일을 첨부해주세요!!");
		frm.file.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div class="columnMain">
		<h2>족보게시판 수정</h2>
		<%
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			TraBoardDao bd = TraBoardDao.getInstance();
			TraBoard tboard = bd.select(bnum);
		%>
		<form action="homeMainPage.jsp?pgm=../Yu/trace/tupdatePro.jsp"
			method="post" enctype="multipart/form-data" name = "frm" onsubmit = "return chk()">
			<input type="hidden" name="bnum" value="<%=tboard.getBnum()%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<table class="tbTy1 detaLeft">
				<tbody>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th scope="row">번호</th>
					<td><%=tboard.getBnum()%></td>
				</tr>
				<tr>
					<th scope="row">분류</th>
					<td><select name="category">
							<option value="교양">[교양]</option>
							<option value="전공">[전공]</option>
							<option value="기타">[기타]</option>
					</select></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" name="title" required="required"
						placeholder="년도/학기/수업명/교수이름/(중간/기말)"
						value="<%=tboard.getTitle()%>"></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td><%=tboard.getWriter()%></td>
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="password" name="bpass" required="required"
						value="<%=tboard.getBpass()%>"></td>
				</tr>
				<tr>
					<th scope="row">파일첨부</th>
					<td><input type="file" name="file" id="file" /></td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td><textarea rows="10" cols="40" name="content"
							required="required"><%=tboard.getContent()%></textarea></td>
				</tr>
			</table>
			<div class="btnArea">
				<span class="btnR"> <input type="submit" value="수정완료"
					class="btnTy3"> <input type="reset" value="수정완료"
					class="btnTy2">
				</span>
			</div>
		</form>
	</div>
</body>
</html>