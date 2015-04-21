<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고민상담 리플 Form</title>

</head>
<body>

<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>
	<jsp:useBean id="cboard" class="miniproject_jj.CounselBoard" scope="request" />
	<jsp:setProperty property="*" name="cboard" />

	<form name="reply_form" action="counselRePro.jsp">
	
	    <input type="hidden" name="bnum">
	    <input type="hidden" name="writer">
	
	    <font>내용</font>
		<font><textarea name="content" required="required"></textarea></font>
	
		<a><input type="submit" value = "확인" onclick="QnARePro.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'"></a>
		<a><input type="submit" value = "수정" onclick="QnARePro.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'"></a>
		<a><input type="submit" value = "삭제" onclick="QnARePro.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'"></a>
	</form>

</body>
</html>