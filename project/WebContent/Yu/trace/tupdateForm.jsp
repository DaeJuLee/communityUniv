<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
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
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		TraBoardDao bd = TraBoardDao.getInstance();
		TraBoard tboard = bd.select(bnum);
	%>
<form action="tupdatePro.jsp" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<input type="hidden" name="bnum" value="<%=tboard.getBnum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table border="1">
			<caption>
				글 수정
			</caption>
			<tr>
				<td>번호</td>
				<td><%=tboard.getBnum()%></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="category">
			          <option value="[교양]">[교양]</option>
         			  <option value="[전공]">[전공]</option>
          			  <option value="[기타]">[기타]</option>
     			  </select>
			</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required" placeholder="년도/학기/수업명/교수이름/(중간/기말)"
					value="<%=tboard.getTitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=tboard.getWriter()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="bpass" required="required"
					value="<%=tboard.getBpass()%>"></td>
			</tr>
			<tr><td>파일첨부
				<input type="file" name="file" id="file"/>
			</td>
            </tr>
			<tr>
				<td>내용</td>
				<td>
						<textarea rows="10" cols="40"  name="content" required="required"><%=tboard.getContent()%></textarea>
					</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>