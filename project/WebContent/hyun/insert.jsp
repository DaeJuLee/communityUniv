<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	Context ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = null;
	Member member = new Member();
	String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
	for(int i = 0 ; i<10; i++){
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,	"082111"+i);
		pstmt.setString(2, "유지인1"+i);
		pstmt.setString(3, "you10"+i);
		pstmt.setString(4, "you10"+i);
		pstmt.setString(5, "1");
		pstmt.setString(6, "0");
		pstmt.setString(7, "지인유10"+i);
		pstmt.setInt(8, i);
		pstmt.setString(9, "you10"+i+"@gmail.com");
		pstmt.executeUpdate();
		pstmt.close();
	}
	conn.close();
%>
</body>
</html>