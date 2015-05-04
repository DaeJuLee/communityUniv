<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="homeMainPage.css"
	media="screen" />
<title>대학커뮤니티</title>
</head>
<%
	String contextPath = request.getContextPath();
	String pgm = request.getParameter("pgm");
	if (pgm == null || pgm.equals("")) {
		pgm = "centerMiddle.jsp";
	}
%>
<body>
	<div id="wrap">
		<!-- id wrap 시작 -->

		<div id="header">
			<h1>
				<a href="homeMainPage.jsp">대학커뮤니티</a>
			</h1>
			<h2>Welcome to our community</h2>
		</div>

		<div id="top"></div>
		<div id="contentt">
			<!-- 상단메뉴 -->
			<div id="headermenu">
				<div class="headerm">
					<jsp:include page = "aimportant.jsp"/>
				</div>
			</div>
			<!-- 상단메뉴끝 -->

			<!-- 왼쪽 사이드 메뉴 로그인창 생성-->
			<div class="left">
				<jsp:include page="leftSide.jsp" />
			</div>

			<!-- 왼쪽 사이드 메뉴 끝-->

			<!-- 중앙 센터 내용 시작 (대학 커뮤니티)-->
			<div class="middle">
				<%-- <jsp:include page="centerMiddle.jsp"/> --%>
				<jsp:include page="<%=pgm%>"/></div>
			<!-- 중앙 센터 내용 끝 -->

			<!-- 오른쪽 사이드 메뉴 시작 -->
			<%-- <div class="right">
				<jsp:include page="rightSide.jsp"/>
			</div> --%>

			<!-- 오른쪽 사이드 메뉴 끝 -->

			<div style="clear: both;"></div>

		</div>
		<!-- id wrap 끝 -->

		<!-- bottom제작해야하나??.. 잠시 보류-->
		<div id="bottom"></div>
		<!-- footer는 맨 밑에 있는것... 사업자 번호 등등 -->
		<div id="footer">
			<jsp:include page="footer_j.jsp" />
		</div>
	</div>
</body>
</html>