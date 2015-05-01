<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<tr><td>작성자</td><td>날짜</td><td rowspan = "2">버튼 란</td></tr>
<tr><td colspan = "2"> textarea</td></tr>
</table>

<table border = "1">
<tr><td>작성자</td><td>날짜</td><td rowspan = "2">버튼 란</td></tr>
<tr><td colspan = "2"> textarea</td></tr>
</table>

<table border = "1">
<tr><td>작성자</td><td>날짜</td><td rowspan = "2">버튼 란</td></tr>
<tr><td colspan = "2"> textarea</td></tr>
</table>

<table border = "1">

<%

out.println("<tr><td>작성자</td><td>날짜</td><td rowspan = '2'>버튼란</td></tr>");
out.println("<tr><td colspan = '2'>textarea</td></tr>");

%>
<table border = "1">
<%

CounselReplyBoard crboard = new CounselReplyBoard();
/* List<CounselReplyBoard> replyList = new ArrayList<CounselReplyBoard>(); */
CounselBoardDAO cbd = CounselBoardDAO.getInstance();
List<CounselReplyBoard> replyList = cbd.listRippleSelect(1);

for(int i = 0 ; i < replyList.size(); i++){

	int width = replyList.get(i).getRe_level() * 10; 
	
	//두번째 줄

	out.println("<td> 날짜 : " + replyList.get(i).getR_date() + "</td>");
	out.println("<td rowspan = '2'> <input type = 'button' value = '삭제'></td></tr>");
	//두번째 줄
	out.println("<tr><td colspan = '2'>" + replyList.get(i).getContent() + "</td></tr>");
	
	if (replyList.get(i).getRe_level() > 0) {
		out.println("<img src='images/level.gif' width="
				+ width + ">" + "<img src='images/re.gif'>");
	}
	
}

%>
</table>
</table>
</body>
</html>