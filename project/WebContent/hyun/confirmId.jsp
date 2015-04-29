<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "pro.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id check</title>

<%
	String id = request.getParameter("id");
%>
	<script type="text/javascript">
		function wincl() {
			opener.document.frm.id.value="<%=id%>"; /* Form name을 frm으로 바꾸세요 */
			window.close();
		}
	</script>

</head>
<body>

	<%
		MemberDao md = MemberDao.getInstance();
		int result = md.confirmId(id); /* MemcerDAO에서의 이름을 id, writer, snum별로 다르게 함 */
		
		if(result==0) {
	%>
		
		<%=id%>는 사용할 수 있습니다.
		<input type="button" value="닫기" onclick="wincl()">
	
	<%		
		} else {
	%>
		
		<%=id%>는 이미 있는 아이디입니다. 다른 아이디를 입력하세요.
		<p>
		
		<form>
			아이디 : <input type="text" name="id"><p>
			<input type="submit" value="확인">
		</form>	
	<%		
		}
	%>
	
</body>
</html>