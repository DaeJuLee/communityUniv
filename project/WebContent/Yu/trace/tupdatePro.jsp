<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<%@ page import="java.io.*" import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>

<jsp:useBean id="traBoard" class="project.TraBoard"></jsp:useBean>
<jsp:setProperty property="*" name="traBoard"/>
<%
	request.setCharacterEncoding("utf-8");
	int maxSize = 5 * 1024 * 1024;
	String uri  = request.getRequestURI(); 
	String path = request.getContextPath(); 
	String command = uri.substring(path.length()+1);
	String fileSave = "/upload";
	String realPath = request.getServletContext().getRealPath(fileSave);
	MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8", new DefaultFileRenamePolicy());
	Enumeration en = multi.getFileNames();
	String name = (String)en.nextElement(); 
	String fileName = multi.getFilesystemName(name); 
	File file = multi.getFile(name); 
	int fileSize = (int)file.length();
	traBoard.setFileName(fileName);
	traBoard.setFileSize(fileSize);
	TraBoardDao pd = TraBoardDao.getInstance();
	String category = multi.getParameter("category");
	traBoard.setCategory(category);
	String title = multi.getParameter("title");
	traBoard.setTitle(title);
	String writer = multi.getParameter("writer");
	traBoard.setWriter(writer);
	String content = multi.getParameter("content");
	traBoard.setContent(content);
	String bpass = multi.getParameter("bpass");
	traBoard.setBpass(bpass);
	int bnum =Integer.parseInt(multi.getParameter("bnum"));
	traBoard.setBnum(bnum);	
	String pageNum = multi.getParameter("pageNum");
	
	TraBoardDao bd = TraBoardDao.getInstance();
	traBoard.setHits(0);
	traBoard.setIp(request.getRemoteAddr());
	int result = bd.update(traBoard);
	if (result > 0) {
%>
	<script type="text/javascript">
		alert("입력 완료");  location.href = "homeMainPage.jsp?pgm=../Yu/trace/traceList.jsp?pageNum="+<%=pageNum%>;
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("안됨...");
		history.go(-1);
	</script>
<% } %>
</body>
</html>