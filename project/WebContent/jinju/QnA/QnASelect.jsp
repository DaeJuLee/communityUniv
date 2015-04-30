<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "miniproject_jj.*" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA Select</title>

<link rel="stylesheet" type="text/css" href="../../common.css">

<script type="text/javascript">
function chk(){
	if(!frm.content.value){
		alert("댓글을 입력하세요");
		return false;
	}
	return true;
}
</script>

</head>
<body>
	
	<div class="columnMain">
	<h2>QnA 상세내역</h2>
		
	<%
		QnAReplyBoard qrboard = new QnAReplyBoard();
		List<QnAReplyBoard> QnAList = new ArrayList<QnAReplyBoard>();

		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String pageNum = request.getParameter("pageNum");
		QnABoardDAO qbd = QnABoardDAO.getInstance();
		qbd.hits(bnum);
		QnABoard qboard = qbd.select(bnum);
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
			<td><%=qboard.getBnum()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=qboard.getTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=qboard.getWriter()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=qboard.getS_date()%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=qboard.getHits()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre><%=qboard.getContent()%></pre></td>
		</tr>
	</table>

	<div class="btnArea">
		<span class="btnR">
			<input type="button" value="수정" class="btnTy3" onclick="location.href='QnAUpdateForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btnTy2" onclick="location.href='QnADeleteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="목록" class="btnTy3" onclick="location.href='QnAList.jsp?pageNum=<%=pageNum%>'">
			<input type="button" value="답변작성" class="btnTy2" onclick="location.href='QnAWriteForm.jsp?bnum=<%=qboard.getBnum()%>&pageNum=<%=pageNum%>'">
		</span>
	</div>

	<form action = "../QnAReply/QnASelectReplyPro.jsp" name = "frm" method = "get" onsubmit = "return chk()">
		<!-- 위에  name => bnum과 pageNum 두개의 값을 정해놨다.action을 취하면 값이 넘어간다. -->
		<table class="tbTy1 detaLeft">
			<tr>
				<td colspan="2">
					<textarea cols="100%" name = "content"></textarea>
					<input type="hidden" name="bnum" value=<%=bnum%>> 
					<input type="hidden" name="pageNum" value=<%=pageNum %>>
				
					<div class="btnArea">
						<span class="btnR">
							<input type="submit" value="확인" class="btnTy3">
						</span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class = "contents">
	<table class="tbTy1 detaLeft">
		<%
			QnABoardDAO qbdd = QnABoardDAO.getInstance();
			/* replyResult = cbd.inputRipple(bnum); */
			QnAList = qbdd.listRippleSelect(bnum);
			for(int i = 0 ; i < QnAList.size(); i++){
				int width = QnAList.get(i).getRe_level() * 10;
				
				out.println("<tr><td> 작성자 : *****" + "</td>");
				out.println("<td> 날짜 : " + QnAList.get(i).getR_date() + "</td>");
				out.println("<td> <input type = 'button' value = '수정'"+
						"onclick = location.href='../QnAReply/QnAUpdateReply.jsp?bnum=" +
						bnum + "&pageNum=" + pageNum + "&re_step=" + QnAList.get(i).getRe_step() + 
						"'></td></tr>");
				//두번째 줄
				out.println("<tr><td colspan = '2'>" + QnAList.get(i).getContent() + "</td>");
				out.println("<td> <input type = 'button' value = '삭제'"+
						"onclick = location.href='../QnAReply/QnADeleteReplyPro.jsp?bnum=" +
						bnum + "&pageNum=" + pageNum + "&re_step=" + QnAList.get(i).getRe_step() + 
						"'></td>");
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