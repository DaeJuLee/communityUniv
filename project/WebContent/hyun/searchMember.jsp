<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="../common.css"> -->
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
	<div class="columnMain">
		<h2>아이디 찾기</h2>
		<form
			action="../combinePage/homeMainPage.jsp" name="frmSearchId">
			<input type="hidden" name = "pgm" value="../hyun/searchPro.jsp">
			<div class="contents">

				<table class="tbTy1 dataLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>학번</th>
						<td><input type="text" name="snum"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email"></td>
					</tr>
				</table>
				<div class="btnArea">
					<span class="btnR"> <input type="hidden" name="id" value="">
						<input type="submit" value="확인" class="btnTy3"> <input
						type="button" name="idS" class="btnTy2"
						onclick="location.href='../combinePage/homeMainPage.jsp'"
						value="취소">

					</span>
				</div>
			</div>
		</form>
	</div>

	<div class="columnMain">
		<h2>비밀번호 찾기</h2>
		<form action="../combinePage/homeMainPage.jsp" name="frmSearchPw">
		<input type = "hidden" name = "pgm" value="../hyun/searchPro.jsp">
			<div class="contents">

				<table class="tbTy1 dataLeft">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th>id</th>
						<td><input type="text" name="id"></td>
					</tr>

					<tr>
						<th>학번</th>
						<td><input type="text" name="snum"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value=""></td>
					</tr>
				</table>

				<input type="hidden" name="name">
				<div class="btnArea">
					<span class="btnR"> <input type="submit" class="btnTy3"
						value="확인"> <input type="button" name="pwS" class="btnTy2"
						onclick="location.href='../combinePage/homeMainPage.jsp'"
						value="취소">

					</span>
				</div>
			</div>
		</form>
	</div>

</body>
</html>