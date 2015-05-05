package timeTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public List<Subject> selectAllSubject(){
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject";
		try{
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	
	public List<Subject> selectSubject(String sname){
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject where sname = ?";
		try{
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sname);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public List<Subject> selectSubject1(String scategory){
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from subject where scategory = ?";
		try{
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scategory);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public List<Subject> selectSubject2(String sname, String scategory){
		
		List<Subject> list = new ArrayList<Subject>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkQuery = 0;
		String sql;
		sql = "select * from subject where scategory = ? and sname = ?";
		System.out.println("Dao들왔다..");
		System.out.println("sname : " + sname);
		System.out.println("scategory : " + scategory);
		/*if(sname.equals("0")){
			sql = "select * from subject where scategory = ?";
			checkQuery = 1;
		}else if(scategory.equals("0")){
			sql = "select * from subject where sname = ?";
			checkQuery = 2;
		}else if(sname.equals("0") && scategory.equals("0")){
			sql = "select * from subject";
			checkQuery = 3;
		}else{
			sql = "select * from subject where scategory = ? and sname = ?";
			checkQuery = 0;
		}*/
		
		try{
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if(checkQuery == 0){
				pstmt.setString(1, scategory);
				pstmt.setString(2, sname);
			}else if(checkQuery == 1){
				pstmt.setString(1, scategory);
			}else if(checkQuery == 2){
				pstmt.setString(1, sname);
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				Subject subject = new Subject();
				subject.setScode(rs.getString("scode"));
				subject.setSname(rs.getString("sname"));
				subject.setStime(rs.getString("stime"));
				subject.setPcode(rs.getString("pcode"));
				subject.setScategory(rs.getString("scategory"));
				list.add(subject);
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return list;
	}
	
}
