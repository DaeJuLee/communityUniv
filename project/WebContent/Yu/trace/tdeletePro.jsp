<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String passwd = request.getParameter("bpass");
	TraBoardDao bd = TraBoardDao.getInstance();
	int result = bd.delete(bnum, passwd);
	if (result > 0) {
		response.sendRedirect("traceList.jsp");
	} else { %>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		location.href="tdeleteForm.jsp?bnum=<%=bnum%>";
	</script>	
<% 	} %>
</body>
</html>