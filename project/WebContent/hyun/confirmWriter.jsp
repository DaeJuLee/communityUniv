<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "pro.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writer(nick) check</title>

<%
	String writer = request.getParameter("writer");
%>
	<script type="text/javascript">
		function wincl() {
			opener.document.frm.writer.value="<%=writer%>"; 
			window.close();
		}
	</script>

</head>
<body>

	<%
		MemberDao md = MemberDao.getInstance();
		int result = md.confirmWriter(writer);
		
		if(result==0) {
	%>
		
		<%=writer%>는 사용할 수 있습니다.
		<input type="button" value="닫기" onclick="wincl()">
	
	<%		
		} else {
	%>
		
		<%=writer%>는 이미 있는 닉네임이니 다른 것을 입력하세요.
		<p>
		
		<form>
			닉네임 : <input type="text" name="writer"><p>
			<input type="submit" value="확인">
		</form>	
	<%		
		}
	%>
	
</body>
</html>