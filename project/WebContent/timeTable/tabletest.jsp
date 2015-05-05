<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">

		<tr>
			<th>test1</th>
			<th>test2</th>
			<th>test3</th>
			<th>test4</th>
		</tr>
		<%
			out.println("<tr><td colspan = '4'>");
			out.println("<select multiple = 'multiple' size = '5'>");
			out.println("<option>조회된 데이터가 없습니다....</option>");
			//out.println("<table><tr><td colspan = '4'>조회된 데이터가 없습니다....</td></tr></table>");
			out.println("</select>");
			out.println("</td></tr>");

			out.println();
		%>
	</table>

	<table border = "1">
		<tr>
			<th>시간표</th>
			<th>test2</th>
			<th>test3</th>
			<th>test4</th>
			<th>test5</th>
			<th>test6</th>
			<th>test7</th>
		</tr>
		<%
			for (int i = 1; i < 10; i++) {
				out.println("<tr><td>" + i + "교시</td>");
				out.println("<td></td><td></td><td></td><td></td><td></td><td></td>");
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>