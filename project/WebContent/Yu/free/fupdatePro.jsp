<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="project.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String pageNum = request.getParameter("pageNum");
	board.setIp(request.getRemoteAddr());
	BoardDao bd = BoardDao.getInstance();
	int result = bd.update(board);
	if (result > 0) {%>
	<script type="text/javascript">
	alert("수정이 완료 되었습니다.");
	location.href="homeMainPage.jsp?pgm=../Yu/free/freeList.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("안됨...");
		history.go(-1);
	</script>
<% } %>
</body>
</html>