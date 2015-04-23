<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="leftSide.css"/> -->
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 창</h2>

	<div class="mw_login open">

		<div id="login" class="g_login">
			<!-- <a href="#login_anchor" title="로그인 레이어 닫기" class="close">X</a> -->
			<!-- 참고사항 : 레이아웃 x표 만들기 -->
			<form action="" id="g_login" class="g_login">
				<fieldset>
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


							<td colSpan="2"><span class="btn_login">
							<input type="submit" value="로그인"></span></td>
						</tr>
						<tr>
						<!-- 패스워드 입력란 -->
							<td><div class="item">
									<label for="upw" class="i_label"
										style="position: absolute; visibility: visible;"></label> <input
										name="pass" type="password" value="" id="upw"
										class="i_text upw" size="10px">
								</div></td>
						</tr>


					</table>

					<p class="keeping">
						<input name="" type="checkbox" value="" id="keepid"
							class="i_check"><label for="keepid">로그인 유지</label>
					</p>



					<ul class="help">
						<li class="first"><a href="#">아이디/비밀번호 찾기</a></li>
						<li><a href="../hyun/memberJoin.jsp">회원 가입</a></li>
					</ul>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>