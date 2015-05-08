package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MaBoardDao {
	private static MaBoardDao instance;
	private MaBoardDao() {}
	public static MaBoardDao getInstance() {
		if (instance == null) {	instance = new MaBoardDao();		}
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
	public List<MaBoard> list(int startRow, int endRow) throws SQLException {
		List<MaBoard> list = new ArrayList<MaBoard>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from maBoard order by ref desc,re2_step) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MaBoard mboard = new MaBoard();
				mboard.setBnum(rs.getInt("bnum"));
				mboard.setWriter(rs.getString("writer"));
				mboard.setTitle(rs.getString("title"));
				mboard.setHits(rs.getInt("hits"));
				//mboard.setFileName(rs.getString("fileName"));
				//mboard.setFileSize(rs.getInt("fileSize"));
				mboard.setIp(rs.getString("ip"));
				mboard.setRef(rs.getInt("ref"));
				mboard.setRe2_level(rs.getInt("re2_level"));
				mboard.setRe2_step(rs.getInt("re2_step"));
				mboard.setS_date(rs.getDate("s_date"));
				mboard.setCategory(rs.getString("category"));
				list.add(mboard);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	public int insert(MaBoard mboard) throws SQLException {
		int num = mboard.getBnum();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int number = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from maBoard";
		String sql="insert into maBoard values(?,?,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		try {	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			if (num == 0) mboard.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, mboard.getTitle());
			pstmt.setString(3, mboard.getWriter());
			pstmt.setString(4, mboard.getContent());
			pstmt.setInt(5, mboard.getHits());
			pstmt.setString(6, mboard.getBpass());
			pstmt.setString(7, mboard.getFileName());
			//System.out.println("占쏙옙占쏙옙 占싱몌옙 : " +  mboard.getFileName());
			pstmt.setInt(8, mboard.getFileSize());
			pstmt.setInt(9, mboard.getRe2_step());
			pstmt.setInt(10, mboard.getRe2_level());
			pstmt.setString(11, mboard.getIp());
			pstmt.setInt(12, mboard.getRef());
			pstmt.setString(13, mboard.getCategory());
		
			pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return number;
	}

	public MaBoard select(int bnum) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from maBoard where bnum="+bnum;
		MaBoard mboard = new MaBoard();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				mboard.setBnum(rs.getInt("bnum"));
				mboard.setTitle(rs.getString("title"));
				mboard.setS_date(rs.getDate("s_date"));
				mboard.setWriter(rs.getString("writer"));
				mboard.setContent(rs.getString("content"));
				mboard.setHits(rs.getInt("hits"));
				mboard.setBpass(rs.getString("bpass"));
				mboard.setFileName(rs.getString("fileName"));
				mboard.setFileSize(rs.getInt("fileSize"));
				mboard.setRe2_step(rs.getInt("re2_step"));
				mboard.setRe2_level(rs.getInt("re2_level"));
				mboard.setIp(rs.getString("ip"));
				mboard.setRef(rs.getInt("ref"));
				mboard.setCategory(rs.getString("category"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return mboard;
	}
	
	public void hits(int bnum) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update maBoard set hits=hits+1 where bnum=?";
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
	public int update(MaBoard mboard) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update maBoard set title=?,writer=?,content=?,bpass=?,category=? where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mboard.getTitle());
			pstmt.setString(2, mboard.getWriter());
			pstmt.setString(3, mboard.getContent());
			pstmt.setString(4, mboard.getBpass());
			pstmt.setString(5, mboard.getCategory());
			pstmt.setInt(6, mboard.getBnum());
			System.out.println("writer dao" + mboard.getWriter());
			result = pstmt.executeUpdate();
			System.out.println("result : "+ result);
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
		String sql1 = "select bpass from maBoard where bnum=?";
		String sql="delete from maBoard where bnum=?";
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
					result = pstmt.executeUpdate();
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
		String sql = "select count(*) from maBoard";
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
	public List<MaReplyBoard> listRippleSelect(int boardNum)
			throws SQLException {
		List<MaReplyBoard> list = new ArrayList<MaReplyBoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectRipple = "select * from mReplyComment where bnum = ? order by re_step";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(selectRipple);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MaReplyBoard mboard = new MaReplyBoard();
				mboard.setBnum(boardNum);// �뜝�룞�삕�뜝�뜦媛� ���뜝�떕�냲�삕..�뜝�떩�끏�삕
				mboard.setRe_step(rs.getInt("re_step"));
				mboard.setRe_level(rs.getInt("re_level"));
				mboard.setContent(rs.getString("content"));
				mboard.setR_date(rs.getDate("r_date"));
				mboard.setWriter(rs.getString("writer"));
				list.add(mboard);
			}
		} catch (Exception e) {
			System.out.println("error ");
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
	// �뜝�룞�삕礖쒎뜝�뙗�뙋�삕�뜝占� �뜝�룞�삕�뜝�룞�삕 �뜝�떦�뙋�삕 �뜝�룞�삕!! mine �뜝�룞�삕�뜝�룞�삕
	public int insertReply(MaReplyBoard mb) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select nvl(max(reply_code),0) from mReplyComment";
		String sql2 = "insert into mReplyComment values(?, ?, ?, 1, ?, ?, sysdate)";
		String sql3 = "update mReplyComment set re_step = re_step+1 where bnum=? and re_step > ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, mb.getBnum());
			pstmt.setInt(2, mb.getRe_step());
			pstmt.executeUpdate();
			pstmt.close();
			mb.setRe_step(mb.getRe_step() + 1);
			pstmt = conn.prepareStatement(sql1);
			//primary key�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			//insert�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, number);
			pstmt.setInt(2, mb.getBnum());
			pstmt.setInt(3, mb.getRe_step());
//			pstmt.setString(4, toKor(trb.getContent()));
			pstmt.setString(4, mb.getContent());
			pstmt.setString(5, mb.getWriter());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("error?? ");
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}
	
	public int deleteReply(int bnum, int re_step) throws SQLException{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from mReplyComment where bnum = ? and re_step = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.setInt(2, re_step);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("error? ");
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		
		return result;
	}
	
	public static String toKor(String en) {
		if (en == null) {
			return null;
		}
		try {
			return new String(en.getBytes("8859_1"), "utf-8");
		} catch (Exception e) {
			return en;
		}
	}
}
