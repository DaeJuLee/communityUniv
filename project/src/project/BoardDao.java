package project;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import miniproject_jj.CounselReplyBoard;
import project.Board;
import project.BoardDao;

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if (instance == null) {	instance = new BoardDao();		}
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
	public List<Board> list(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from fboard order by ref desc,re2_step) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setWriter(rs.getString("writer"));
				board.setTitle(rs.getString("title"));
				board.setHits(rs.getInt("hits"));
				board.setIp(rs.getString("ip"));
				board.setRef(rs.getInt("ref"));
				board.setRe2_level(rs.getInt("re2_level"));
				board.setRe2_step(rs.getInt("re2_step"));
				board.setS_date(rs.getDate("s_date"));
				board.setCategory(rs.getString("category"));
				list.add(board);
				//board.setFIlename(rs.getString("fileName"));
				//board.setFIlesize(rs.getInt("fileSize"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	public int insert(Board board) throws SQLException {
		int num = board.getBnum();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from fboard";
		String sql="insert into fboard values(?,?,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		/*String sql2="update board set re2_step = re2_step+1 where " +
			" ref=? and re2_step > ?";*/
		try {	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			/*if (num != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe2_step());
				pstmt.executeUpdate();
				pstmt.close();
				board.setRe2_step(board.getRe2_step()+1);
				board.setRe2_level(board.getRe2_level()+1);*/
			rs.next();
			int number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			if (num == 0) board.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, toKor(board.getTitle()));
			pstmt.setString(3, toKor(board.getWriter()));
			pstmt.setString(4, toKor(board.getContent()));
			pstmt.setInt(5, board.getHits());
			pstmt.setString(6, board.getBpass());
			pstmt.setString(7, board.getFileName());
			pstmt.setInt(8, board.getFileSize());
			pstmt.setInt(9, board.getRe2_step());
			pstmt.setInt(10, board.getRe2_level());
			pstmt.setString(11, board.getIp());
			pstmt.setInt(12, board.getRef());
			pstmt.setString(13, toKor(board.getCategory()));
		
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public Board select(int bnum) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from fboard where bnum="+bnum;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setS_date(rs.getDate("s_date"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setHits(rs.getInt("hits"));
				board.setBpass(rs.getString("bpass"));
				board.setFileName(rs.getString("fileName"));
				board.setFileSize(rs.getInt("fileSize"));
				board.setRe2_step(rs.getInt("re2_step"));
				board.setRe2_level(rs.getInt("re2_level"));
				board.setIp(rs.getString("ip"));
				board.setRef(rs.getInt("ref"));
				board.setCategory(rs.getString("category"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}
	
	public void hits(int bnum) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		String sql="update board set hits=hits+1 where bnum=?";
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
	public int update(Board board) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update fboard set title=?,category=?,bpass=?,content=?where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toKor(board.getTitle()));
			pstmt.setString(2, toKor(board.getCategory()));
			pstmt.setString(3, board.getBpass());
			pstmt.setString(4, toKor(board.getContent()));
			pstmt.setInt(5, board.getBnum());
			
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
		String sql1 = "select bpass from fboard where bnum=?";
		String sql="delete from fboard where bnum=?";
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
		String sql = "select count(*) from fboard";
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
	public int ripple(Board board) throws SQLException {
		int num = board.getBnum();		
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from fboard";
		String sql="insert into fboard values(?,?,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2="update fboard set re2_step = re2_step+1 where " +
			" ref=? and re2_step > ?";
		try {			
			conn = getConnection();
			if (num != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe2_step());
				pstmt.executeUpdate();
				pstmt.close();
				board.setRe2_step(board.getRe2_step()+1);
				board.setRe2_level(board.getRe2_level()+1);
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			if (num == 0) board.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getHits());
			pstmt.setString(6, board.getBpass());
			pstmt.setString(7, board.getFileName());
			pstmt.setInt(8, board.getFileSize());
			pstmt.setInt(9, board.getRe2_step());
			pstmt.setInt(10, board.getRe2_level());
			pstmt.setString(11, board.getIp());
			pstmt.setInt(12, board.getRef());
			pstmt.setString(13, board.getCategory());

			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public List<BoardReplyBoard> listRippleSelect(int boardNum)
			throws SQLException {
		List<BoardReplyBoard> list = new ArrayList<BoardReplyBoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectRipple = "select * from fReplyComment where bnum = ? order by re_step";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(selectRipple);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardReplyBoard frboard = new BoardReplyBoard();
				frboard.setBnum(boardNum);// 占쏙옙占썩가 틀占싫놂옙..占싻ㅿ옙
				frboard.setRe_step(rs.getInt("re_step"));
				frboard.setRe_level(rs.getInt("re_level"));
				frboard.setContent(rs.getString("content"));
				frboard.setR_date(rs.getDate("r_date"));
				frboard.setWriter(rs.getString("writer"));
				list.add(frboard);
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
	// 占쏙옙榜占쌜댐옙占� 占쏙옙占쏙옙 占싹댐옙 占쏙옙!! mine 占쏙옙占쏙옙
	public int insertReply(BoardReplyBoard crb) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select nvl(max(reply_code),0) from fReplyComment";
		String sql2 = "insert into fReplyComment values(?, ?, ?, 1, ?, ?, sysdate)";
		String sql3 = "update fReplyComment set re_step = re_step+1 where bnum=? and re_step > ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, crb.getBnum());
			pstmt.setInt(2, crb.getRe_step());
			pstmt.executeUpdate();
			pstmt.close();
			crb.setRe_step(crb.getRe_step() + 1);
			pstmt = conn.prepareStatement(sql1);
			//primary key占쏙옙 1占쏙옙 占쏙옙占쏙옙
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			//insert占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, number);
			pstmt.setInt(2, crb.getBnum());
			pstmt.setInt(3, crb.getRe_step());
			pstmt.setString(4, crb.getContent());
			pstmt.setString(5, crb.getWriter());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("error占쏙옙 占쏙옙占신억옙??? ");
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
		String sql = "delete from fReplyComment where bnum = ? and re_step = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.setInt(2, re_step);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("error占쏙옙 占쏙옙占신억옙??? ");
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