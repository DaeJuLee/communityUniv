<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<%@ page import="java.sql.Timestamp,com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*,java.io.*"%> 
<%@ page import="java.awt.Graphics2D"%>
<%@ page import="java.awt.image.renderable.ParameterBlock"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.media.jai.JAI"%>
<%@ page import="javax.media.jai.RenderedOp"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String realFolder = "";
	String fileName ="";
	MultipartRequest imageUp = null;
	String saveFolder = "/Yu/fileImg";
	String encType = "utf-8"; 
	int maxSize = 5*1024*1024; 
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);  
	
	try{
	   imageUp = new MultipartRequest(request,realFolder,
	      maxSize,encType,new DefaultFileRenamePolicy());   
	
	Enumeration files = imageUp.getFileNames();   
	while(files.hasMoreElements()){
	   String name = (String)files.nextElement();   
	   fileName = imageUp.getFilesystemName(name);
	   ParameterBlock pb=new ParameterBlock();
	   // 서버에 저장된 원본파일의 경로로 파라메터블록에 추가
	   //위에서 가져온 파일이름을 받아서 이미지페스에 지정한 폴더속에 파일을 만들어줌
	   pb.add(realFolder+"/"+fileName);
	   //자이로 파라메터블록을 로드하여 RenderedOp 에 삽입
	   RenderedOp rOp=JAI.create("fileload",pb); 
	   //불러온 이미지를 BuffedImage에 담는다.
	   BufferedImage bi= rOp.getAsBufferedImage();
	   //thumb라는 이미지 버퍼를 생성, 버퍼의 사이즈는 100*100으로 설정.
	   BufferedImage thumb=new BufferedImage(100,100,
	         BufferedImage.TYPE_INT_RGB); 
	   Graphics2D g=thumb.createGraphics(); 
	   //버퍼사이즈 100*100으로 맞춰 그리자
	   g.drawImage(bi,0,0,100,100,null); 
	   /*출력할 위치와 파일이름을 설정하고 섬네일 이미지를 생성한다. 저장하는 타입을 jpg로 설정.*/
	    //그 변형한 파일을 파일명 변경시킨다
	   File file1=new File(realFolder+"/sm_"+fileName);
	   //버퍼공간의 영역에 변경한 이미지 파일명을 불러와 jpg속성으로 출력시킨다
	   ImageIO.write(thumb,"jpg",file1);
	}
	}catch(Exception e){ e.printStackTrace();    }
	
	MaBoard mboard = new MaBoard();
	ArrayList<MaBoard> list = new ArrayList<MaBoard>();
	
	String category= imageUp.getParameter("category");
	String title=imageUp.getParameter("title");
	String writer= imageUp.getParameter("writer");
	String content= imageUp.getParameter("content");
	String bpass= imageUp.getParameter("bpass");
	int bnum = Integer.parseInt(imageUp.getParameter("bnum"));//수정 부분
	System.out.println("bnum : "+bnum);
	String pageNum = imageUp.getParameter("pageNum");
	
	mboard.setCategory(category);
	mboard.setTitle(title);
	mboard.setWriter(writer); 
	mboard.setContent(content);
	mboard.setBpass(bpass);
	mboard.setBnum(bnum);

	mboard.setIp(request.getRemoteAddr());
	MaBoardDao bd = MaBoardDao.getInstance();
	int result = bd.update(mboard);
	if (result > 0) {
%>
<script type="text/javascript">
      alert("수정이 완료 되었습니다.");
      location.href="homeMainPage.jsp?pgm=../Yu/market/mContent.jsp?bnum=<%=bnum%>&pageNum=<%=pageNum%>";
   </script>
<%
}else{ 
%>
	<script type="text/javascript">
		alert("다시 입력해주십시오");
		history.go(-1);
	</script>
<% } %>
</body>
</html>