<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../memberCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="leftSide.css"/> -->
<script type="text/javascript">
	function chk() {
		if (!frm.id.value) {
			alert("ID 입력하세요");
			frm.id.focus();
			return false;
		}
		if (!frm.pass.value) {
			alert("패스워드를 입력하세요");
			frm.pass.focus();
			return false;
		}
		return true;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 창</h2>

	<div class="mw_login open">

		<div id="login" class="g_login">
			<!-- <a href="#login_anchor" title="로그인 레이어 닫기" class="close">X</a> -->
			<!-- 참고사항 : 레이아웃 x표 만들기 -->
			<form action="leftSidePro.jsp" id="g_login" class="g_login"
				name = "frm" onsubmit="return chk()">
				<fieldset>
					<%
						if((id.equals("not")) || id == "not"){
					%>
					<legend>Login</legend>
					<table>
						<tr>
							<!-- 아이디 입력란 -->
							<td><div class="item">
									<label for="uid" class="i_label"
										style="position: absolute; visibility: visible;"></label> <input
										name="id" type="text" value="" id="uid" class="i_text uid"
										size="10px">
								</div></td>


						
						</tr>
						<tr>
							<!-- 패스워드 입력란 -->
							<td><div class="item">
									<label for="upw" class="i_label"
										style="position: absolute; visibility: visible;"></label> <input
										name="pass" type="password" value="" id="upw"
										class="i_text upw" size="10px">
								</div></td>
									<td colSpan="2"><span class="btn_login"> <input
									type="submit" value="로그인"></span></td>
						</tr>


					</table>

					<p class="keeping">
						<input name="" type="checkbox" value="" id="keepid"
							class="i_check"><label for="keepid">로그인 유지</label>
					</p>

					<ul class="help">
						<li class="first"><a href="homeMainPage.jsp?pgm=../hyun/searchMember.jsp">아이디/비밀번호 찾기</a></li>
						<li><a href="homeMainPage.jsp?pgm=../hyun/memberJoin.jsp">회원 가입</a></li>
					</ul>
					<%}else if(id.equals("admin") || id == "admin"){ %>
					<legend><%=writer %>님 반갑습니다.</legend>
					<ul class="help">
						<li class="first"><a href="homeMainPage.jsp?pgm=../hyun/memberInfo.jsp">마이페이지</a></li>
						<li><a href="homeMainPage.jsp?pgm=../hyun/memberList.jsp">회원관리</a></li>
						<li><a href="../sessionLogout.jsp">로그아웃</a></li>
						<li><input type = "button" onclick = "location.href='../sessionLogout.jsp'"
							value = "로그아웃"></li>
					</ul>
					<% }else{ %>
					<legend><%=writer %>님 반갑습니다.</legend>
					<ul class="help">
						<li class="first"><a href="homeMainPage.jsp?pgm=../hyun/memberInfo.jsp">마이페이지</a></li>
						<li><a href="../sessionLogout.jsp">로그아웃</a></li>
					</ul>
					<%}%>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>