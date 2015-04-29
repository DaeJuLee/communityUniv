<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	TraBoardDao bd = TraBoardDao.getInstance();
	TraBoard tboard = new TraBoard();
	for (int i = 1; i < 154; i++) {
		tboard.setWriter("3조" + i);
		tboard.setTitle("아씨" + i);
		tboard.setWriter("공사중"+i);
		tboard.setContent("대박 넌 누구냐 헐 ~ " + i);
		tboard.setHits(0);
		tboard.setBpass("1");
		tboard.setFileName("이건 실험용");
		tboard.setFileSize(0);
		tboard.setRe2_step(0);
		tboard.setRe2_level(0);
		tboard.setIp(request.getRemoteAddr());	
		bd.insert(tboard);
	}
%>
입력 성공
</body>
</html>