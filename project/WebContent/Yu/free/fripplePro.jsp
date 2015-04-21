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
	BoardDao bd = BoardDao.getInstance();
	board.setHits(0);
	board.setIp(request.getRemoteAddr());
	int result = bd.insert(board);
	if (result > 0) {
%>
	<script type="text/javascript">
		alert("입력 완료");  location.href = "fContent.jsp?pageNum="+<%=pageNum%>;
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("ㅠㅜㅜ다시");  
		location.href="fwriteForm.jsp?bnum=<%=board.getBnum()%>&pageNum=<%=pageNum%>";
	</script>
<% } %>
</body>
</html>