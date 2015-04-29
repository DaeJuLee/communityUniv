<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지작성</title>
<link rel="stylesheet" type="text/css" href="../common.css">
</head>
<body>
	<div class="columnMain">
		<h2>게시판 글쓰기</h2>
		<%
			int bnum = 0;
			NoticeDao nd = NoticeDao.getInstance();
			Notice notice = nd.select(bnum);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null)
				pageNum = "1";
			String number = request.getParameter("bnum");
			if (number == null || number.equals("")) {
				bnum = 0;
			} else {
				bnum = Integer.parseInt(number);

			}
		%>
		<form action="noticeWritePro.jsp?pageNum=<%=pageNum%>" method="post">
			<input type="hidden" name="bnum" value="<%=bnum%>">
			<div class="contents">
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" required="required"class="intTy" style="width:88%">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=notice.getWriter()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="30" name="content"
								required="required"  style="width:465px; height:100px;"></textarea></td>
					</tr>

					</tbody>
				</table>
				<div class = "btnArea">
				<span class = "btnR">
				<input type="submit" value="확인" class = "btnTy3"> <input type="reset"
					value="다시작성" class = " btnTy2">
					</span>
					</div>
					</div>
		</form>
		</div>
</body>
</html>