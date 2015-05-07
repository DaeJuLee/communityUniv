<%@ page contentType="application/vnd.ms-excel;charset=euc-kr"%><%@ page
	import="java.io.*"%><%@ page import="jxl.*"%>
<%@ page import="jxl.write.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
	
	String writer = request.getParameter("writer");
	//캠페인 ID
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = DriverManager
			.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","scott","tiger");

	PreparedStatement ps = null;
	ResultSet rs = null;
	//StringBuffer sb = new StringBuffer(
		//	"select indexNum, registDate, name, id  from table_name order by indexNum desc");
		StringBuffer sb = new StringBuffer(
			"select time, mon, thu, wed, tues, fri, sat from weboutput");

	//Excel로 저장하기에 필요한 변수...
	String fileName = "excel.xls";

	WritableWorkbook workbook = null;
	WritableSheet sheet = null;
	Label label = null;

	try {

		response.setHeader("Content-Disposition",
				"attachment;filename=" + fileName);

		workbook = Workbook.createWorkbook(response.getOutputStream());
		sheet = workbook.createSheet("설문조사 결과", 0); //sheet제목 설정...
		//column개수에 맞춰서 기술할것!! 수정부분
		sheet.setColumnView(0, 20);//셀 열 위치, 셀 넓이
		sheet.setColumnView(1, 20);
		sheet.setColumnView(2, 20);
		sheet.setColumnView(3, 20);
		sheet.setColumnView(4, 20);
		sheet.setColumnView(5, 20);
		sheet.setColumnView(6, 20);

		//기본 Cell Format 설정..
		//WritableFont gulimFont = new WritableFont(
		//		WritableFont.getFontName("굴림체"), 10,
		//		WritableFont.NO_BOLD, false);
		
		WritableFont gulimFont = new WritableFont(
				WritableFont.ARIAL, 10,
				WritableFont.NO_BOLD, false);
		
		WritableCellFormat writerFormat = new WritableCellFormat(gulimFont);
		writerFormat.setBackground(Colour.PALE_BLUE);
		writerFormat.setAlignment(Alignment.CENTRE);
		
		//Default FONT
		WritableCellFormat defaultFormat = new WritableCellFormat(
				gulimFont);
		defaultFormat.setBackground(Colour.ORANGE);
		defaultFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		defaultFormat.setAlignment(Alignment.CENTRE);
		defaultFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
		defaultFormat.setWrap(true);

		//Data Font
		WritableCellFormat dataFormat = new WritableCellFormat(
				gulimFont);
		dataFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		dataFormat.setAlignment(Alignment.CENTRE);
		dataFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
		dataFormat.setWrap(true);
		//column index 일치
		label = new Label(3, 0, writer+"님의 시간표" , writerFormat);
		sheet.addCell(label);
		label = new Label(0, 1, "교시", defaultFormat);
		sheet.addCell(label);
		label = new Label(1, 1, "월요일", defaultFormat);
		sheet.addCell(label);
		label = new Label(2, 1, "화요일", defaultFormat);
		sheet.addCell(label);
		label = new Label(3, 1, "수요일", defaultFormat);
		sheet.addCell(label);
		label = new Label(4, 1, "목요일", defaultFormat);
		sheet.addCell(label);
		label = new Label(5, 1, "금요일", defaultFormat);
		sheet.addCell(label);
		label = new Label(6, 1, "토요일", defaultFormat);
		sheet.addCell(label);

		ps = conn.prepareStatement(sb.toString());
		rs = ps.executeQuery();

		int rownum = 2;//엑셀 3번째 줄 부터
		while (rs.next()) {
		//컬럼개수 일치
			label = new Label(0, rownum, rs.getString(1), dataFormat);
			sheet.addCell(label);
			label = new Label(1, rownum, rs.getString(2), dataFormat);
			sheet.addCell(label);
			label = new Label(2, rownum, rs.getString(3), dataFormat);
			sheet.addCell(label);
			label = new Label(3, rownum, rs.getString(4), dataFormat);
			sheet.addCell(label);
			label = new Label(4, rownum, rs.getString(5), dataFormat);
			sheet.addCell(label);
			label = new Label(5, rownum, rs.getString(6), dataFormat);
			sheet.addCell(label);
			label = new Label(6, rownum, rs.getString(7), dataFormat);
			sheet.addCell(label);
			rownum++;
		}
		workbook.write();
		workbook.close();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (Exception see) {
			}
		if (ps != null)
			try {
				ps.close();
			} catch (Exception se) {
			}
		if (conn != null)
			conn.close();
		if (workbook != null) {
			try {
				workbook.close();
			} catch (Exception e) {
			}
		}
	}
%>
