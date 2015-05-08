<%@page import="pro.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.Notice"%>
<%@page import="pro.NoticeDao"%>
<%@page import="project.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="tabmenu.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
jQuery(function($){
	var tab = $('.tab_list');
	tab.removeClass('js_off');
	tab.css('height', tab.find('>ul>li>ul:visible').height()+40);
	function onSelectTab(){
		var t = $(this);
		var myClass = t.parent('li').attr('class');
		t.parents('.tab_list:first').attr('class', 'tab_list '+myClass);
		tab.css('height', t.next('ul').height()+40);
	}
	tab.find('>ul>li>a').click(onSelectTab).focus(onSelectTab);
});
</script>
<%
	NoticeDao nd = NoticeDao.getInstance();
	List<Notice> list = nd.list(1, 4);
	TraBoardDao tbd = TraBoardDao.getInstance();
	List<TraBoard> listTra = tbd.list(1, 4);
	BoardDao fbd = BoardDao.getInstance();
	List<Board> listFree = fbd.list(1, 4);
%>
</head>
<body>

<!-- UI Object -->
<div class="tab_list m1" style="height:112px;">
	<ul>
	<li class="m1"><a href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp"><span>공지사항</span></a>
		<ul>
		<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
		<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
		<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp">공지사항 더보기</a></li>
		</ul>
	</li>
	<li class="m2"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp"><span>족보공유</span></a>
		<ul>
		<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp">보도자료 더보기</a></li>
		</ul>
	</li>
	<li class="m3"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/free/freeList.jsp"><span>자유게시판</span></a>
		<ul>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../Yu/free/freeList.jsp">해명자료 더보기</a></li>
		</ul>
	</li>
	<li class="m4"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/market/maList.jsp"><span>장터</span></a>
		<ul>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../Yu/market/maList.jsp">해명자료 더보기</a></li>
		</ul>
	</li>
	</ul>
</div>
<!-- //UI Object -->

</body>
</html>