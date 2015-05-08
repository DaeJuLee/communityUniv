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
	
	MaBoardDao mbd = MaBoardDao.getInstance();
	List<MaBoard> listMarket = mbd.list(1, 4);
%>
</head>
<body>

<!-- UI Object -->
<div class="tab_list m1" style="height:112px;">
	<ul>
	<li class="m1"><a href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp"><span>공지사항</span></a>
		<ul>
		<%
			int index = 4;
			for(int i = 0; i <list.size(); i++){
				out.println("<li>›<a href = '../combinePage/homeMainPage.jsp?pgm=../hyun/noticeContent.jsp?bnum="+(index) 
			 	+ "&pageNum=1'>" 
				 + list.get(i).getTitle() + "</a></li>");
				index--;
			}
		%>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../hyun/noticeList.jsp">공지사항 더보기</a></li>
		</ul>
	</li>
	<li class="m2"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp"><span>족보공유</span></a>
		<ul>
		<%
			int index1 = 4;
			for(int i = 0; i <list.size(); i++){
				out.println("<li>›<a href = '../combinePage/homeMainPage.jsp?pgm=../Yu/trace/tContent.jsp?bnum="+(index1) 
			 	+ "&pageNum=1'>" 
				 + list.get(i).getTitle() + "</a></li>");
				index1--;
			}
		%>
		<li class="more">› <a href="../combinePage/homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp">보도자료 더보기</a></li>
		</ul>
	</li>
	<li class="m3"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/free/freeList.jsp"><span>자유게시판</span></a>
		<ul>
		<%
			int index2 = 4;
			for(int i = 0; i <list.size(); i++){
				out.println("<li>›<a href = '../combinePage/homeMainPage.jsp?pgm=../Yu/free/fContent.jsp?bnum="+(index1) 
			 	+ "&pageNum=1'>" 
				 + list.get(i).getTitle() + "</a></li>");
				index2--;
			}
		%>
		</ul>
	</li>
	<li class="m4"><a href="../combinePage/homeMainPage.jsp?pgm=../Yu/market/maList.jsp"><span>장터</span></a>
		<ul>
		<%
			int index3 = 4;
			for(int i = 0; i <list.size(); i++){
				out.println("<li>›<a href = '../combinePage/homeMainPage.jsp?pgm=../Yu/trace/tContent.jsp?bnum="+(index3) 
			 	+ "&pageNum=1'>" 
				 + list.get(i).getTitle() + "</a></li>");
				index3--;
			}
		%>
		</ul>
	</li>
	</ul>
</div>
<!-- //UI Object -->

</body>
</html>