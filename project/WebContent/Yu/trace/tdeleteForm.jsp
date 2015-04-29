<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	String bnum = request.getParameter("bnum");
%>
<h2>*삭제하려면 비밀번호를 입력하세요*</h2>
<form action="tdeletePro.jsp?">
	<input type="hidden" name="bnum" value="<%=bnum%>">
	비밀번호 : <input type="password" name="bpass"><p>
	<input type="submit" value="확인">
</form>
</body>
</html>