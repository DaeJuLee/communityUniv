<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pro.*"%>
<%@ include file="../memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
<!-- <link rel="stylesheet" media="all" href="memberJoin.css"> -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post1').value = data.postcode1;
				document.getElementById('post2').value = data.postcode2;
				document.getElementById('addr').value = data.address1;
				document.getElementById('addr3').value = data.address2;
				document.getElementById('jibeon').value = data.relatedAddress;
				document.getElementById('addr2').focus();
			}
		}).open();
	}
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
		Member member = md.select(id);
	%>
	<form action="homeMainPage.jsp?pgm=../hyun/memberInfoPro.jsp"
		method="post" name="frm" onsubmit="return passchk()">

		<%
			if (id.equals("not") || id == "not") {//회원이 아닌경우
		%>
		<script type="text/javascript">
			alert("회원들만 사용할 수 있습니다.");
			location.href = "../combinePage/homeMainPage.jsp";
		</script>

		<%
			} else {
		%>
		<div class="columnMain">
			<h2>회원정보수정</h2>
			<div class="contents">
				<table class="tbTy1 detaLeft" summary="회원정보수정입니다.">
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
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
						<td align="left">
							<div class="item">
								<input type="text" name="post1" id="post1"
									value="<%=member.getPost1()%>"> - <input type="text"
									name="post2" id="post2" value="<%=member.getPost2()%>">
								<input type="button" onclick="openDaumPostcode()"
									value="우편번호 찾기"
									style="width: 100px; height: 20px; font-size: 11px; background-color: #ECECEC"><br>
								<input type="text" name="addr1" id="addr"
									value="<%=member.getAddr()%>" title="행정기본주소" style="width: 49%">
								<input type="text" name="addr2" id="addr2"
									value="<%=member.getAddr2()%>" title="상세주소" style="width: 49%">
								<input type="text" name="addr3" id="addr3"
									value="<%=member.getAddr3()%>" title="참고항목" style="width: 99%">
								<input type="text" name="jibeon" id="jibeon"
									value="<%=member.getJibeon()%>" title="지번주소" style="width: 99%">

							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td><input type="text" name="email" class="i_text"
							value="<%=member.getEmail()%>"></td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="btnArea">
				<span class="btnR"> <input type="submit" value="회원정보수정"
					class="btnTy3"> <input type="reset" value="취소"
					class="btnTy2">
				</span>
			</div>
		</div>
		<%
			}//else 끝 문장
		%>
	</form>
	</div>
</body>
</html>