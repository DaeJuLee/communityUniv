package pro;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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

	public int confirm(String id) throws SQLException {
		int result = 1;
		String sql = "select id from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else
				result = 0;
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

	public int insert(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "insert into memberCommunity values(?,?,?,?,?,'0',?,'0',?,?)";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getSnum());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getPass());
			pstmt.setInt(5, member.getStatement());
			pstmt.setString(6, member.getWriter());
			/* pstmt.setString(6, member.getAddress()); */
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getMajor());
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

	public int check(String id, String pass) throws SQLException {
		int result = 0;
		String sql = "select pass from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(pass))
					result = 1;
				else
					result = 0;
			} else
				result = -1;
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

	public Member select(String id) throws SQLException {
		Member member = new Member();
		String sql = "select * from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setSnum(rs.getInt(1));
				member.setName(rs.getString(2));
				member.setId(rs.getString(3));
				member.setPass(rs.getString(4));
				member.setStatement(rs.getInt(5));
				member.setGrade(rs.getInt(6));
				member.setWriter(rs.getString(7));
				member.setAddress(rs.getString(8));
				member.setEmail(rs.getString(9));
				member.setMajor(rs.getString(10));

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
		return member;

	}

	public int update(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "update member set pass=?, address=?, statement=?, email=? where id=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getAddress());
			pstmt.setInt(3, member.getStatement());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getId());
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

	public int delete(String id, String pass) throws SQLException {
		int result = 0;
		result = check(id, pass);
		if (result != 1)
			return result;
		String sql = "delete from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		result = check(id, pass);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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

	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<>();
		String sql = "select * from member";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					Member member = new Member();
					member.setSnum(rs.getInt(1));
					member.setName(rs.getString(2));
					member.setId(rs.getString(3));
					member.setPass(rs.getString(4));
					member.setStatement(rs.getInt(5));
					member.setGrade(rs.getInt(6));
					member.setWriter(rs.getString(7));
					member.setAddress(rs.getString(8));
					member.setEmail(rs.getString(9));
					list.add(member);
				} while (rs.next());
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

	public int confirmId(String id) throws SQLException {
		int result = 1;
		Connection conn = null;

		String sql = "select id from member where id=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
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
		return result;
	}

	public int confirmWriter(String writer) throws SQLException {
		int result = 1;
		Connection conn = null;

		String sql = "select writer from member where writer=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
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
		return result;
	}

	public int confirmSnum(int snum) throws SQLException {
		int result = 1;
		Connection conn = null;

		String sql = "select snum from member where snum=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
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
		return result;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member";
		int tot = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				tot = rs.getInt(1);
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
		return tot;
	}
}
