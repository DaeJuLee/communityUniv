package miniproject_jj;

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

public class CounselBoardDAO {

	private static CounselBoardDAO instance;

	private CounselBoardDAO() {
	}

	public static CounselBoardDAO getInstance() {
		if (instance == null) {
			instance = new CounselBoardDAO();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// find
	public List<CounselBoard> list(int startRow, int endRow)
			throws SQLException {
		List<CounselBoard> list = new ArrayList<CounselBoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from(select rownum rn ,a.* from (select * from cboard order by ref desc, re_step) a ) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CounselBoard cboard = new CounselBoard();
				cboard.setBnum(rs.getInt("bnum"));
				cboard.setWriter(rs.getString("writer"));
				cboard.setTitle(rs.getString("title"));
				cboard.setS_date(rs.getDate("s_date"));
				cboard.setContent(rs.getString("content"));
				cboard.setHits(rs.getInt("hits"));
				cboard.setBpass(rs.getString("bpass"));
				cboard.setRe_step(rs.getInt("re_step"));
				cboard.setRe_level(rs.getInt("re_level"));
				cboard.setRef(rs.getInt("ref"));
				cboard.setIp(rs.getString("ip"));
				cboard.setCategory(rs.getString("category"));

				list.add(cboard);
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

	// 占썰변占썰변占썰변
	public int insert(CounselBoard cboard) throws SQLException {
		int bnum = cboard.getBnum();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(bnum),0) from cboard";
		String sql = "insert into cboard(bnum, ref, re_level, re_step, category, title, writer, bpass, content, s_date) "
				+ "values(?,?,?,?,?,?,?,?,?,sysdate)";
		// 占쏙옙占쌍억옙 占쏙옙占썩가 틀占쏙옙占쏙옙... console창占쏙옙 'not enough values'占쏙옙占� 占쌨쇽옙占쏙옙占쏙옙 占쏙옙탑占� ^^ (sql1)
		String sql2 = "update cboard set re_step = re_step+1 where ref=? and re_step > ?";
		try {
			conn = getConnection();
			if (bnum != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, cboard.getRef());
				pstmt.setInt(2, cboard.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				cboard.setRe_step(cboard.getRe_step() + 1);
				cboard.setRe_level(cboard.getRe_level() + 1);
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();

			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();

			if (bnum == 0)
				cboard.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setInt(2, cboard.getRef());
			pstmt.setInt(3, cboard.getRe_level());
			pstmt.setInt(4, cboard.getRe_step());
			pstmt.setString(5, toKor(cboard.getCategory()));
			pstmt.setString(6, toKor(cboard.getTitle()));
			pstmt.setString(7, toKor(cboard.getWriter()));
			pstmt.setString(8, cboard.getBpass());
			pstmt.setString(9, toKor(cboard.getContent()));

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

	public CounselBoard select(int bnum) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from cboard where bnum=" + bnum;
		CounselBoard cboard = new CounselBoard();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				cboard.setBnum(bnum);
				cboard.setWriter(rs.getString("writer"));
				cboard.setTitle(rs.getString("title"));
				cboard.setS_date(rs.getDate("s_date"));
				cboard.setContent(rs.getString("content"));
				cboard.setHits(rs.getInt("hits"));
				cboard.setBpass(rs.getString("bpass"));
				cboard.setFileName(rs.getString("filename"));
				cboard.setFileSize(rs.getInt("filesize"));
				cboard.setRe_step(rs.getInt("re_step"));
				cboard.setRe_level(rs.getInt("re_level"));
				cboard.setRef(rs.getInt("ref"));
				cboard.setIp(rs.getString("ip"));
				cboard.setCategory(rs.getString("category"));
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
		return cboard;
	}

	public void hits(int bnum) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update cboard set hits=hits+1 where bnum=?";
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

	public int update(CounselBoard cboard) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update cboard set title=?, category=?, writer=?, bpass=?,content=? where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toKor(cboard.getTitle()));
			pstmt.setString(2, toKor(cboard.getCategory()));
			pstmt.setString(3, cboard.getWriter());
			pstmt.setString(4, cboard.getBpass());
			pstmt.setString(5, toKor(cboard.getContent()));
			pstmt.setInt(6, cboard.getBnum());

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
		String sql1 = "select bpass from cboard where bnum=?";
		String sql = "delete from cboard where bnum=?";
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
		String sql = "select count(*) from cboard";
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

	// 占쏙옙榜占쌜댐옙占� 占쏙옙占쏙옙 占싹댐옙 占쏙옙!! mine 占쏙옙占쏙옙
	public List<CounselReplyBoard> listRippleSelect(int boardNum)
			throws SQLException {
		List<CounselReplyBoard> list = new ArrayList<CounselReplyBoard>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectRipple = "select * from cReplyComment where bnum = ? order by re_step";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(selectRipple);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CounselReplyBoard crboard = new CounselReplyBoard();
				crboard.setBnum(boardNum);// 占쏙옙占썩가 틀占싫놂옙..占싻ㅿ옙
				crboard.setRe_step(rs.getInt("re_step"));
				crboard.setRe_level(rs.getInt("re_level"));
				crboard.setContent(rs.getString("content"));
				crboard.setR_date(rs.getDate("r_date"));
				crboard.setWriter(rs.getString("writer"));
				list.add(crboard);
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
	public int insertReply(CounselReplyBoard crb) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select nvl(max(reply_code),0) from cReplyComment";
		String sql2 = "insert into cReplyComment values(?, ?, ?, 1, ?, ?, sysdate)";
		String sql3 = "update cReplyComment set re_step = re_step+1 where bnum=? and re_step > ?";
		
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
			pstmt.setString(4, toKor(crb.getContent()));
			pstmt.setString(5, toKor(crb.getWriter()));
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
		String sql = "delete from cReplyComment where bnum = ? and re_step = ?";
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