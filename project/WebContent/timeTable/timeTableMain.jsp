<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="timeTable.TimeTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "timeTable.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function initialData(){
		selectOption.selectHAKKI.value = 0;
		selectOption.scategory.value = 0;
		selectOption.sname.value = "";
	}//선택한 옵션 초기화
	function selectSubject(){

		if(!selectOption.selectHAKKI.value){
			alert("학기를 선택해 주세요");
			return false;
		}

		if(!selectOption.sname.value){
			selectOption.sname.value=0;
		}
		/* location.href="timeTableMain.jsp?scategory="+scategory+"&sname="+sname; */
		//window.open("confirmId.jsp?id="+frm.id.value, "" , "width=300 height=300");
		return true;
	}//과목 검색
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		List<Subject> list = new ArrayList<Subject>();
		String sname = request.getParameter("sname");//과목이름
		String scategory = request.getParameter("scategory");//Subject의 DTO scategory
		Subject subject = new Subject();
		TimeTableDao ttd = TimeTableDao.getInstance();
		/*과목 조회 메소드  */
		if(sname.equals("") || sname == null){//scategory값만 들어온 경우
			sname = "0";
		}
		else if(scategory.equals("") || scategory == null){//sname값만 들어온 경우
			scategory = "0";
		}
		else if((sname.equals("") || sname == null) &&
				(scategory.equals("") || scategory == null)){ //둘다 값이 안들어온 경우
			sname = "0";
			scategory = "0";
		} 
		list = ttd.selectSubject2(sname, scategory);
	%>
	<!-- 선택 창  -->
	<form action="timeTableMain.jsp" name = "selectOption" onsubmit="return selectSubject()">
		<table>
			<tr>
				<td><!-- 학기옵션 선택 -->
					학기 선택 : <!-- 수정해야함... size를 없애고.. 해야한다. -->
					<select name = "selectHAKKI" multiple = "multiple" size = "2">
						<!-- <option value = "0"></option> -->
						<option value = "1">1학기</option>
						<option value = "2">2학기</option>
					</select>
				</td>
				<td>
					이수 과목 선택 : 
					<select name = "scategory">
						<option value = "0"></option>
						<option value = "1">전공</option>
						<option value = "2">교양</option>
					</select>
				</td>
				<td><input type = "button" value = "초기화" onclick = "initialData()"></td>
				<!-- 선택한 것 초기화 select option을 초기화 -->
			</tr>
			<tr>
				<td><a href = "downloadExcel.jsp">파일저장</a></td><!-- 엑셀파일 저장 -->
				<td><!-- 과목명 조회 -->
					<input type="text" name = "sname">
				</td>
				<td><input type = "submit" value = "검색"></td>
				<td></td>
			</tr>
		</table>
	</form><!-- 선택 창 끝 -->

	<!-- 과목코드 조회 form -->
	<form><!-- <tr>안에 <td>대신에 <select><option>으로 바꿔야한다. -->
		<table>
			<tr colspan = "4"><h2>수업 목록</h2> </tr>
			<tr><th>과목코드</th><th>과목이름</th><th>시간</th><th>교수코드</th></tr>
			<%
				for(int i = 0 ; i < list.size(); i++){
					out.println("<tr><td>" + list.get(i).getScode() + "</td>");
					out.println("<td>" + list.get(i).getSname() + "</td>");
					out.println("<td>" + list.get(i).getStime() + "</td>");
					out.println("<td>" + list.get(i).getPcode()+ "</td></tr>");
				}
			%>
		</table>
	</form>

	<!-- 시간표 출력 form -->
	<form></form>
</body>
</html>