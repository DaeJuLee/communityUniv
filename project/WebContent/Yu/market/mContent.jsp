<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<%@ include file="../../memberCheck.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {	width: 80%;}
.jiin {	text-align: left; }
h2 {text-align: center;}
.yu{ text-align: left;  width: 10%; }
.nn{ text-align: right; width: 90%;}
.r{ border-top: thick;}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MaBoardDao mbd = MaBoardDao.getInstance();
	List<MaReplyBoard> replyList = new ArrayList<MaReplyBoard>();
    String path = request.getContextPath();
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String pageNum = request.getParameter("pageNum");
	int  ref = 0, re2_level = 0, re2_step = 0;
	mbd.hits(bnum);
	MaBoard mboard =mbd.select(bnum);
	if (pageNum == null) pageNum = "1";
	if ( bnum != 0) {		
		ref = mboard.getRef();
		re2_level = mboard.getRe2_level();
		re2_step = mboard.getRe2_step();
	}
%>
	<h2>장터 게시판 내역</h2>
	<table>
		<tr>
			<td colspan="2" class="jiin">No.<%=mboard.getBnum() + "&nbsp" + "&nbsp" + 
						mboard.getCategory()+ "&nbsp" + mboard.getTitle()%></td>
		</tr>
		<tr>
			<td class="yu"><%=mboard.getWriter()%></td>
			<td class="nn">작성일:<%=mboard.getS_date() +"&nbsp&nbsp&nbsp"+ "조회수: "
					+ mboard.getHits()%></td>
		</tr>
		<tr><td><%-- <img width="500" height="500" id="image" src="<%=path%>/pro/se2/imges/"> --%></td>
		<tr>
			<td colspan="2" height="500px" valign="top"><%=mboard.getContent()%></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="수정" onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/mupdateForm.jsp?bnum=<%=mboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/mdeleteForm.jsp?bnum=<%=mboard.getBnum()%>'">
			<input type="button" value="목록" onclick="location.href='homeMainPage.jsp?pgm=../Yu/market/maList.jsp?pageNum=<%=pageNum%>'"></td>
		</tr></table>
		<form action="homeMainPage.jsp" name="frm" method="get" onsubmit="return chk()">
		<table>
			<tbody>
					
			<tr>
				<td colspan="2">
					<input type = "hidden" name = "pgm" value = "../Yu/marketReply/mContentReplyPro.jsp">
					<textarea cols="100%" name = "content"></textarea>
					<input type="hidden" name="bnum" value=<%=bnum%>> 
					<input type="hidden" name="pageNum" value=<%=pageNum %>>
					<input type="hidden" name="writer" value="<%=writer %>">
					<div>
						<span >
							<input type="submit" value="댓글달기" >
						</span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div>
	<table>
		<%
			/* replyResult = cbd.inputRipple(bnum); */
			replyList = mbd.listRippleSelect(bnum);
			for(int i = 0 ; i < replyList.size(); i++){
				int width = replyList.get(i).getRe_level() * 10;
				
				out.println("<tr><td width = '150' height = '30'> 작성자 :" + replyList.get(i).getWriter() + "</td>");
				out.println("<td width = '1000'> 날짜 : " + replyList.get(i).getR_date() + "</td>");
				
				if(writer.equals(replyList.get(i).getWriter())){
					out.println("<td> <input type = 'button' value = '수정'"+
							"onclick = location.href='homeMainPage.jsp?pgm=../Yu/marketReply/mUpdateReply.jsp?bnum=" +
							bnum + "&pageNum=" + pageNum + "&re_step=" + replyList.get(i).getRe_step() + 
							"'></td></tr>");
					out.println("<td> <input type = 'button' value = '삭제'"+
							"onclick = location.href='homeMainPage.jsp?pgm=../Yu/marketReply/mDeleteReplyPro.jsp?bnum=" +
							bnum + "&pageNum=" + pageNum + "&re_step=" + replyList.get(i).getRe_step() + 
							"'></td></tr>");
				}else{
					out.println("<td colspan='2' width ='10%' height = '30'align = 'right'>"+
							"<img src='http://static.naver.com/common/comment/btn_report.gif' width='60' height='25'>"+
							"</td></tr>");
				}
				out.println("<tr><td colspan = '4'><legend>" + replyList.get(i).getContent() + "</legend></td>");
				out.println("</tr>");
				
			}
		%>
	</table>
	</div>
</body>
</html>