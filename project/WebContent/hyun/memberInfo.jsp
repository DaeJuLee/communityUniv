<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<%@ include file="memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
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
</script>
</head>
<body>
	<%
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
	%>
	<form action="memberInfoPro.jsp" method="post" name="frm"
		onsubmit="return passchk()">
		<fieldset>
			<legend>회원정보수정</legend>
			<div class="form_table">
				<table border="1" cellspacing="0" summary="회원정보수정입니다.">
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<div class="item"><%=member.getId()%>
									<input type="hidden" name="id" class="i_text"
										value="<%=member.getId()%>">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">학번</th>
							<td>
								<div class="item"><%=member.getSnum()%>
									<input type="hidden" name="snum" class="i_text"
										value="<%=member.getSnum()%>">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">별명</th>
							<td>
								<div class="item"><%=member.getWriter()%>
									<input type="hidden" name="writer" class="i_text"
										value="<%=member.getWriter()%>">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>
								<div class="item"><%=member.getName()%>
									<input type="hidden" name="name" class="i_text"
										value="<%=member.getName()%>">
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
							<th scope="row">전공</th>
							<td>
								<div class="item"><%=member.getMajor()%>
									<input type="hidden" name="major" class="i_text"
										value="<%=member.getMajor()%>">
								</div>
							</td>
						</tr>
						<tr>
						<tr>
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
									<input type="text" name="email" class="i_text"
										value="<%=member.getEmail()%>">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div align="center">
				<input type="submit" value="회원정보수정"> <input type="reset"
					value="취소">
			</div>
		</fieldset>
	</form>
</body>
</html>