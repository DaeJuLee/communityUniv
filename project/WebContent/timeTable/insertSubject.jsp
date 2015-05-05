<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
/* 모든 컬럼이 varchar형이므로 String으로 넣었다. */
	String scode = "";
	String sname = "";
	String stime = "";
	String pcode = "";
	String scategory = "";
	int result = 0;
	String sql="insert into subject values(?, ?, ?, ?, ?, ?)";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String dayIndex[] = {"mon", "thu", "wed", "thur", "fri", "sat"};
	pstmt = conn.prepareStatement(sql);
	for (int i = 1; i <= 50; i++) {
		result = i%8;
		pstmt.setString(1, "subjectCode" + i);	
		pstmt.setString(2, "subject" + i);
		pstmt.setString(3, String.valueOf(result));
		pstmt.setString(4, dayIndex[i%6]);
		pstmt.setString(5, "pcode" + i);
		if(i > 24){
			pstmt.setString(6, "1");
		}else
			pstmt.setString(6, "2");

		pstmt.executeUpdate();
	}
%>
입력 성공
</body>
</html>