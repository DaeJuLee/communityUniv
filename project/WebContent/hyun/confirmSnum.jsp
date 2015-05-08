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
<!-- 닫기 버튼은 나중에 쌤께 물어봐야함 -->
</head>
<body>

	<%
		MemberDao md = MemberDao.getInstance();
		int result = md.confirmSnum(snum);
		
		if(result==1) {
	%>
		
		<%=snum%>은 가입할 수 있습니다.
		<input type="button" value="닫기" onclick="wincl()">
	
	<%		
		} else {
	%>
		
		<%=snum%>는 이미 가입되어있거나 커뮤니티학생이 아닙니다.
		<p>
		
		<form>
			학번 : <input type="text" name="snum"><p>
			<input type="submit" value="확인">
		</form>	
	<%		
		}
	%>
	
</body>
</html>