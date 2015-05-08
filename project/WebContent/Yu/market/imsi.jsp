<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<%
	MaBoardDao bd = MaBoardDao.getInstance();
	MaBoard mboard = new MaBoard();
	for (int i = 1; i < 154; i++) {
		mboard.setWriter("3조" + i);
		mboard.setTitle("룰루" + i);
		mboard.setContent("Love Like You Do" + i);
		mboard.setHits(0);
		mboard.setBpass("1");
		mboard.setRe2_step(0);
		mboard.setRe2_level(0);
		mboard.setIp(request.getRemoteAddr());	
		bd.insert(mboard);
	}
%>
입력 성공
</body>
</html>