<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="timeTable.TimeTable"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="timeTable.*"%>
<%@ include file="../memberCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간표 만들기~</title>
<script type="text/javascript">
	function initPage() {
		selectOption.selectHAKKI.value = 1;
		selectOption.scategory.value = 1;
		selectOption.sname.value = "";
	}
	function initialData() {
		selectOption.selectHAKKI.value = 1;
		selectOption.scategory.value = 0;
		selectOption.sname.value = "";
	}//선택한 옵션 초기화
	function selectSubject() {

		if (!selectOption.selectHAKKI.value) {
			alert("학기를 선택해 주세요");
			return false;
		}

		if (!selectOption.sname.value) {
			selectOption.sname.value = 0;
		}
		/* location.href="timeTableMain.jsp?scategory="+scategory+"&sname="+sname; */
		//window.open("confirmId.jsp?id="+frm.id.value, "" , "width=300 height=300");
		return true;
	}//과목 검색
</script>
<style type="text/css">
table .haha{
	display:inline;
	border:"1";
}
</style>
</head>
<body onload="initPage()">
	<h2>시간표 만들기</h2>
	<%
		if(id.equals("not") || id == "not"){//회원이 아닌경우
	%>
		<script type="text/javascript">
			alert("회원들만 사용할 수 있습니다.");
			location.href = "../combinePage/homeMainPage.jsp";
		</script>
	<%
		} else {
	%>
	
	<%
		List<Subject> list = new ArrayList<Subject>();//과목 조회 리스트
		List<weboutput> listTable = new ArrayList<weboutput>();//시간표 출력 리스트
		String sname = request.getParameter("sname");//과목이름
		String scategory = request.getParameter("scategory");//Subject의 DTO scategory
		String subjectList = request.getParameter("subjectList"); 
		Subject subject = new Subject();
		TimeTableDao ttd = TimeTableDao.getInstance();
		//out.println("sname : " + sname); //console창에 띄우기
		//out.println("scategory : " + scategory);
		//out.println("subjectList : " + subjectList);
		if(sname != null || scategory != null){
			if(sname.equals("")){
				list = ttd.selectSubject1(scategory);
			}else if((scategory.equals("1") || scategory.equals("2")) && sname.equals("")){
				list = ttd.selectSubject1(scategory);
			}else{
				list = ttd.selectSubject2(sname, scategory);
			}
		}
		/* if(subjectList.equals("") || subjectList == null){
			out.println("subjectList 널띁다.!@!@");
		}else{
			out.println("DAO시작이다.");
		} */
	%>

	<form action="../combinePage/homeMainPage.jsp" name="selectOption"
		onsubmit="return selectOption()">
		<input type = "hidden" name = "pgm" value = "../timeTable/timetablehome.jsp">
		<table class = "haha"><tr><td align = "center">
		<table>
			<tr height="80px">
				<td colspan = "2"><h1>과목 찾기 카테고리 설정</h1></td>
			</tr>
			<tr height="80px">
				<td>
					<!-- 학기옵션 선택 --> 학기 선택 : <!-- 수정해야함... size를 없애고.. 해야한다. --> <select
					name="selectHAKKI" multiple="multiple" size="2">
						<option value="1">1학기</option>
						<option value="2">2학기</option>
				</select>
				</td>
				<td>이수 과목 선택 : <select name="scategory">
						<option value="0"></option>
						<option value="1">전공</option>
						<option value="2">교양</option>
				</select>
				</td>
				<td><input type="button" value="초기화" onclick="initialData()"></td>
				<!-- 선택한 것 초기화 select option을 초기화 -->
			</tr>
			<tr height="80px">
				<td><a href="../timeTable/downloadExcel.jsp?writer=<%=writer%>">파일저장</a></td>
				<!-- 엑셀파일 저장 -->
				<td>
					<!-- 과목명 조회 --> <input type="text" name="sname">
				</td>
				<td><input type="submit" value="시간표검색"></td>
				<td></td>
			</tr>
		</table>
		</td><td>
		<table>
			<tr colspan = "4"><h1>수업 목록</h1> </tr>
			<tr height="80px"><th width = "80">과목코드</th><th width = "80">과목이름</th>
				<th width = "80">시간</th><th width = "80">교수코드</th></tr>
			<%
				if(list.size()==0){
					out.println("<tr height='80px'><td colspan = '4' width = '320'>");
					out.println("<select multiple = 'multiple' size = '5' style = 'width:320px'>");
					out.println("<option>조회된 데이터가 없습니다....</option>");
					//out.println("<table><tr><td colspan = '4'>조회된 데이터가 없습니다....</td></tr></table>");
					out.println("</select>");
					out.println("</td></tr>");
				}else{
					out.println("<tr height='80px'><td colspan = '4'>");
					out.println("<select name = 'subjectList' multiple = 'multiple' size = '5' style = 'width:320px'>");
					for(int i = 0 ; i < list.size(); i++){
						out.println("<option value = " + list.get(i).getScode() + ">");
						out.println("<div><ul><li>" + list.get(i).getScode() + "</li>");
						out.println("<li></li>");
						out.println("<li>" + list.get(i).getSname() + "</li>");
						out.println("<li>" + list.get(i).getStime() + "</li>");
						out.println("<li>" + list.get(i).getPcode() + "</li>");
						out.println("</ul></div></option>");
					}
					out.println("</select></td></tr>");
				}
			%>
			<tr><td colspan="4"><input type="submit" value = "시간표 저장"></td></tr>
		</table>
		</td>
		</tr></table>
	</form>
	
		<%
			int result = ttd.insertTable(subjectList, writer); //과목리스트 삽입
			listTable = ttd.selectTable(writer); //시간표들 조회
			if(result == 1){
		%>
			<script type="text/javascript">
				alert("수업이 등록 되셨습니다.");
			</script>
		<%} %>
		<%-- <% }else if(result == 2){ %>
			<script type="text/javascript">
				alert("수업이 중복됩니다.. 다시 선택해주세요");
			</script>
		<% } %> --%>
	
	<table>
		
		
		<tr bgcolor = "orange">
			<th>시간</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<%
			if(listTable.size() == 0){
				out.print("<tr><td colspan = '7'>아직 시간표를 등록하지 않으셨습니다.</td></tr>");
			}else{
				for(int i = 0; i <= 11 ; i++){
					/* String bgcolor = "#" + "8" + String.valueOf(i) + 
											String.valueOf(i+5) +  "c" +
											String.valueOf(i+5) +  "c"; */
					out.print("<tr><td width = '50' align = 'center' bgcolor = 'pink'>" + listTable.get(i).getTime() + "</td>");
					if(listTable.get(i).getMon() == null || listTable.get(i).getMon().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
						+ listTable.get(i).getMon() + "</td>");
					}//월요일
					if(listTable.get(i).getThu() == null || listTable.get(i).getThu().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
					    + listTable.get(i).getThu() + "</td>");
					}//화요일
					if(listTable.get(i).getWed() == null || listTable.get(i).getWed().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
						+ listTable.get(i).getWed() + "</td>");
					}//수요일
					if(listTable.get(i).getTues() == null || listTable.get(i).getTues().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
						+ listTable.get(i).getTues() + "</td>");
					}//목요일
					if(listTable.get(i).getFri() == null || listTable.get(i).getFri().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
						+ listTable.get(i).getFri() + "</td>");
					}//금요일
					if(listTable.get(i).getSat() == null || listTable.get(i).getSat().equals("")){
						out.print("<td width = '130' align = 'center'></td>");
					}else{
						//out.print("<td width = '130' align = 'center' bgcolor='" + bgcolor +"'>" 
						out.print("<td width = '130' align = 'center' bgcolor='" + "green" +"'>" 
						+ listTable.get(i).getSat() + "</td>");
					}//토요일
					
				}
			}
		%>
	</table>
	<%
	}//else 끝난곳
	%>
</body>
</html>