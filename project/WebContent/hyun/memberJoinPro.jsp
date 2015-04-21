<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinPro</title>
</head>
<body>
<jsp:useBean id="member" class="pro.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);
	if(result>0){
	%>
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다");
		location.href="loginForm.jsp" //메인 페이지 주소로 바꾸세요.
	</script>
	<%
	out.println("입력 성공");
	}else{%>
		<script type="text/javascript">
			alert("회원가입에 실패하였습니다.");
			location.href="memberJoin.jsp";
		</script>
	<%
	}
%>
</body>
</html>