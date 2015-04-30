<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	int bnum = 1;
    int bnum_temp = 1;
	int re_step = 9;
/* 1번째 컬럼부터 4번째 까지 number형, 그 뒤에 두개는 varchar2형 */
/*추가사항 : ip 컬럼을 추가해야한다.  */
	String sql="insert into replyComment values(?, ?, ?, ?, ?, sysdate)";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt = conn.prepareStatement(sql);
	for (int i = 21; i <= 299; i++) {
		pstmt.setInt(1, i);
		if(i%10 == 0){
			bnum++;
		}
		pstmt.setInt(2, bnum);
		if(bnum !=bnum_temp){
			re_step=10;	
		}
		bnum_temp = bnum;
		pstmt.setInt(3, re_step);
		re_step--;
		pstmt.setInt(4, 1);
		pstmt.setString(5, "내용" + i);

		/* pstmt.setString(11, request.getRemoteAddr()); */	
		pstmt.executeUpdate();
	}
%>
입력 성공
</body>
</html>