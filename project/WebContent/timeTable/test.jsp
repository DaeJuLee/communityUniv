<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
%>
<table>
<%-- <tr>
	<td><jsp:include page = "timeTableMain.jsp">
		<jsp:param value="0" name="sname"/>
		<jsp:param value="0" name="scategory"/>
		</jsp:include>
	</td>
</tr> 
<tr>
	<td>
		<jsp:include page = "timeTable.jsp">
		
		</jsp:include>
	</td>
</tr> --%>

<tr>
	<td>
		<jsp:include page = "timeTableMain.jsp">
			<jsp:param value = "0" name = "sname"/>
			<jsp:param value = "0" name = "scategory"/>
			<jsp:param value = "0" name = "subjectList"/>
		</jsp:include>
	</td>
</tr>

<tr>
	<td>
		<jsp:include page = "timeTable.jsp"/>
		
	</td>
</tr>
</table>
</body>
</html>