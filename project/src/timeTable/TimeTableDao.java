package timeTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import pro.MemberDao;

public class TimeTableDao {

	private static TimeTableDao instance;

	private TimeTableDao() {
	}

	public static TimeTableDao getInstance() {
		if (instance == null) {
			instance = new TimeTableDao();
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

	public List<Subject> selectAllSubject() throws SQLException {
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
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

	public List<Subject> selectSubject(String sname) throws SQLException {
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject where sname = ?";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
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

	public List<Subject> selectSubject1(String scategory) throws SQLException {
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject where scategory = ?";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scategory);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
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

	public List<Subject> selectSubject2(String sname, String scategory)
			throws SQLException {

		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkQuery = 0;
		String sql;
		sql = "select * from subject where scategory = ? and sname = ?";
		System.out.println("Dao�뱾�솕�떎..");
		System.out.println("sname : " + sname);
		System.out.println("scategory : " + scategory);

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (checkQuery == 0) {
				pstmt.setString(1, scategory);
				pstmt.setString(2, sname);
			} else if (checkQuery == 1) {
				pstmt.setString(1, scategory);
			} else if (checkQuery == 2) {
				pstmt.setString(1, sname);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
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

	// 시간표 웹에 출력하는 dao
	public int insertTable(String subjectList, String writer)
			throws SQLException {
		int result = 0;
		String sday = "";
		String stime = "";
		String professorname = "";
		String subjectname = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqltimeTableSelect = "select sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10 "
				+ "from timeTable where writer = ?"; // 글쓴이 수업선택한거 체크
		String sqlSubjectSelect = "select stime, sday from subject where scode = ?";
		String sqlWeboutputSelect = "select * from weboutput where time = ?"; // ?stime이
																		// 들어가야함
//		String sqlWeboutputUpdate = "update weboutput set " + sday
//				+ " = ? where time = ?";
		String week[] = { "mon", "thu", "wed", "tues", "fri", "sat" };
		String enrollSubject[] = { "sub1", "sub2", "sub3", "sub4", "sub5",
				"sub6", "sub7", "sub8", "sub9", "sub10" };
		try {
			System.out.println("dao들왔다. insertTable");
			// 시간표 등록되었는지 체크
			conn = getConnection();
			pstmt = conn.prepareStatement(sqltimeTableSelect);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			int index = 0;
			while (rs.next()) {
				if (subjectList.equals(rs.getString(enrollSubject[index]))) {
					result = 2;// 등록한 과목이 있습니다.
					break;
				}
				index++;
			}
			System.out.println("시간표 등록되었는지 체크 result : " + result);
			pstmt.close();
			System.out.println("시간표 등록되었는지 체크");
			// 등록한 수업에서 요일 시간을 sday와 stime에 저장
			pstmt = conn.prepareStatement(sqlSubjectSelect);
			pstmt.setString(1, subjectList);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sday = rs.getString("sday");
				stime = rs.getString("stime");
				System.out.println("sday : " + rs.getString("sday"));
				System.out.println("stime : " + rs.getString("stime"));
				result = 1;
			} else {
				result = 8; // 등록되어있지 않은 수업입니다. 경고창
			}
			pstmt.close();
			System.out.println("등록한 수업에서 요일 시간을 sday와 stime에 저장");
			
			// weboutput에 겹치는 과목이 있는지 체크
			pstmt = conn.prepareStatement(sqlWeboutputSelect);
			pstmt.setString(1, stime);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("------------- 요일 null?" + rs.getString(sday));
				if(rs.getString(sday) != null){
					result = 2;
				}else{
					result = 1;
				}
			}
			System.out.println("************result 내가 보고있는데 : " + result);
			System.out.println("*****************과목 들오오냐? " + subjectList);
			pstmt.close();

			pstmt = conn.prepareStatement(sqlWeboutputSelect);
			pstmt.setString(1, stime + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				for (int i = 0; i < week.length; i++) {
					if (rs.getString(week[i]) != null) {
						result = 2;// 등록한 과목이 있습니다.
						break;
					}
					if (result == 2) {
						break;
					}
				}
			}
			pstmt.close();

			pstmt = conn.prepareStatement(sqlWeboutputSelect);
			pstmt.setString(1, stime + 2);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				for (int i = 0; i < week.length; i++) {
					if (rs.getString(week[i]) != null) {
						result = 2;// 등록한 과목이 있습니다.
						break;
					}
					if (result == 2) {
						break;
					}
				}
			}
			pstmt.close();
			System.out.println("sday : " + sday);
			String sqlWeboutputUpdate = "update weboutput set " +sday+ " = ? where time = ?";
			System.out.println("weboutput에 겹치는 과목이 있는지 체크");
			System.out.println(sqlWeboutputUpdate);
			//-------------------------------------------------------
			//과목이름 추출
			subjectname = subjectName(subjectList);
			//교수이름 추출
			professorname = professorName(subjectList);
			//-------------------------------------------------------
			// 과목 등록하기
			if (result == 1) {
				pstmt = conn.prepareStatement(sqlWeboutputUpdate);
				pstmt.setString(1, subjectList);
				pstmt.setString(2, stime);
				System.out.println("sday : " + sday);
				System.out.println("stime : " + stime);
				pstmt.executeQuery();
				pstmt.close();
				pstmt = conn.prepareStatement(sqlWeboutputUpdate);
				pstmt.setString(1, subjectname);
				pstmt.setString(2, String.valueOf(Integer.parseInt(stime)+1));
				System.out.println("stime : " + String.valueOf(Integer.parseInt(stime)+1));
				pstmt.executeQuery();
				pstmt.close();
				pstmt = conn.prepareStatement(sqlWeboutputUpdate);
				pstmt.setString(1, professorname);
				pstmt.setString(2, String.valueOf(Integer.parseInt(stime)+2));
				System.out.println("stime : " + String.valueOf(Integer.parseInt(stime)+2));
				pstmt.executeQuery();
				pstmt.close();
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
		System.out.println("과목등록");
		System.out.println("result 값은 : " + result);
		return result;
		// result = 1; 과목등록 성공
		// result = 2; 등록과목이 존재
		// result = 8; 등록되어있지 않은 과목
	}
	
	public List<weboutput> selectTable(String writer) throws SQLException{
		List<weboutput> list = new ArrayList<weboutput>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSQL = "select * from weboutput";
		
		try{
			System.out.println("시간표 조회 dao에 들어왔다.");
			conn = getConnection();
			pstmt = conn.prepareStatement(selectSQL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				weboutput wb = new weboutput();
				wb.setTime(rs.getInt("time"));
				wb.setMon(rs.getString("mon"));
				wb.setThu(rs.getString("thu"));
				wb.setWed(rs.getString("wed"));
				wb.setTues(rs.getString("tues"));
				wb.setFri(rs.getString("fri"));
				wb.setSat(rs.getString("sat"));
				list.add(wb);
			}
			System.out.println("시간표 조회 dao 끝");
		}catch (Exception e) {
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
	
	public String professorName(String scode) throws SQLException{
		String professor="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pcode = "";
		String sqlSelectpcode = "select pcode from subject where scode = ?";
		String sqlSelectpname = "select pname from professor where pcode = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlSelectpcode);
			pstmt.setString(1, scode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pcode = rs.getString("pcode");
			}
			pstmt.close();
			
			pstmt = conn.prepareStatement(sqlSelectpname);
			pstmt.setString(1, pcode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				professor = rs.getString("pname");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return professor;
	}

	public String subjectName(String scode) throws SQLException{
		String sname="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select sname from subject where scode = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				sname = rs.getString("sname");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return sname;
	}
	
}
