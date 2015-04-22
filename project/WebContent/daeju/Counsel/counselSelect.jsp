<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counsel Select</title>
</head>
<body>

	<%
		/* int replyResult = 1;  */
		/*리블 조회하기 위해 필요한 코드 시작  */
		CounselReplyBoard crboard = new CounselReplyBoard();
		List<CounselReplyBoard> replyList = new ArrayList<CounselReplyBoard>();
		/*리블 조회하기 위해 필요한 코드 끝 */
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		cbd.hits(bnum);
		CounselBoard cboard = cbd.select(bnum);
	%>
	<table border="1">
		<caption>
			<h2>게시판 상세내역</h2>
		</caption>
		<tr>
			<td>번호</td>
			<td><%=cboard.getBnum()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=cboard.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>*****<input type="hidden" value="<%=cboard.getWriter()%>"></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=cboard.getS_date()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=cboard.getHits()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre><%=cboard.getContent()%></pre></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='counselUpdateForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답변작성" onclick="location.href='counselWriteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="삭제" onclick="location.href='counselDeleteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="목록" onclick="location.href='counselList.jsp?pageNum=<%=pageNum%>'"></td>
			</td>
		</tr>
	</table>
<!-- 리플 입력 테이블 -->
	<form action = "">
		<table>
			<tr>
				<td><textarea rows="5" cols="25"></textarea></td>
				<td><input type = "submit" value = "리플작성완료"></td>
			</tr>
		</table>
	</form>
<!-- 리플 조회 테이블 -->	
			<table>
		
		<%
		CounselBoardDAO cbdd = CounselBoardDAO.getInstance();
			/* replyResult = cbd.inputRipple(bnum); */
			replyList = cbdd.listRippleSelect(bnum);
			for(int i = 0 ; i < replyList.size(); i++){
				int width = replyList.get(i).getRe_level() * 10;
				
				out.println("<tr><td> 작성자 : *****" + "</td>");
				out.println("<td> 날짜 : " + replyList.get(i).getR_date() + "</td>");
				out.println("<td rowspan = '2'> <input type = 'button' value = '삭제'></td></tr>");
				//두번째 줄
				out.println("<tr><td colspan = '2'>" + replyList.get(i).getContent() + "</td></tr>");
				if (replyList.get(i).getRe_level() > 0) {
					out.println("<img src='images/level.gif' width="
							+ width + ">" + "<img src='images/re.gif'>");
				}
				
			}
		%>
		
		</table>
	
</body>
</html>