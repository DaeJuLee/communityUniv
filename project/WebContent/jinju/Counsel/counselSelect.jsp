<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counsel Select</title>
<script type="text/javascript">
function chk(){
	if(!frm.content.value){
		alert("댓글을 입력하세요");
		return false;
	}
	return true;
}
</script>
<link rel="stylesheet" type="text/css" href="../../common.css">
</head>
<body>

	<div class="columnMain">
	<h2>고민상담 상세내역</h2>

	<%
		int replyResult = 1; /* 이건 하는건지 아닌건지 모르겠음 */
		CounselReplyBoard crboard = new CounselReplyBoard();
		List<CounselReplyBoard> replyList = new ArrayList<CounselReplyBoard>();
	
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		CounselBoardDAO cbd = CounselBoardDAO.getInstance();
		cbd.hits(bnum);
		CounselBoard cboard = cbd.select(bnum);
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
			<td><%=cboard.getBnum()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=cboard.getTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>*****<input type="hidden" value="<%=cboard.getWriter()%>"></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=cboard.getS_date()%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=cboard.getHits()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre><%=cboard.getContent()%></pre></td>
		</tr>
	</table>
		
	<div class="btnArea">
		<span class="btnR">
			<input type="button" class="btnTy3" value="수정" onclick="location.href='homeMainPage.jsp?pgm=../jinju/Counsel/counselUpdateForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy2" value="답변작성" onclick="location.href='homeMainPage.jsp?pgm=../jinju/Counsel/counselWriteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy3" value="삭제" onclick="location.href='homeMainPage.jsp?pgm=../jinju/Counsel/counselDeleteForm.jsp?bnum=<%=cboard.getBnum()%>&pageNum=<%=pageNum%>'">
				<input type="button" class="btnTy2" value="목록" onclick="location.href='homeMainPage.jsp?pgm=../jinju/Counsel/counselList.jsp?pageNum=<%=pageNum%>'">
		</span>
	</div>

	<!-- <form action="homeMainPage.jsp?pgm=../CounselReply/counselSelectReplyPro.jsp" name="frm" method="get" onsubmit="return chk()"> -->
	<form action="homeMainPage.jsp" name="frm" method="get" onsubmit="return chk()">
		<table class="tbTy1 detaLeft">
			<tbody>
					
			<tr>
				<td colspan="2">
					<input type = "hidden" name = "pgm" value = "../jinju/CounselReply/counselSelectReplyPro.jsp">
					<textarea cols="100%" name = "content"></textarea>
					<input type="hidden" name="bnum" value=<%=bnum%>> 
					<input type="hidden" name="pageNum" value=<%=pageNum %>>
				
					<div class="btnArea">
						<span class="btnR">
							<input type="submit" value="댓글달기" class="btnTy3">
						</span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class = "contents">
	<table class="tbTy1 detaLeft">
		<%
			CounselBoardDAO cbdd = CounselBoardDAO.getInstance();
			/* replyResult = cbd.inputRipple(bnum); */
			replyList = cbdd.listRippleSelect(bnum);
			for(int i = 0 ; i < replyList.size(); i++){
				int width = replyList.get(i).getRe_level() * 10;
				
				out.println("<tr><td> 작성자 : *****" + "</td>");
				out.println("<td> 날짜 : " + replyList.get(i).getR_date() + "</td>");
				out.println("<td> <input type = 'button' value = '수정'"+
						"onclick = location.href='homeMainPage.jsp?pgm=../jinju/CounselReply/counselUpdateReply.jsp?bnum=" +
						bnum + "&pageNum=" + pageNum + "&re_step=" + replyList.get(i).getRe_step() + 
						"'></td></tr>");
				//두번째 줄
				out.println("<tr><td colspan = '2'>" + replyList.get(i).getContent() + "</td>");
				out.println("<td> <input type = 'button' value = '삭제'"+
						"onclick = location.href='homeMainPage.jsp?pgm=../jinju/CounselReply/counselDeleteReplyPro.jsp?bnum=" +
						bnum + "&pageNum=" + pageNum + "&re_step=" + replyList.get(i).getRe_step() + 
						"'></td></tr>");
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