package project;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class TraBoardDao {
	private static TraBoardDao instance;
	private TraBoardDao() {}
	public static TraBoardDao getInstance() {
		if (instance == null) {	instance = new TraBoardDao();		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}
	public List<TraBoard> list(int startRow, int endRow) throws SQLException {
		List<TraBoard> list = new ArrayList<TraBoard>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from traBoard order by ref desc,re2_step) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TraBoard tboard = new TraBoard();
				tboard.setBnum(rs.getInt("bnum"));
				tboard.setWriter(rs.getString("writer"));
				tboard.setTitle(rs.getString("title"));
				tboard.setHits(rs.getInt("hits"));
				tboard.setFileName(rs.getString("fileName"));
				tboard.setFileSize(rs.getInt("fileSize"));
				tboard.setIp(rs.getString("ip"));
				tboard.setRef(rs.getInt("ref"));
				tboard.setRe2_level(rs.getInt("re2_level"));
				tboard.setRe2_step(rs.getInt("re2_step"));
				tboard.setS_date(rs.getDate("s_date"));
				tboard.setCategory(rs.getString("category"));
				list.add(tboard);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	public int insert(TraBoard tboard) throws SQLException {
		int num = tboard.getBnum();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from traBoard";
		String sql="insert into traBoard values(?,?,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		try {	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			if (num == 0) tboard.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, tboard.getTitle());
			pstmt.setString(3, tboard.getWriter());
			pstmt.setString(4, tboard.getContent());
			pstmt.setInt(5, tboard.getHits());
			pstmt.setString(6, tboard.getBpass());
			pstmt.setString(7, tboard.getFileName());
			pstmt.setInt(8, tboard.getFileSize());
			pstmt.setInt(9, tboard.getRe2_step());
			pstmt.setInt(10, tboard.getRe2_level());
			pstmt.setString(11, tboard.getIp());
			pstmt.setInt(12, tboard.getRef());
			pstmt.setString(13, tboard.getCategory());
		
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public TraBoard select(int bnum) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from traBoard where bnum="+bnum;
		TraBoard tboard = new TraBoard();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				tboard.setBnum(rs.getInt("bnum"));
				tboard.setTitle(rs.getString("title"));
				tboard.setS_date(rs.getDate("s_date"));
				tboard.setWriter(rs.getString("writer"));
				tboard.setContent(rs.getString("content"));
				tboard.setHits(rs.getInt("hits"));
				tboard.setBpass(rs.getString("bpass"));
				tboard.setFileName(rs.getString("fileName"));
				tboard.setFileSize(rs.getInt("fileSize"));
				tboard.setRe2_step(rs.getInt("re2_step"));
				tboard.setRe2_level(rs.getInt("re2_level"));
				tboard.setIp(rs.getString("ip"));
				tboard.setRef(rs.getInt("ref"));
				tboard.setCategory(rs.getString("category"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tboard;
	}
	
	public void hits(int bnum) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update traBoard set hits=hits+1 where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);			
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
	}
	public int update(TraBoard tboard) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update traBoard set title=?,writer=?,content=?,bpass=?,fileName=?,fileSize=?,category=? where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tboard.getTitle());
			pstmt.setString(2, tboard.getWriter());
			pstmt.setString(3, tboard.getContent());
			pstmt.setString(4, tboard.getBpass());
			pstmt.setString(5, tboard.getFileName());
			pstmt.setInt(6, tboard.getFileSize());
			pstmt.setString(7, tboard.getCategory());
			pstmt.setInt(8, tboard.getBnum());
			
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int delete(int bnum, String bpass) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;		    ResultSet rs = null;
		String sql1 = "select bpass from traBoard where bnum=?";
		String sql="delete from traBoard where bnum=?";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1); 
				if (dbPasswd.equals(bpass)) {
					rs.close();  pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, bnum);
					pstmt.executeUpdate();
					result = 1;
				} else result = 0;
			} else result = -1;
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from traBoard";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}

}