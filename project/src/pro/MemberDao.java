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
		String sql = "insert into member values(?,?,?,?,?,'0',?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getSnum());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getPass());
			pstmt.setInt(5, member.getStatement());
/*			pstmt.setInt(6, member.getGrade());*/
			pstmt.setString(6, member.getWriter());
			pstmt.setInt(7, member.getPost1()); 
			System.out.println("快祈锅龋1  : " +  member.getPost1());
			pstmt.setInt(8, member.getPost2()); 
			System.out.println("快祈锅龋2 : " + member.getPost2());
			pstmt.setString(9,toKor( member.getAddr2()));
			System.out.println("林家 1 :  " + toKor( member.getAddr()));
			pstmt.setString(10,toKor( member.getAddr()));
			System.out.println("林家 2 :  " + toKor( member.getAddr2()));
			pstmt.setString(11, toKor(member.getAddr3())); 
			System.out.println("林家 3 :  " + toKor(member.getAddr3()));
			pstmt.setString(12,toKor( member.getJibeon()));
			System.out.println("瘤锅 :  " +toKor( member.getJibeon()));
			pstmt.setString(13, member.getEmail());
			pstmt.setString(14, member.getMajor());
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
	
	public static String toKor (String en) { 
		if (en == null) {
			return null; 
			} try {
				return new String (en.getBytes("8859_1"), "utf-8"); 
			} catch(Exception e) {
				return en; 
		} 
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
				member.setPost1(rs.getInt(8));
				member.setPost2(rs.getInt(9));
				member.setAddr(rs.getString(10));
				member.setAddr2(rs.getString(11));
				member.setAddr3(rs.getString(12));
				member.setJibeon(rs.getString(13));
				member.setEmail(rs.getString(14));
				member.setMajor(rs.getString(15));

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
		String sql = "update member set pass=?, post1 = ?, post2 = ?, addr=?, addr2=?, addr3=?, jibeon=?, statement=?, email=? where id=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setInt(2, member.getPost1());
			pstmt.setInt(3, member.getPost1());
			pstmt.setString(4, member.getAddr2());
			pstmt.setString(5, member.getAddr2());
			pstmt.setString(6, member.getAddr3());
			pstmt.setString(7, member.getJibeon());
			pstmt.setInt(8, member.getStatement());
			pstmt.setString(9, member.getEmail());
			pstmt.setString(10, member.getId());
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
					member.setPost1(rs.getInt(8));
					member.setPost2(rs.getInt(9));
					member.setAddr(rs.getString(10));
					member.setAddr2(rs.getString(11));
					member.setAddr3(rs.getString(12));
					member.setJibeon(rs.getString(13));
					member.setEmail(rs.getString(14));
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
