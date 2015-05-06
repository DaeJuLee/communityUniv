package miniproject_jj;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class QnABoardDAO {
	private static QnABoardDAO instance;
	
	private QnABoardDAO() {	}
	
	public static QnABoardDAO getInstance() {
		if(instance == null) {
			instance = new QnABoardDAO();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public List<QnABoard> list(int startRow, int endRow) throws SQLException {
		List<QnABoard> list = new ArrayList<QnABoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from(select rownum rn ,a.* from (select * from qboard order by ref desc, re_step) a ) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				QnABoard qboard = new QnABoard();
				qboard.setBnum(rs.getInt("bnum"));
				qboard.setWriter(rs.getString("writer"));
				qboard.setTitle(rs.getString("title"));
				qboard.setS_date(rs.getDate("s_date"));
				qboard.setContent(rs.getString("content"));
				qboard.setHits(rs.getInt("hits"));
				qboard.setBpass(rs.getString("bpass"));
				qboard.setFileName(rs.getString("fileName"));
				qboard.setFileSize(rs.getInt("fileSize"));
				qboard.setRe_step(rs.getInt("re_step"));
				qboard.setRe_level(rs.getInt("re_level"));
				qboard.setRef(rs.getInt("ref"));
				qboard.setIp(rs.getString("ip"));
								
				list.add(qboard);
			}
		} catch (Exception e) {
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

	public int insert(QnABoard qboard) throws SQLException {
		int bnum = qboard.getBnum();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from qboard";
		String sql = "insert into qboard(bnum, writer, ref, re_level, re_step, title, bpass, content, s_date) "
		+ "values(?,?,?,?,?,?,?,?,sysdate)";
		String sql2 = "update qboard set re_step = re_step+1 where ref=? and re_step > ?"; //占쏙옙占�
		try {
			conn = getConnection();
			if (bnum != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, qboard.getRef());
				pstmt.setInt(2, qboard.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				qboard.setRe_step(qboard.getRe_step() + 1);
				qboard.setRe_level(qboard.getRe_level() + 1);
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();

			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			
			if (bnum == 0)
				qboard.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, toKor(qboard.getWriter()));
			pstmt.setInt(3, qboard.getRef());
			pstmt.setInt(4, qboard.getRe_level());
			pstmt.setInt(5, qboard.getRe_step());
			pstmt.setString(6, toKor(qboard.getTitle()));
			
			pstmt.setString(7, qboard.getBpass());
			pstmt.setString(8, qboard.getContent());
			//pstmt.setString(12, qboard.getIp());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
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

	public QnABoard select(int bnum) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from qboard where bnum=" + bnum;
		QnABoard qboard = new QnABoard();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		
			if (rs.next()) {
				qboard.setBnum(bnum);
				qboard.setWriter(rs.getString("writer"));
				qboard.setTitle(rs.getString("title"));
				qboard.setS_date(rs.getDate("s_date"));
				qboard.setContent(rs.getString("content"));
				qboard.setHits(rs.getInt("hits"));
				qboard.setBpass(rs.getString("bpass"));
				qboard.setFileName(rs.getString("filename"));
				qboard.setFileSize(rs.getInt("filesize"));
				qboard.setRe_step(rs.getInt("re_step"));
				qboard.setRe_level(rs.getInt("re_level"));
				qboard.setRef(rs.getInt("ref"));
				qboard.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return qboard;
	}

	public void hits(int bnum) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update qboard set hits=hits+1 where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public int update(QnABoard qboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update qboard set title=?, writer=?, bpass=?,content=? where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toKor(qboard.getTitle()));
			pstmt.setString(2, toKor(qboard.getWriter()));
			pstmt.setString(3, qboard.getBpass());
			pstmt.setString(4, toKor(qboard.getContent()));
			pstmt.setInt(5, qboard.getBnum());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int delete(int bnum, String bpass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select bpass from qboard where bnum=?";
		String sql = "delete from qboard where bnum=?";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1);
				if (dbPasswd.equals(bpass)) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, bnum);
					result = pstmt.executeUpdate();
				} else
					result = 0;
			} else
				result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from qboard";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}
	public List<QnAReplyBoard> listRippleSelect(int boardNum) //boardNum 占싱띰옙占� 占실억옙 占쏙옙占쏙옙
			throws SQLException {
		List<QnAReplyBoard> QnAList = new ArrayList<QnAReplyBoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectRipple = "select * from qReplyComment where bnum = ? order by re_step";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(selectRipple);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnAReplyBoard qrboard = new QnAReplyBoard();
				qrboard.setBnum(boardNum);// 占쏙옙占썩가 틀占싫억옙占쏙옙;;
				qrboard.setRe_step(rs.getInt("re_step"));
				qrboard.setRe_level(rs.getInt("re_level"));
				qrboard.setContent(rs.getString("content"));
				qrboard.setR_date(rs.getDate("r_date"));
				QnAList.add(qrboard);
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
		return QnAList;
	}
	// 占쏙옙榜占쌜댐옙占� 占쏙옙占쏙옙 占싹댐옙 占쏙옙!! mine 占쏙옙占쏙옙
	public int insertReply(QnAReplyBoard qrb) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select nvl(max(reply_code),0) from qReplyComment";
		String sql2 = "insert into qReplyComment values(?, ?, ?, 1, ?, sysdate)";
		String sql3 = "update qReplyComment set re_step = re_step+1 where bnum=? and re_step > ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, qrb.getBnum());
			pstmt.setInt(2, qrb.getRe_step());
			pstmt.executeUpdate();
			pstmt.close();
			qrb.setRe_step(qrb.getRe_step() + 1);
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
			pstmt.setInt(2, qrb.getBnum());
			pstmt.setInt(3, qrb.getRe_step());
			pstmt.setString(4, qrb.getContent());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("error 占쌩삼옙 ");
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
		String sql = "delete from qReplyComment where bnum = ? and re_step = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.setInt(2, re_step);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("error 占쌩삼옙 ");
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