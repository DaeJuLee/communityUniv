<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" media="all" href="memberJoin.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	jQuery(function() {
		// Help Toggle
		$('.item>.i_help').click(function() {
			$(this).parent('.item').find('.i_dsc').toggleClass('hide');
		});
		// Input Clear
		var i_text = $('.item>.i_label').next('.i_text');
		$('.item>.i_label').css('position', 'absolute');
		i_text.focus(function() {
			$(this).prev('.i_label').css('visibility', 'hidden');
		}).blur(function() {
			if ($(this).val() == '') {
				$(this).prev('.i_label').css('visibility', 'visible');
			} else {
				$(this).prev('.i_label').css('visibility', 'hidden');
			}
		}).change(function() {
			if ($(this).val() == '') {
				$(this).prev('.i_label').css('visibility', 'visible');
			} else {
				$(this).prev('.i_label').css('visibility', 'hidden');
			}
		}).blur();
	});

	function passchk() {
		if (frm.pass.value != frm.passch.value) {
			alert("비번이 일치하지 않습니다.");
			frm.passch.focus();
			return false;
		}
		return true;
	}

	function openWini(id) {
		if (id == "") {
			alert("아이디를 입력하세요.");
			document.frm.id.focus();
			return false;
		}
		url = "confirmId.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}

	function openWins(snum) {
		if (snum == "") {
			alert("학번을 입력하세요.");
			document.frm.snum.focus();
			return false;
		}
		url = "confirmSnum.jsp?snum=" + snum;
		window.open(url, "SnumCheck", "width=300,height=150");
	}

	function openWinn(writer) {
		if (writer == "") {
			alert("별명을 입력하세요.");
			document.frm.writer.focus();
			return false;
		}
		url = "confirmWriter.jsp?writer=" + writer;
		window.open(url, "writerCheck", "width=300,height=150");
	}
</script>

</head>
<body>

	<form action="memberJoinPro.jsp" method="post" name="frm"
		onsubmit="return passchk()">
		<fieldset>
			<legend>회원가입</legend>
			<div class="form_table">
				<table border="1" cellspacing="0" summary="회원가입입니다.">
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<div class="item">
									<input type="text" name="id" class="i_text"> <input
										type="button" value="중복확인"
										onclick="openWini(this.form.id.value)">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">학번</th>
							<td>
								<div class="item">
									<input type="text" name="snum" class="i_text"> <input
										type="button" value="중복확인"
										onclick="openWins(this.form.snum.value)">
								</div>

							</td>
						</tr>
						<tr>
							<th scope="row">별명</th>
							<td>
								<div class="item">
									<input type="text" name="writer" class="i_text"> <input
										type="button" value="중복확인"
										onclick="openWinn(this.form.writer.value)">
								</div>

							</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>
								<div class="item">
									<input type="text" name="name" class="i_text">
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row">비밀번호</th>
							<td>
								<div class="item">
									<input type="password" name="pass" class="i_text">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 재확인</th>
							<td>
								<div class="item">
									<input type="password" name="passch" class="i_text">
									<p class="i_dsc">위에 입력한 비밀번호와 일치하게 입력하세요</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">전공선택</th>
							<td>
								<div class="item">
									<select name="major">
										<option value="수학과">수학과</option>
										<option value="화학과">화학과</option>
										<option value="물리학과">물리학과</option>
										<option value="의류학과">의류학과</option>
										<option value="식품영양학과">식품영양학과</option>
										<option value="컴퓨터공학과">컴퓨터공학과</option>
										<option value="생명공학과">생명공학과</option>
										<option value="홍보광고학과">홍보광고학과</option>
										<option value="영어영문학과">영어영문학과</option>
										<option value="경영학과">경영학과</option>
										<option value="경제학과">경제학과</option>
										<option value="약학과">약학과</option>
										<option value="통계학과">통계학과</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">학적상태</th>
							<td>
								<div class="item">
									<select name="statement">
										<option value="0">재학생</option>
										<option value="1">휴학생</option>
										<option value="2">졸업생</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>

							<!-- 주소 받는 곳입니다..... -->
							<th scope="row">주소</th>
							<td>
								<div class="item">
									<jsp:include page="post.jsp"></jsp:include>

								</div>
							</td>
						</tr>

						<tr>
							<th scope="row">이메일</th>
							<td>
								<div class="item">
									<input type="text" name="email" class="i_text">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div align="center">
				<input type="submit" value="회원가입"> <input type="reset"
					value="취소">
			</div>
		</fieldset>
	</form>

</body>
</html>