<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="miniproject_jj.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 수정</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

</head>
<body>

	<div class="columnMain">
	<h2>고민상담 글 수정</h2>

	<%
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		CounselBoard cboard = cbd.select(bnum);
	%>
	<form action="counselUpdatePro.jsp" method="post">
		<input type="hidden" name="bnum" value="<%=cboard.getBnum()%>">
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
				<td><%=cboard.getBnum()%></td>
			</tr>
			<tr>
				<th scope="row">분류</th>
				<td><select name="category" class="intTy" style="width:88%;">
			           <option value="군대">[군대]</option>
			           <option value="연애">[연애]</option>
			           <option value="진로">[진로]</option>
			           <option value="친구">[친구]</option>
			           <option value="학업">[학업]</option>
			           <option value="기타">[기타]</option>
     			  </select>
			</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="title" required="required" class="intTy" style="width:88%;" value="<%=cboard.getTitle()%>"></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td><input type="text" name="writer" required="required" class="intTy" style="width:88%;" value="<%=cboard.getWriter()%>"></td>
			</tr>
			<tr>
				<th scope="row">암호</th>
				<td><input type="password" name="bpass" required="required" class="intTy" style="width:88%;" value="<%=cboard.getBpass()%>"></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea rows="10" cols="40" name="content" required="required"  style="width:465px; height:100px;"><%=cboard.getContent()%></textarea>
				</td>
			</tr>

			</tbody>
		</table>
		
		<div class="btnArea">
			<span class="btnR">
				<input type="submit" value="수정완료" class="btnTy3">
				<input type="reset" value="다시작성" class="btnTy2">
			</span>
		</div>
		
		</div>
	</form>

	</div>

</body>
</html>