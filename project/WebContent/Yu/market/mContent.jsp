<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장터 상세내역</title>
</head>
<body>
	<div class="columnMain">
		<h2>장터 게시판 내역</h2>
		<%
			request.setCharacterEncoding("utf-8");
			MaBoardDao mbd = MaBoardDao.getInstance();
			List<MaReplyBoard> replyList = new ArrayList<MaReplyBoard>();
			String path = request.getContextPath();
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String pageNum = request.getParameter("pageNum");
			int ref = 0, re2_level = 0, re2_step = 0;
			mbd.hits(bnum);
			MaBoard mboard = mbd.select(bnum);
			if (pageNum == null)
				pageNum = "1";
			if (bnum != 0) {
				ref = mboard.getRef();
				re2_level = mboard.getRe2_level();
				re2_step = mboard.getRe2_step();
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
					<td><%=mboard.getBnum()%></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><%=mboard.getCategory()%></td>
				</tr>

				<tr>
					<th>제목</th>
					<td><%=mboard.getTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=mboard.getWriter()%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=mboard.getS_date()%></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%=mboard.getHits()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><pre><%=mboard.getContent()%></pre></td>
				</tr>
			</table>

			<%
				if (writer.equals(mboard.getWriter())) {
			%>
			<div class="btnArea">
				<span class="btnR"> <input type="button" value="수정"
					onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/mupdateForm.jsp?bnum=<%=mboard.getBnum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="삭제"
					onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/mdeleteForm.jsp?bnum=<%=mboard.getBnum()%>'">
					<input type="button" value="목록"
					onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/maList.jsp?pageNum=<%=pageNum%>'">
				</span>
			</div>
			<%
				} else {
			%>

			<%
				}
			%>
			<form action="homeMainPage.jsp" name="frm" method="get"
				onsubmit="return chk()">
				<table class="tbTy1 detaLeft">
					<tr>
						<td colspan="2"><input type="hidden" name="pgm"
							value="../Yu/marketReply/mContentReplyPro.jsp"> <textarea
								cols="100%" name="content"></textarea> <input type="hidden"
							name="bnum" value=<%=bnum%>> <input type="hidden"
							name="pageNum" value=<%=pageNum%>> <input type="hidden"
							name="writer" value="<%=writer%>">
							<div class="btnArea">
								<span class="btnR"> <input type="submit" value="댓글달기"
									class="btnTy3">
								</span>
							</div></td>
					</tr>
				</table>
			</form>
			<div class="contents">
				<table>
					<%
						/* replyResult = cbd.inputRipple(bnum); */
						replyList = mbd.listRippleSelect(bnum);
						for (int i = 0; i < replyList.size(); i++) {
							int width = replyList.get(i).getRe_level() * 10;

							out.println("<tr><td width = '150' height = '30'> 작성자 :"
									+ replyList.get(i).getWriter() + "</td>");
							out.println("<td width = '1000'> 날짜 : "
									+ replyList.get(i).getR_date() + "</td>");

							if (writer.equals(replyList.get(i).getWriter())) {
								out.println("<td> <input type = 'button' value = '수정'"
										+ "onclick = location.href='homeMainPage.jsp?pgm=../Yu/marketReply/mUpdateReply.jsp?bnum="
										+ bnum + "&pageNum=" + pageNum + "&re_step="
										+ replyList.get(i).getRe_step() + "'></td></tr>");
								out.println("<td> <input type = 'button' value = '삭제'"
										+ "onclick = location.href='homeMainPage.jsp?pgm=../Yu/marketReply/mDeleteReplyPro.jsp?bnum="
										+ bnum + "&pageNum=" + pageNum + "&re_step="
										+ replyList.get(i).getRe_step() + "'></td></tr>");
							} else {
								out.println("<td colspan='2' width ='10%' height = '30'align = 'right'>"
										+ "<img src='http://static.naver.com/common/comment/btn_report.gif' width='60' height='25'>"
										+ "</td></tr>");
							}
							out.println("<tr><td colspan = '4'><legend>"
									+ replyList.get(i).getContent() + "</legend></td>");
							out.println("</tr>");

						}
					%>
				</table>
			</div>
		</div>
	</div>

</body>
</html>