<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="homeMainPage.css" media="screen" />

<title>대학커뮤니티</title>
</head>
<body>
<div id="wrap"><!-- id wrap 시작 -->

<div id="header">
<h1><a href="#">대학커뮤니티</a></h1>
<h2>Welcome to our community</h2>
</div>

<div id="top"> </div>
<div id="contentt">
<!-- 상단메뉴 -->
<div id="headermenu"> 
<div class="headerm">
<ul>
<li><a href="../hyun/noticeList.jsp">공지사항</a></li> 
<li><a href="#">족보공유</a></li> 
<li><a href="../Yu/free/freeList.jsp">자유게시판</a></li> 
<li><a href="../jinju/Counsel/counselList.jsp">고민상담</a></li>
<li><a href="#">장  터</a></li>
<li><a href="#">시간표제작</a></li> 
<li><a href="../jinju/QnA/QnAList.jsp">Q&A</a></li> 
<li><a href="../hyun/memberInfo.jsp">myPage</a></li> 
</ul>
</div>
</div>
<!-- 상단메뉴끝 -->

<!-- 왼쪽 사이드 메뉴 로그인창 생성-->
<div class="left">
<jsp:include page="leftSide.jsp"/>
</div>

<!-- 왼쪽 사이드 메뉴 끝-->

<!-- 중앙 센터 내용 시작 (대학 커뮤니티)-->
<div class="middle">
<jsp:include page="centerMiddle.jsp"/>
<%-- <jsp:include page="centerMiddleAd.jsp"/> --%>
</div>
<!-- 중앙 센터 내용 끝 -->

<!-- 오른쪽 사이드 메뉴 시작 -->
<div class="right">
<jsp:include page="rightSide.jsp"/>
</div>

<!-- 오른쪽 사이드 메뉴 끝 -->

<div style="clear: both;"> </div>

</div> <!-- id wrap 끝 -->

<!-- bottom제작해야하나??.. 잠시 보류-->
<div id="bottom"> </div>
<!-- footer는 맨 밑에 있는것... 사업자 번호 등등 -->
<div id="footer">
<jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>