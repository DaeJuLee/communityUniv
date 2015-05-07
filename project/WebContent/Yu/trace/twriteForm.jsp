<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>족보게시판 글작성</title>
</head>
<body>
	<div class="columnMain">
		<h2>족보게시판 글쓰기</h2>
		<%
			TraBoardDao bd = TraBoardDao.getInstance();
			String pageNum = request.getParameter("pageNum");
			String fileName = request.getParameter("fileName");
			int bnum = 0, ref = 0, re2_level = 0, re2_step = 0;
			TraBoard tboard = bd.select(bnum);
			if (pageNum == null)
				pageNum = "1";
			if (request.getParameter("bnum") != null) {
				bnum = Integer.parseInt(request.getParameter("bnum"));

				ref = tboard.getRef();
				re2_level = tboard.getRe2_level();
				re2_step = tboard.getRe2_step();
			}
		%>

		<form action="homeMainPage.jsp?pgm=../Yu/trace/twritePro.jsp"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="<%=writer%>"> <input
				type="hidden" name="bnum" value="<%=bnum%>"> <input
				type="hidden" name="pageNum" value="<%=pageNum%>">
			<div class="contents">
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th scope="row">분류 선택</th>
						<td><select name="category">
								<option value="교양">[교양]</option>
								<option value="전공">[전공]</option>
								<option value="기타">[기타]</option>
						</select>
					<tr>
						<th scope="row">제목</th>
						<td><input type="text" maxlength="50" name="title" class = "intTy" style = "width: 88%;"
							placeholder="년도/학기/수업명/교수이름/(중간/기말)"></td>
					</tr>


					<tr>
						<th scope="row">작성자</th>
						<td><%=writer%><input type="hidden" name="writer"
							value="<%=writer%>"></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" maxlength="10" class = "intTy" style = "width: 88%;"
							name="bpass"></td>
					</tr>
					<tr>
						<th scope="row">파일첨부</th>
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<th scope="row">내 용</th>
						<td><textarea name="content" rows="10" cols="30"
								style="width: 465px; height: 100px;"></textarea></td>
					</tr>
					</tbody>
				</table>
				<div class="btnArea">
					<span class="btnR"> <input type="submit" value="확인"
						class="btnTy3"> <input type="reset" value="다시작성"
						class="btnTy2">
					</span>
				</div>
			</div>
		</form>

	</div>
</body>
</html>

