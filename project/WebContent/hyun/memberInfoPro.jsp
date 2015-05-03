<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class = "pro.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.update(member);
	if(result>0){ %>
	<script type="text/javascript">
		alert("사용자 정보 수정 완료");
		location.href = "homeMainPage.jsp";
	</script>
	
		<%		
	}else{ %>
		<script type="text/javascript">
			alert("사용자 정보 수정 실패");
			history.back();
		</script>
	
		<%
	}
%>