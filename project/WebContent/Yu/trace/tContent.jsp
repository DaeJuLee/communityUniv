<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@page import="java.util.*"%>
<%@ include file="../../memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="columnMain">
		<h2>족보게시판 상세내역</h2>
		<%
			request.setCharacterEncoding("utf-8");
			String fileName = request.getParameter("fileName");
			TraBoardDao trabd = TraBoardDao.getInstance();
			List<TraReplyBoard> replyList = new ArrayList<TraReplyBoard>();
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			int ref = 0, re2_level = 0, re2_step = 0;
			trabd.hits(bnum);
			TraBoard tboard = trabd.select(bnum);
			if (pageNum == null)
				pageNum = "1";
			if (bnum != 0) {
				ref = tboard.getRef();
				re2_level = tboard.getRe2_level();
				re2_step = tboard.getRe2_step();
			}
		%>
		<div class="contents">
			<table class="tbTy1 detaLeft">
				<tbody>
					<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
		<tr>
					<th>번호</th>
					<td><%=tboard.getBnum()%></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><%=tboard.getCategory()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=tboard.getTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=tboard.getWriter()%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=tboard.getS_date()%></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%=tboard.getHits()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=tboard.getContent()%></td>
				</tr>
				</table>
				<div class="btnArea">
					<span class="btnR"> <input type="button" value="수정" class = "btnTy3"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/tupdateForm.jsp?bnum=<%=tboard.getBnum()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="삭제" class = "btnTy2"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/tdeleteForm.jsp?bnum=<%=tboard.getBnum()%>'">
						<input type="button" value="목록" class = "btnTy3"
						onclick="location.href='homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp?pageNum=<%=pageNum%>'">
					</span>
				</div>
		<form action="homeMainPage.jsp" name="frm" method="get"
				onsubmit="return chk()">
		<table class="tbTy1 detaLeft">
			<tbody>
					
			<tr>
				<td colspan="2">
					<input type="hidden" name="pgm"
								value="../Yu/traceReply/tContentReplyPro.jsp">
					<textarea cols="100%" name="content"></textarea>
					<input type="hidden" name="bnum" value=<%=bnum%>> 
					<input type="hidden" name="pageNum" value=<%=pageNum%>>
					<input type="hidden" name="writer" value="<%=writer%>">
					<div class="btnArea">
						<span class="btnR">
							<input type="submit" value="댓글달기" class="btnTy3">
						</span>
					</div>
				</td>
			</tr>
		
				</table>
	</form>
	<div class="contents">
	<table class="tbTy1 detaLeft">
		<%
			/* replyResult = cbd.inputRipple(bnum); */
			replyList = trabd.listRippleSelect(bnum);
			for (int i = 0; i < replyList.size(); i++) {
				int width = replyList.get(i).getRe_level() * 10;

				out.println("<tr><td> 작성자 :" + replyList.get(i).getWriter()
						+ "</td>");
				out.println("<td> 날짜 : " + replyList.get(i).getR_date()
						+ "</td>");

				if (writer.equals(replyList.get(i).getWriter())) {
					out.println("<td> <input type = 'button' value = '수정'"
							+ "onclick = location.href='homeMainPage.jsp?pgm=../Yu/traceReply/tUpdateReply.jsp?bnum="
							+ bnum + "&pageNum=" + pageNum + "&re_step="
							+ replyList.get(i).getRe_step() + "'></td></tr>");
				} else {
					//out.println("<td>"+writer+"는 get출력을 하는" + replyList.get(i).getWriter() +"와 같냐?</td></tr>");
					out.println("<td></td></tr>");
				}
				out.println("<tr><td colspan = '2'>"
						+ replyList.get(i).getContent() + "</td>");
				if (writer.equals(replyList.get(i).getWriter())) {
					out.println("<td> <input type = 'button' value = '삭제'"
							+ "onclick = location.href='homeMainPage.jsp?pgm=../Yu/traceReply/tDeleteReplyPro.jsp?bnum="
							+ bnum + "&pageNum=" + pageNum + "&re_step="
							+ replyList.get(i).getRe_step() + "'></td></tr>");
				} else {
					out.println("<td></td></tr>");
				}

				out.println("</tr>");
				/* if (replyList.get(i).getRe_level() > 0) {
					out.println("<img src='images/level.gif' width="
							+ width + ">" + "<img src='images/re.gif'>");
				} */
			}
		%>
	</table>
	</div>
</div>
</div>
</body>
</html>