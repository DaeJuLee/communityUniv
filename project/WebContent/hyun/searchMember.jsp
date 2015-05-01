<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
<form action ="searchPro.jsp" name = "frmSearchId">
아이디 찾기<p>
이름 : <input type = "text" name = "name"><br>
학번 : <input type = "text" name = "snum"><br>
이메일 : <input type = "text" name = "email"><p>
<input type = "hidden" name = "id" value = "">
<input type = "submit" value="확인">
<input type = "button" name = "idS" onclick = "location.href='../conbinePage/homeMainPage.jsp'" value="취소">
</form> 
<form action ="searchPro.jsp" name = "frmSearchPw">
비밀번호 찾기<p>
id : <input type = "text" name = "id"><br>
학번 : <input type = "text" name = "snum"><br>
이메일 : <input type = "text" name = "email" value = ""><p>
<input type = "hidden" name = "name">
<input type = "submit" value="확인">
<input type = "button" name = "pwS" onclick = "location.href='../conbinePage/homeMainPage.jsp'" value="취소">
</form> 
</body>
</html>