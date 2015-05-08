<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "timeTable.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	TimeTableDao ttd = TimeTableDao.getInstance();
	int result = ttd.deleteTable();
	if(result == 1){
%>
	<script type="text/javascript">
		alert("시간표 삭제 완료 했습니다.");
		location.href="../combinePage/homeMainPage.jsp?pgm=../timeTable/timetablehome.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("시간표 삭제 완료 했습니다.");
		location.href="../combinePage/homeMainPage.jsp?pgm=../timeTable/timetablehome.jsp";
	</script>
<%
	}
%>
</body>
</html>