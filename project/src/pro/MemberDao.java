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
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getSnum());
			pstmt.setString(2, toKor(member.getName()));
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getPass());
			/* pstmt.setInt(5, member.getStatement()); */
			/* pstmt.setInt(6, member.getGrade()); */
			pstmt.setString(5, toKor(member.getWriter()));
			pstmt.setInt(6, member.getPost1());
			System.out.println("우편번호1  : " + member.getPost1());
			pstmt.setInt(7, member.getPost2());
			System.out.println("우편번호2 : " + member.getPost2());
			pstmt.setString(8, toKor(member.getAddr2()));
			System.out.println("주소 1 :  " + toKor(member.getAddr()));
			pstmt.setString(9, toKor(member.getAddr()));
			System.out.println("주소 2 :  " + toKor(member.getAddr2()));
			pstmt.setString(10, toKor(member.getAddr3()));
			System.out.println("주소 3 :  " + toKor(member.getAddr3()));
			pstmt.setString(11, toKor(member.getJibeon()));
			System.out.println("지번 :  " + toKor(member.getJibeon()));
			pstmt.setString(12, member.getEmail());
			pstmt.setString(13, toKor(member.getMajor()));
			System.out.println("전공 :  " + toKor(member.getMajor()));
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

	public int checkM(String id) throws SQLException {
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
				result = 1;
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

	public int deleteM(String id) throws SQLException {
		int result = 0;
		result = checkM(id);
		if (result != 1)
			return result;
		String sql = "delete from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		result = checkM(id);
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
				member.setSnum(rs.getInt("snum"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				/* member.setStatement(rs.getInt(5)); */
				/* member.setGrade(rs.getInt(5)); */
				member.setWriter(rs.getString("writer"));
				member.setPost1(rs.getInt("post1"));
				member.setPost2(rs.getInt("post2"));
				member.setAddr(rs.getString("addr"));
				member.setAddr2(rs.getString("addr2"));
				member.setAddr3(rs.getString("addr3"));
				member.setJibeon(rs.getString("jibeon"));
				member.setEmail(rs.getString("email"));
				member.setMajor(rs.getString("major"));

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
		String sql = "update member set pass=?, post1 = ?, post2 = ?, addr=?, addr2=?, addr3=?, jibeon=?, email=? where id=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setInt(2, member.getPost1());
			pstmt.setInt(3, member.getPost1());
			pstmt.setString(4, toKor(member.getAddr2()));
			pstmt.setString(5, toKor(member.getAddr2()));
			pstmt.setString(6, toKor(member.getAddr3()));
			pstmt.setString(7, toKor(member.getJibeon()));
			/* pstmt.setInt(8, member.getStatement()); */
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getId());
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

	public List<Member> list(int startRow, int endRow) throws SQLException {
		List<Member> list = new ArrayList<Member>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from(select rownum rn ,a.* from (select * from member order by snum) a ) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setSnum(rs.getInt("snum"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				/* member.setPass(rs.getString("pass")); */
				/* member.setStatement(rs.getInt(5)); */
				/* member.setGrade(rs.getInt(5)); */
				member.setWriter(rs.getString("writer"));
				member.setMajor(rs.getString("major"));
				member.setPost1(rs.getInt("post1"));
				member.setPost2(rs.getInt("post2"));
				member.setAddr(rs.getString("addr"));
				/* member.setAddr2(rs.getString("addr2")); */
				/* member.setAddr3(rs.getString("addr3")); */
				member.setJibeon(rs.getString("jibeon"));
				member.setEmail(rs.getString("email"));

				list.add(member);
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

	public String findMember(String id, int snum, String email, String name)
			throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String resultId = null;
		String resultPw = null;
		String result = null;
		String sql = "select pass from Member where id=? and snum=? and email = ?";
		String sql1 = "select id from Member where name=? and snum=? and email = ?";
		System.out.println("id : "  + id);
		System.out.println("email : " + email);
		System.out.println("snum : " + snum);
		System.out.println("name : " + name);
		try {
			conn = getConnection();
			if (name == null) {
				pstmt = conn.prepareStatement(sql);
				System.out.println("비번찾기 시작");
				pstmt.setString(1, id);
				pstmt.setInt(2, snum);
				pstmt.setString(3, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resultPw = rs.getString("pass");
					System.out.println("resultPw : " + resultPw);
				}
				result = resultPw;
				System.out.println("result : " + result);
			} else { // name 이 null이 아닐때 아이디찾기로 해석하여 sql쿼리문을 실행시켜 아이디를 출력한다.
				pstmt = conn.prepareStatement(sql1);
				System.out.println("아이디찾기 시작");
				pstmt.setString(1, name);
				pstmt.setInt(2, snum);
				pstmt.setString(3, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resultId = rs.getString("id");
					System.out.println("resultId : " + resultId);
				}
				result = resultId;
				System.out.println("result : " + result);
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

	public String getNick(String id) throws SQLException{
		String writer = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select writer from member where id = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				writer = rs.getString("writer");
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
		return writer;
	}
	
}
