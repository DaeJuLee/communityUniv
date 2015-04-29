<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.io.*"%>
<%
	 OutputStream outStream = null;
	 FileInputStream fileStream = null;
	 try {
	  String fileName = request.getParameter("fileName");
	  String filePath = request.getServletContext().getRealPath("/")+"upload/";  
	  
	
	  response.setContentType("application/x-msdownload");
	  String convName1 =
	   java.net.URLEncoder.encode(fileName,"UTF-8");
	  
	
	  response.setHeader("Content-Disposition", "attachment;fileName=" + convName1 + ";");
	
	  String convName2 = fileName;
	  File file = new File(filePath+convName2);
	  
	  byte[] byteStream = new byte[(int)file.length()];
	  fileStream = new FileInputStream(file);
	  int i=0;
	  int j=0;
	  while( (i=fileStream.read()) != -1 ){
	   byteStream[j] = (byte)i;
	   j++;
	  }
	  out.clear(); 
	  out=pageContext.pushBody(); 
	  outStream = response.getOutputStream();
	  outStream.write(byteStream);
	 }catch(Exception e) {
	  System.out.println(e);
	 }finally {
	  if(fileStream != null) fileStream.close();
	  if(outStream != null) outStream.close();
	 }
%>