<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 글쓰기</title>

<!-- <link rel="stylesheet" type="text/css" href="../../common.css"> -->

</head>
<body>

	<div class="columnMain">
		<h2>고민상담 글쓰기</h2>

		<%
			int bnum = 0, ref = 0, re_level = 0, re_step = 0;
			String writer = request.getParameter("writer");
			String pageNum = request.getParameter("pageNum");

			if (pageNum == null)
				pageNum = "1";

			if (request.getParameter("bnum") != null) {
				bnum = Integer.parseInt(request.getParameter("bnum"));
				CounselBoardDAO cbd = CounselBoardDAO.getInstance();
				CounselBoard cboard = cbd.select(bnum);
				ref = cboard.getRef();
				re_level = cboard.getRe_level();
				re_step = cboard.getRe_step();
			}
		%>
		<form
			action="homeMainPage.jsp?pgm=../jinju/Counsel/counselWritePro.jsp?pageNum=<%=pageNum%>"
			method="post">
			<input type="hidden" name="bnum" value="<%=bnum%>"> <input
				type="hidden" name="ref" value="<%=ref%>"> <input
				type="hidden" name="re_level" value="<%=re_level%>"> <input
				type="hidden" name="re_step" value="<%=re_step%>">

			<div class="contents">
				<table class="tbTy1 detaLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>

					<tr>
						<th>분류 선택</th>
						<td><select name="category" class="intTy" style="width: 88%;">
								<option value="군대">[군대]</option>
								<option value="연애">[연애]</option>
								<option value="진로">[진로]</option>
								<option value="친구">[친구]</option>
								<option value="학업">[학업]</option>
								<option value="기타">[기타]</option>
						</select></td>
					<tr>
						<th scope="row">제목</th>
						<td>
							<%
								if (bnum > 0) {
							%> <input type="text" name="title" value="[답변] "
							required="required" class="intTy" style="width: 88%;"> <%
 	} else {
 %> <input type="text" name="title" required="required"
							class="intTy" style="width: 88%;"> <%
 	}
 %>
						</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><input type="hidden" name="writer" value="<%=writer%>"><%=writer%></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" name="bpass" required="required"
							class="intTy" style="width: 88%;"></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><textarea rows="10" cols="30" name="content"
								required="required" style="width: 465px; height: 100px;"></textarea></td>
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
