<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "pro.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writer(nick) check</title>

<%
	int snum = Integer.parseInt(request.getParameter("snum"));
%>
	<script type="text/javascript">
		function wincl() {
			opener.document.frm.snum.value="<%=snum%>"
			window.close();
		}
	</script>

</head>
<body>

	<%
		MemberDao md = MemberDao.getInstance();
		int result = md.confirmSnum(snum);
		
		if(result==0) {
	%>
		
		<%=snum%>는 사용할 수 있습니다.
		<input type="button" value="닫기" onclick="wincl()">
	
	<%		
		} else {
	%>
		
		<%=snum%>는 이미 있는 학번이니 다른 것을 입력하세요.
		<p>
		
		<form>
			닉네임 : <input type="text" name="snum"><p>
			<input type="submit" value="확인">
		</form>	
	<%		
		}
	%>
	
</body>
</html>